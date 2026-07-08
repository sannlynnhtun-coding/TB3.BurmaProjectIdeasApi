using System.Text.Json;
using MovieTicketOnlineBookingSystem.Api.Models;

namespace MovieTicketOnlineBookingSystem.Api.Services;

public class MovieTicketDataStore
{
    private static readonly JsonSerializerOptions JsonOptions = new()
    {
        PropertyNameCaseInsensitive = true
    };

    public MovieTicketData Data { get; }

    public MovieTicketDataStore(IWebHostEnvironment env)
    {
        var filePath = Path.Combine(env.ContentRootPath, "Data", "movie-ticket.json");
        var json = File.ReadAllText(filePath);
        Data = JsonSerializer.Deserialize<MovieTicketData>(json, JsonOptions) ?? new MovieTicketData();
    }
}
