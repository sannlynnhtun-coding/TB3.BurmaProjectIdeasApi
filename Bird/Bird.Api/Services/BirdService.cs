using Bird.Api.Dtos;
using Bird.Database.BirdDbContextModels;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace Bird.Api.Services;

public class BirdService : IBirdService
{
    private readonly BirdDbContext _db;

    public BirdService(BirdDbContext birdDbContext)
    {
        _db = birdDbContext;
    }

    public BirdGetResponseDto GetBirds(int pageNo, int pageSize, string? search)
    {
        var query = _db.TblBirds
            .AsNoTracking();
        
        if (pageNo <= 0)
        {
            return new BirdGetResponseDto()
            {
                IsSuccess = false,
                Message = "Page number must be greater than zero"
            };
        }

        if (pageSize <= 0)
        {
            return new BirdGetResponseDto()
            {
                IsSuccess = false,
                Message = "Page size must be greater than zero"
            };
        }

        if (!string.IsNullOrWhiteSpace(search))
        {
            query = query.Where(x =>
                x.BirdMyanmarName.Contains(search) ||
                x.BirdEnglishName.Contains(search));
        }

        var birds = query
            .Skip((pageNo - 1) * pageSize)
            .Take(pageSize)
            .OrderByDescending(x => x.Id)
            .Select(item => new BirdDto()
            {
                BirdMyanmarName = item.BirdMyanmarName,
                BirdEnglishName = item.BirdEnglishName,
                Description = item.Description,
                ImagePath = item.ImagePath,
            })
            .ToList();

        return new BirdGetResponseDto()
        {
            IsSuccess = true,
            Message = "Success",
            Birds = birds
        };
    }

    public BirdGetByIdResponseDto GetBird(int id)
    {
        var bird = _db.TblBirds
            .AsNoTracking()
            .Where(x => x.Id == id)
            .Select(item => new BirdDto()
            {
                BirdMyanmarName = item.BirdMyanmarName,
                BirdEnglishName = item.BirdEnglishName,
                Description = item.Description,
                ImagePath = item.ImagePath
            })
            .FirstOrDefault();

        if (bird is null)
        {
            return new BirdGetByIdResponseDto()
            {
                IsSuccess = false,
                Message = "Bird not found"
            };
        }

        return new BirdGetByIdResponseDto()
        {
            IsSuccess = true,
            Message = "Success",
            Bird = bird
        };
    }

    public BirdResponseDto CreateBird(BirdCreateRequestDto request)
    {
        if (string.IsNullOrWhiteSpace(request.BirdMyanmarName))
        {
            return new BirdResponseDto()
            {
                IsSuccess = false,
                Message = "Bird name is required"
            };
        }
        
        if (string.IsNullOrWhiteSpace(request.BirdEnglishName))
        {
            return new BirdResponseDto()
            {
                IsSuccess = false,
                Message = "Bird name is required"
            };
        }

        if (string.IsNullOrWhiteSpace(request.Description))
        {
            return new BirdResponseDto()
            {
                IsSuccess = false,
                Message = "Description is required"
            };
        }

        if (string.IsNullOrWhiteSpace(request.ImagePath))
        {
            return new BirdResponseDto()
            {
                IsSuccess = false,
                Message = "ImagePath is required"
            };
        }

        var bird = new TblBird()
        {
            BirdMyanmarName = request.BirdMyanmarName,
            BirdEnglishName = request.BirdEnglishName,
            Description = request.Description,
            ImagePath = request.ImagePath,
        };

        _db.TblBirds.Add(bird);
        _db.SaveChanges();

        return new BirdResponseDto()
        {
            IsSuccess = true,
            Message = "Bird created successfully",
        };
    }

    public BirdResponseDto UpdateBird(int id, BirdUpdateRequestDto request)
    {
        var bird = _db.TblBirds.FirstOrDefault(x => x.Id == id);
        if (bird is null)
        {
            return new BirdResponseDto()
            {
                IsSuccess = false,
                Message = "Bird not found"
            };
        }

        bool isUpdated = false;
        if (!string.IsNullOrWhiteSpace(request.BirdMyanmarName))
        {
            bird.BirdMyanmarName = request.BirdMyanmarName;
            isUpdated = true;
        }

        if (!string.IsNullOrWhiteSpace(request.BirdEnglishName))
        {
            bird.BirdEnglishName = request.BirdEnglishName;
            isUpdated = true;
        }

        if (!string.IsNullOrWhiteSpace(request.Description))
        {
            bird.Description = request.Description;
            isUpdated = true;
        }

        if (!string.IsNullOrWhiteSpace(request.ImagePath))
        {
            bird.ImagePath = request.ImagePath;
            isUpdated = true;
        }

        if (!isUpdated)
        {
            return new BirdResponseDto()
            {
                IsSuccess = false,
                Message = "Invalid action."
            };
        }
        
        _db.SaveChanges();

        return new BirdResponseDto()
        {
            IsSuccess = true,
            Message = "Bird updated successfully",
        };
    }

    public BirdResponseDto DeleteBird(int id)
    {
        var bird = _db.TblBirds.FirstOrDefault(x => x.Id == id);

        if (bird is null)
        {
            return new BirdResponseDto()
            {
                IsSuccess = false,
                Message = "Bird not found"
            };
        }
        
        _db.TblBirds.Remove(bird);
        _db.SaveChanges();

        return new BirdResponseDto()
        {
            IsSuccess = true,
            Message = "Bird deleted successfully",
        };
    }

    public string SeedBird()
    {
        string filePath = "Data/Birds.json";
        string jsonStr = File.ReadAllText(filePath);
        
        var obj = JsonConvert.DeserializeObject<BirdSeedResponse>(jsonStr)!;
        var birds = obj.Tbl_Bird;

        foreach (var bird in birds)
        {
            _db.TblBirds.Add(new TblBird()
            {
                BirdMyanmarName = bird.BirdMyanmarName,
                BirdEnglishName = bird.BirdEnglishName,
                Description = bird.Description,
                ImagePath = bird.ImagePath,
            });
        }
        
        var result = _db.SaveChanges();
        return result > 0 ? "Seeded successfully" : "Seeded failed";
    }
}