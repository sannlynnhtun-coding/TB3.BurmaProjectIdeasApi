using Snake.Api.Dtos;
using Snake.Database.AppDbContextModels;
using static Snake.Api.Enums.Enum;

namespace Snake.Api.Services;

public class SnakeService : ISnakeService
{
    private readonly SnakeDbContext _db;

    public SnakeService(SnakeDbContext snakeDbContext)
    {
        _db = snakeDbContext;
    }

    public SnakesResponseDto GetSnakes(int pageNo, int pageSize)
    {
        SnakesResponseDto dto;
        if(pageNo == 0 || pageSize == 0)
        {
            dto = new SnakesResponseDto
            {
                Type = EnumResultType.ValidationError,
                Message = "Page number and page size must not be zero"
            };
            return dto;
        }
        var result = _db.TblSnakes.OrderByDescending(x => x.Id).Skip((pageNo - 1) * 10).Take(pageSize).ToList();
        var lst = result.Select(x => new SnakeDto
        {
            Id = x.Id,
            MMName = x.Mmname,
            EngName = x.EngName,
            Detail = x.Details,
            IsPoison = x.IsPoison,
            IsDanger = x.IsDanger
        }).ToList();

        dto = new SnakesResponseDto
        {
            Type = EnumResultType.Success,
            Message = "Success",
            Snakes = lst
        };
        return dto;
    }

    public SnakeResponseDto GetSnakeById(int id)
    {
        SnakeResponseDto dto;
        var result = _db.TblSnakes.FirstOrDefault(x => x.Id == id);
        if(result is null)
        {
            dto = new SnakeResponseDto
            {
                Type = EnumResultType.NotFound,
                Message = "Id not found"
            };
            return dto;
        }
        SnakeDto snake = new SnakeDto()
        {
            Id = result.Id,
            MMName = result.Mmname,
            EngName = result.EngName,
            Detail = result.Details,
            IsPoison = result.IsPoison,
            IsDanger = result.IsDanger
        };
        dto = new SnakeResponseDto
        {
            Type = EnumResultType.Success,
            Message = "Success",
            Snake = snake
        };
        return dto;
    }

    public SnakeResponseDto CreateSnake(SnakeRequestDto requestDto)
    {
        SnakeResponseDto dto;
        if(requestDto.MMName is null)
        {
            dto = new SnakeResponseDto
            {
                Type = EnumResultType.ValidationError,
                Message = "MMName is missing"
            };
            return dto;
        }
        if (requestDto.EngName is null)
        {
            dto = new SnakeResponseDto
            {
                Type = EnumResultType.ValidationError,
                Message = "EngName is missing"
            };
            return dto;
        }
        if (requestDto.Detail is null)
        {
            dto = new SnakeResponseDto
            {
                Type = EnumResultType.ValidationError,
                Message = "Detail is missing"
            };
            return dto;
        }
        if (requestDto.IsPoison is null)
        {
            dto = new SnakeResponseDto
            {
                Type = EnumResultType.ValidationError,
                Message = "IsPoison is missing"
            };
            return dto;
        }
        if (requestDto.IsDanger is null)
        {
            dto = new SnakeResponseDto
            {
                Type = EnumResultType.ValidationError,
                Message = "IsDanger is missing"
            };
            return dto;
        }

        var newSnakeEntity = new TblSnake
        {
            Mmname = requestDto.MMName,
            EngName = requestDto.EngName,
            Details = requestDto.Detail,
            IsDanger = requestDto.IsDanger,
            IsPoison = requestDto.IsPoison
        };
        _db.TblSnakes.Add(newSnakeEntity);

        var result = _db.SaveChanges();

        if(result > 0)
        {
            SnakeDto snake = new SnakeDto()
            {
                Id = newSnakeEntity.Id,
                MMName = requestDto.MMName,
                EngName = requestDto.EngName,
                Detail = requestDto.Detail,
                IsDanger = requestDto.IsDanger,
                IsPoison = requestDto.IsPoison
            };
            dto = new SnakeResponseDto
            {
                Type = EnumResultType.Success,
                Message = "Success",
                Snake = snake
            };
            return dto;
        }

        dto = new SnakeResponseDto
        {
            Type = EnumResultType.SystemError,
            Message = "Failed to create"
        };
        return dto;
    }
    public SnakeResponseDto UpdateSnake(int id, SnakeRequestDto requestDto)
    {
        SnakeResponseDto dto;
        string? MMName = requestDto.MMName;
        string? EngName = requestDto.EngName;
        string? Detail = requestDto.Detail;
        string? IsPoison = requestDto.IsPoison;
        string? IsDanger = requestDto.IsDanger;

        var result = _db.TblSnakes.FirstOrDefault(x => x.Id == id);
        if (result is null)
        {
            dto = new SnakeResponseDto
            {
                Type = EnumResultType.NotFound,
                Message = "Id not found"
            };
            return dto;
        }

        if(MMName is null && EngName is null && Detail is null && IsPoison is null && IsDanger is null)
        {
            dto = new SnakeResponseDto
            {
                Type = EnumResultType.ValidationError,
                Message = "There is nothing to update. Give at least the value of one field to update."
            };
            return dto;
        }

        if(MMName is not null)
        {
            result.Mmname = MMName;
        }
        if(EngName is not null)
        {
            result.EngName = EngName;
        }
        if (Detail is not null)
        {
            result.Details = Detail;
        }
        if (IsPoison is not null)
        {
            result.IsPoison = IsPoison;
        }
        if (IsDanger is not null)
        {
            result.IsDanger = IsDanger;
        }

        int Dbresult = _db.SaveChanges();
        if (Dbresult > 0)
        {
            var snake = GetSnakeById(result.Id);

            dto = new SnakeResponseDto
            {
                Type = EnumResultType.Success,
                Message = "Successfully updated.",
                Snake = snake.Snake
            };
            return dto;
        }
        dto = new SnakeResponseDto
        {
            Message = "Fail to update.",
            Type = EnumResultType.SystemError
        };
        return dto;
    }
}

