using BurmaProjectIdeasYarp.Services;
using BurmaProjectIdeasYarp;
using Yarp.ReverseProxy.Configuration;
using Scalar.AspNetCore;

var builder = WebApplication.CreateBuilder(args);
builder.Configuration.AddJsonFile("api-settings.json", optional: true, reloadOnChange: false);

// Add MVC services
builder.Services.AddControllersWithViews();

// Add OpenAPI/Swagger
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new Microsoft.OpenApi.OpenApiInfo
    {
        Title = "Burma Project Ideas API Gateway",
        Version = "v1",
        Description = "YARP Reverse Proxy Gateway for Burma Project Ideas APIs"
    });
});

builder.Services.AddSingleton<YarpConfigService>();

// Custom proxy config provider that uses DynamicProxyConfigProvider
builder.Services.AddSingleton<IProxyConfigProvider, DynamicProxyConfigProvider>();

// Add YARP services
builder.Services.AddReverseProxy();

var app = builder.Build();

// Configure the HTTP request pipeline
if (app.Environment.IsDevelopment())
{
    app.UseDeveloperExceptionPage();
}

app.UseStaticFiles();
app.UseRouting();
app.UseHttpsRedirection();

// Add Swagger
app.UseSwagger();
app.UseSwaggerUI(c =>
{
    c.SwaggerEndpoint("/swagger/v1/swagger.json", "Burma Project Ideas API Gateway v1");
    c.RoutePrefix = "swagger";
});

if (app.Environment.IsDevelopment())
{
    app.MapScalarApiReference(options =>
    {
        options.WithOpenApiRoutePattern("/swagger/v1/swagger.json");
    });
}

// Map MVC routes
app.MapControllers();
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.MapReverseProxy();

app.Run();
