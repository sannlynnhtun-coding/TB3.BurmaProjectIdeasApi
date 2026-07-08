using System.Text.Json;
using BurmeseAgriculture.Api.Dtos;

namespace BurmeseAgriculture.Api.Services;

public class BurmeseAgricultureService : IBurmeseAgricultureService
{
    private static readonly JsonSerializerOptions JsonOptions = new()
    {
        PropertyNameCaseInsensitive = true
    };

    private readonly List<BurmeseAgricultureDto> _agricultures;

    public BurmeseAgricultureService(IWebHostEnvironment env)
    {
        var filePath = Path.Combine(env.ContentRootPath, "Data", "burmese-agriculture.json");
        var json = File.ReadAllText(filePath);
        _agricultures = JsonSerializer.Deserialize<List<BurmeseAgricultureDto>>(json, JsonOptions)
            ?? new List<BurmeseAgricultureDto>();
    }

    public BurmeseAgricultureListResponseDto GetList(int pageNo, int pageSize)
    {
        if (pageNo <= 0)
        {
            return new BurmeseAgricultureListResponseDto
            {
                IsSuccess = false,
                Message = "Page number must be greater than zero."
            };
        }

        if (pageSize <= 0)
        {
            return new BurmeseAgricultureListResponseDto
            {
                IsSuccess = false,
                Message = "Page size must be greater than zero."
            };
        }

        var agricultures = _agricultures
            .OrderByDescending(x => x.Id)
            .Skip((pageNo - 1) * pageSize)
            .Take(pageSize)
            .Select(x => new BurmeseAgricultureListItemDto
            {
                Id = x.Id,
                Author = x.Author,
                Date = x.Date,
                Title = x.Title
            })
            .ToList();

        return new BurmeseAgricultureListResponseDto
        {
            IsSuccess = true,
            Message = "Data retrieved successfullly.",
            BurmeseAgricultureList = agricultures
        };
    }

    public BurmeseAgricultureGetByIdResponseDto GetById(int id)
    {
        var item = _agricultures.FirstOrDefault(x => x.Id == id);
        if (item is null)
        {
            return new BurmeseAgricultureGetByIdResponseDto
            {
                IsSuccess = false,
                Message = "No data found.",
                BurmeseAgricultureDto = null
            };
        }

        return new BurmeseAgricultureGetByIdResponseDto
        {
            IsSuccess = true,
            Message = "Data is retrieved successfully.",
            BurmeseAgricultureDto = item
        };
    }

    public AgricultureResponseDto Create(AgricultureCreateRequestDto request) => ReadOnly();

    public AgricultureResponseDto Update(int id, AgricultureUpdateRequestDto request) => ReadOnly();

    public AgricultureResponseDto Patch(int id, AgriculturePatchRequestDto request) => ReadOnly();

    public AgricultureResponseDto Delete(int id) => ReadOnly();

    private static AgricultureResponseDto ReadOnly() => new()
    {
        IsSuccess = false,
        Message = "Read-only JSON data source."
    };
}
