using System.Text.Json;
using BaganMap.Api.Dtos;

namespace BaganMap.Api.Services;

public class BaganMapService : IBaganMapService
{
    private static readonly JsonSerializerOptions JsonOptions = new()
    {
        PropertyNameCaseInsensitive = true
    };

    private readonly List<BaganMapDto> _baganMaps;

    public BaganMapService(IWebHostEnvironment env)
    {
        var filePath = Path.Combine(env.ContentRootPath, "Data", "BaganMap.json");
        var json = File.ReadAllText(filePath);
        var data = JsonSerializer.Deserialize<BaganMapData>(json, JsonOptions);
        _baganMaps = data?.Tbl_BaganMapInfoData ?? new List<BaganMapDto>();
    }

    public BaganMapGetResponseDto GetBaganMaps(int pageNo, int pageSize, string? search)
    {
        if (pageNo <= 0)
        {
            return new BaganMapGetResponseDto
            {
                IsSuccess = false,
                Message = "Page number must be greater than zero."
            };
        }

        if (pageSize <= 0)
        {
            return new BaganMapGetResponseDto
            {
                IsSuccess = false,
                Message = "Page size must be greater than zero."
            };
        }

        IEnumerable<BaganMapDto> query = _baganMaps;

        if (!string.IsNullOrWhiteSpace(search))
        {
            query = query.Where(x =>
                x.PagodaMmName.Contains(search, StringComparison.OrdinalIgnoreCase) ||
                x.PagodaEngName.Contains(search, StringComparison.OrdinalIgnoreCase));
        }

        var results = query
            .Skip((pageNo - 1) * pageSize)
            .Take(pageSize)
            .ToList();

        return new BaganMapGetResponseDto
        {
            IsSuccess = true,
            Message = "Success",
            BaganMaps = results
        };
    }

    public BaganMapGetByIdResponseDto GetBaganMap(string id)
    {
        var item = _baganMaps.FirstOrDefault(x => x.Id.Equals(id, StringComparison.OrdinalIgnoreCase));

        if (item is null)
        {
            return new BaganMapGetByIdResponseDto
            {
                IsSuccess = false,
                Message = "Pagoda map info not found."
            };
        }

        return new BaganMapGetByIdResponseDto
        {
            IsSuccess = true,
            Message = "Success",
            BaganMap = item
        };
    }

    public BaganMapResponseDto CreateBaganMap(BaganMapCreateRequestDto request) => ReadOnly();

    public BaganMapResponseDto UpdateBaganMap(string id, BaganMapUpdateRequestDto request) => ReadOnly();

    public BaganMapResponseDto DeleteBaganMap(string id) => ReadOnly();

    private static BaganMapResponseDto ReadOnly() => new()
    {
        IsSuccess = false,
        Message = "Read-only JSON data source."
    };
}
