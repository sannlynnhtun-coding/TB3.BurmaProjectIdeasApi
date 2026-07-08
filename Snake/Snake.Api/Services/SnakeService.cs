using System.Text.Json;
using Snake.Api.Dtos;
using static Snake.Api.Enums.Enum;

namespace Snake.Api.Services;

public class SnakeService : ISnakeService
{
    private static readonly JsonSerializerOptions JsonOptions = new()
    {
        PropertyNameCaseInsensitive = true
    };

    private readonly List<SnakeDto> _snakes;

    public SnakeService(IWebHostEnvironment env)
    {
        var filePath = Path.Combine(env.ContentRootPath, "Data", "snakes.json");
        var json = File.ReadAllText(filePath);
        _snakes = JsonSerializer.Deserialize<List<SnakeDto>>(json, JsonOptions) ?? new List<SnakeDto>();
    }

    public SnakesResponseDto GetSnakes(int pageNo, int pageSize)
    {
        if (pageNo <= 0 || pageSize <= 0)
        {
            return new SnakesResponseDto
            {
                Type = EnumResultType.ValidationError,
                Message = "Page number and page size must not be zero"
            };
        }

        var snakes = _snakes
            .OrderByDescending(x => x.Id)
            .Skip((pageNo - 1) * pageSize)
            .Take(pageSize)
            .ToList();

        return new SnakesResponseDto
        {
            Type = EnumResultType.Success,
            Message = "Success",
            Snakes = snakes
        };
    }

    public SnakeResponseDto GetSnakeById(int id)
    {
        var snake = _snakes.FirstOrDefault(x => x.Id == id);
        if (snake is null)
        {
            return new SnakeResponseDto
            {
                Type = EnumResultType.NotFound,
                Message = "Id not found"
            };
        }

        return new SnakeResponseDto
        {
            Type = EnumResultType.Success,
            Message = "Success",
            Snake = snake
        };
    }

    public SnakeResponseDto CreateSnake(SnakeRequestDto requestDto) => ReadOnly();

    public SnakeResponseDto UpdateSnake(int id, SnakeRequestDto requestDto) => ReadOnly();

    private static SnakeResponseDto ReadOnly() => new()
    {
        Type = EnumResultType.ValidationError,
        Message = "Read-only JSON data source."
    };
}
