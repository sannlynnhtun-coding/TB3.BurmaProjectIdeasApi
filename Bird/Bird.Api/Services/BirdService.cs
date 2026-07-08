using System.Text.Json;
using Bird.Api.Dtos;
using BirdRecord = Bird.Api.Dtos.Bird;

namespace Bird.Api.Services;

public class BirdService : IBirdService
{
    private static readonly JsonSerializerOptions JsonOptions = new()
    {
        PropertyNameCaseInsensitive = true
    };

    private readonly List<BirdRecord> _birds;

    public BirdService(IWebHostEnvironment env)
    {
        var filePath = Path.Combine(env.ContentRootPath, "Data", "birds.json");
        var json = File.ReadAllText(filePath);
        _birds = JsonSerializer.Deserialize<List<BirdRecord>>(json, JsonOptions) ?? new List<BirdRecord>();
    }

    public BirdGetResponseDto GetBirds(int pageNo, int pageSize, string? search)
    {
        if (pageNo <= 0)
        {
            return new BirdGetResponseDto
            {
                IsSuccess = false,
                Message = "Page number must be greater than zero"
            };
        }

        if (pageSize <= 0)
        {
            return new BirdGetResponseDto
            {
                IsSuccess = false,
                Message = "Page size must be greater than zero"
            };
        }

        IEnumerable<BirdRecord> query = _birds;

        if (!string.IsNullOrWhiteSpace(search))
        {
            query = query.Where(x =>
                x.BirdMyanmarName.Contains(search, StringComparison.OrdinalIgnoreCase) ||
                x.BirdEnglishName.Contains(search, StringComparison.OrdinalIgnoreCase));
        }

        var birds = query
            .OrderByDescending(x => x.Id)
            .Skip((pageNo - 1) * pageSize)
            .Take(pageSize)
            .Select(item => new BirdDto
            {
                BirdMyanmarName = item.BirdMyanmarName,
                BirdEnglishName = item.BirdEnglishName,
                Description = item.Description,
                ImagePath = item.ImagePath,
            })
            .ToList();

        return new BirdGetResponseDto
        {
            IsSuccess = true,
            Message = "Success",
            Birds = birds
        };
    }

    public BirdGetByIdResponseDto GetBird(int id)
    {
        var bird = _birds
            .Where(x => x.Id == id)
            .Select(item => new BirdDto
            {
                BirdMyanmarName = item.BirdMyanmarName,
                BirdEnglishName = item.BirdEnglishName,
                Description = item.Description,
                ImagePath = item.ImagePath
            })
            .FirstOrDefault();

        if (bird is null)
        {
            return new BirdGetByIdResponseDto
            {
                IsSuccess = false,
                Message = "Bird not found"
            };
        }

        return new BirdGetByIdResponseDto
        {
            IsSuccess = true,
            Message = "Success",
            Bird = bird
        };
    }

    public BirdResponseDto CreateBird(BirdCreateRequestDto request) => ReadOnly();

    public BirdResponseDto UpdateBird(int id, BirdUpdateRequestDto request) => ReadOnly();

    public BirdResponseDto DeleteBird(int id) => ReadOnly();

    public string SeedBird() => "Read-only JSON data source.";

    private static BirdResponseDto ReadOnly() => new()
    {
        IsSuccess = false,
        Message = "Read-only JSON data source."
    };
}
