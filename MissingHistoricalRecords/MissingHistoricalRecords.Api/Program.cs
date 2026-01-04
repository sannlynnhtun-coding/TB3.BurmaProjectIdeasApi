using Microsoft.EntityFrameworkCore;
using MissingHistoricalRecords.Api.Services;
using MissingHistoricalRecords.Database.AppDbContextModels;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddDbContext<MissingHistoricalRecordsDbContext>(
    options =>
    {
        options.UseSqlServer(builder.Configuration.GetConnectionString("MissingHistoricalDbConnection")!);
    });

builder.Services.AddScoped<IBookTitleService, BookTitleService>();
builder.Services.AddScoped<IBookContentService, BookContentService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
