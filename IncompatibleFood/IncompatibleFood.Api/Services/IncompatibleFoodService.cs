using IncompatibleFood.Api.Controllers;
using IncompatibleFood.Api.Dtos;
using IncompatibleFood.Database.IncompatibleFoodDbContextModels;
using Microsoft.AspNetCore.Mvc;


namespace IncompatibleFood.Api.Services;

public class IncompatibleFoodService : IIncompatibleFoodService
{
    private readonly IncompatibleFoodDbContext _context;
    public IncompatibleFoodService(IncompatibleFoodDbContext context)
    {
        _context = context;
    }

    public IncompatibleFoodGetResponseDto GetIncompatibleFoods(int pageNo, int pageSize)
    {
        IncompatibleFoodGetResponseDto dto = new IncompatibleFoodGetResponseDto();

        if (pageNo == 0)
        {
            dto = new IncompatibleFoodGetResponseDto()
            {
                IsSuccess = false,
                Message = "Page number must be greater than zero"
            };

            return dto;
        }
        if (pageSize == 0)
        {
            dto = new IncompatibleFoodGetResponseDto()
            {
                IsSuccess = false,
                Message = "Page size must be greater than zero."
            };
            return dto;
        }

        var lst = _context.TblIncompatibleFoods
            .OrderByDescending(x => x.Id)
            .Skip((pageNo - 1) * pageSize)
            .Take(pageSize)
            .ToList();

        var incompatibleFoods = lst.Select(item => new IncompatibleFoodDto
        {
            Id = item.Id,
            FoodA = item.FoodA,
            FoodB = item.FoodB,
            Description = item.Description

        }).ToList();

        dto = new IncompatibleFoodGetResponseDto()
        {
            IsSuccess = true,
            Message = "Success",
            IncompatibleFoods = incompatibleFoods
        };

        return dto;
    }

    public IncompatibleFoodGetByIdResponseDto GetIncompatibleFoodById(int id)
    {
        IncompatibleFoodGetByIdResponseDto dto = new IncompatibleFoodGetByIdResponseDto();
        var item = _context.TblIncompatibleFoods
            .FirstOrDefault(x => x.Id == id);
        if (item is null)
        {
            dto = new IncompatibleFoodGetByIdResponseDto()
            {
                IsSuccess = false,
                Message = "Product Not found"
            };

            return dto;
        }

        var incompatiblefood = new IncompatibleFoodDto
        {
            Id = item.Id,
            FoodA = item.FoodA,
            FoodB = item.FoodB,
            Description = item.Description,
        };

        dto = new IncompatibleFoodGetByIdResponseDto()
        {
            IsSuccess = true,
            Message = "Product is successfully retrieved.",
            IncompatibleFood = incompatiblefood,
        };

        return dto;
    }
    public IncompatibleFoodResponseDto CreateIncompatibleFood(IncompatibleFoodCreateRequestDto requestDto)
    {
        bool isSuccess = false;
        string message = string.Empty;

        IncompatibleFoodResponseDto dto = new IncompatibleFoodResponseDto();

        if (string.IsNullOrEmpty(requestDto.FoodA) || string.IsNullOrEmpty(requestDto.FoodB) || string.IsNullOrEmpty(requestDto.Description))
        {
            message = "FoodA, FoodB Or Description cannot be empty!";
            goto Response;


        }
        _context.TblIncompatibleFoods.Add(new TblIncompatibleFood
        {
            FoodA = requestDto.FoodA,
            FoodB = requestDto.FoodB,
            Description = requestDto.Description,
        });

        int result = _context.SaveChanges();

        message = "Saving Failed!";
        if (result>0)
        {
            isSuccess = true;
            message = "Saving successful!";
            goto Response;
        }

    Response:
        dto = new IncompatibleFoodResponseDto
        {
            IsSuccess = isSuccess,
            Message = message,
        };

        return dto;
    }

    public IncompatibleFoodResponseDto UpdateIncompatibleFood(int id, IncompatibleFoodUpdateRequestDto requestDto)
    {
        bool isSuccess = false;
        string message = string.Empty;
        IncompatibleFoodResponseDto dto = new IncompatibleFoodResponseDto();

        if (String.IsNullOrEmpty(requestDto.FoodA)||String.IsNullOrEmpty(requestDto.FoodB)||String.IsNullOrEmpty(requestDto.Description))
        {
            message = "FoodA, FoodB and Description cannot be empty.";
            goto Response;
        }


        var item = _context.TblIncompatibleFoods
            .FirstOrDefault(x => x.Id == id);

        if (item is null)
        {
            message = "Product Not Found";
            goto Response;
        }

        item.FoodA = requestDto.FoodA;
        item.FoodB = requestDto.FoodB;
        item.Description = requestDto.Description;
        int result = _context.SaveChanges();

        message = "Updating Failed.";
        if (result > 0)
        {
            isSuccess = true;
            message = "Updating Successful.";
            goto Response;
        }

    Response:
        dto = new IncompatibleFoodResponseDto
        {
            IsSuccess = isSuccess,
            Message = message,
        };

        return dto;
    }

    public IncompatibleFoodResponseDto PatchIncompatibleFood(int id, IncompatibleFoodPatchRequestDto requestDto)
    {
        bool isSuccess = false;
        string message = string.Empty;
        IncompatibleFoodResponseDto dto = new IncompatibleFoodResponseDto();

        if (string.IsNullOrEmpty(requestDto.FoodA) && string.IsNullOrEmpty(requestDto.FoodB) && string.IsNullOrEmpty(requestDto.Description))
        {
            message = "No data to update.";
            goto Response;
        }

        var item = _context.TblIncompatibleFoods
            .FirstOrDefault(x => x.Id == id);
        if (item is null)
        {
            message = "Incompatible Food Not Found";
            goto Response;
        }

        if (!string.IsNullOrEmpty(requestDto.FoodA))
            item.FoodA = requestDto.FoodA;

        if (!string.IsNullOrEmpty(requestDto.FoodB))
            item.FoodB = requestDto.FoodB;

        if (!string.IsNullOrEmpty(requestDto.Description))
            item.Description = requestDto.Description;



        int result = _context.SaveChanges();

        message = "Patching Failed.";
        if (result > 0)
        {
            isSuccess = true;
            message = "Patching Successful.";
            goto Response;
        }

    Response:
        dto = new IncompatibleFoodResponseDto
        {
            IsSuccess = isSuccess,
            Message = message,
        };

        return dto;
    }
}
/*
public class IncompatibleFoodResponseDto
{
    public bool IsSuccess { get; set; } = false;
    public string Message { get; set; } = string.Empty;
}

public class IncompatibleFoodGetResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; }
    public List<IncompatibleFoodDto> IncompatibleFoods { get; set; }
}

public class IncompatibleFoodGetByIdResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; }
    public IncompatibleFoodDto IncompatibleFood { get; set; }
}
public class IncompatibleFoodDto
{
    public int Id { get; set; }

    public string FoodA { get; set; } = null!;

    public string FoodB { get; set; } = null!;

    public string Description { get; set; } = null!;
}
*/