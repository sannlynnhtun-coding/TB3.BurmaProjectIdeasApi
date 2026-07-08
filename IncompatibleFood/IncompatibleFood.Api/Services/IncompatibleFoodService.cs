using System.Text.Json;
using IncompatibleFood.Api.Dtos;

namespace IncompatibleFood.Api.Services;

public class IncompatibleFoodService : IIncompatibleFoodService
{
    private static readonly JsonSerializerOptions JsonOptions = new()
    {
        PropertyNameCaseInsensitive = true
    };

    private readonly List<IncompatibleFoodDto> _foods;

    public IncompatibleFoodService(IWebHostEnvironment env)
    {
        var filePath = Path.Combine(env.ContentRootPath, "Data", "incompatible-food.json");
        var json = File.ReadAllText(filePath);
        _foods = JsonSerializer.Deserialize<List<IncompatibleFoodDto>>(json, JsonOptions)
            ?? new List<IncompatibleFoodDto>();
    }

    public IncompatibleFoodGetResponseDto GetIncompatibleFoods(int pageNo, int pageSize)
    {
        if (pageNo <= 0)
        {
            return new IncompatibleFoodGetResponseDto
            {
                IsSuccess = false,
                Message = "Page number must be greater than zero"
            };
        }

        if (pageSize <= 0)
        {
            return new IncompatibleFoodGetResponseDto
            {
                IsSuccess = false,
                Message = "Page size must be greater than zero."
            };
        }

        var incompatibleFoods = _foods
            .OrderByDescending(x => x.Id)
            .Skip((pageNo - 1) * pageSize)
            .Take(pageSize)
            .ToList();

        return new IncompatibleFoodGetResponseDto
        {
            IsSuccess = true,
            Message = "Success",
            IncompatibleFoods = incompatibleFoods
        };
    }

    public IncompatibleFoodGetByIdResponseDto GetIncompatibleFoodById(int id)
    {
        var item = _foods.FirstOrDefault(x => x.Id == id);
        if (item is null)
        {
            return new IncompatibleFoodGetByIdResponseDto
            {
                IsSuccess = false,
                Message = "Product Not found"
            };
        }

        return new IncompatibleFoodGetByIdResponseDto
        {
            IsSuccess = true,
            Message = "Product is successfully retrieved.",
            IncompatibleFood = item
        };
    }

    public IncompatibleFoodResponseDto CreateIncompatibleFood(IncompatibleFoodCreateRequestDto requestDto) => ReadOnly();

    public IncompatibleFoodResponseDto UpdateIncompatibleFood(int id, IncompatibleFoodUpdateRequestDto requestDto) => ReadOnly();

    public IncompatibleFoodResponseDto PatchIncompatibleFood(int id, IncompatibleFoodPatchRequestDto requestDto) => ReadOnly();

    private static IncompatibleFoodResponseDto ReadOnly() => new()
    {
        IsSuccess = false,
        Message = "Read-only JSON data source."
    };
}
