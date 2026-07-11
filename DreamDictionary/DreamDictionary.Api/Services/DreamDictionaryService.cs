using System.Text.Json;
using DreamDictionary.Api.Dtos;
using Microsoft.AspNetCore.Hosting;

namespace DreamDictionary.Api.Services;

public class DreamDictionaryService : IDreamDictionaryService
{
    private static readonly JsonSerializerOptions JsonOptions = new()
    {
        PropertyNameCaseInsensitive = true
    };

    private readonly List<BlogHeaderDto> _headers;
    private readonly List<BlogDetailDto> _details;

    public DreamDictionaryService(IWebHostEnvironment env)
    {
        var filePath = Path.Combine(env.ContentRootPath, "Data", "DreamDictionary.json");
        var json = File.ReadAllText(filePath);
        var rawData = JsonSerializer.Deserialize<DreamDictionaryJsonModel>(json, JsonOptions)
            ?? new DreamDictionaryJsonModel();

        _headers = rawData.BlogHeader.Select(h => new BlogHeaderDto
        {
            BlogId = h.BlogId,
            BlogTitle = h.BlogTitle
        }).ToList();

        _details = rawData.BlogDetail.Select(d => new BlogDetailDto
        {
            BlogDetailId = d.BlogDetailId,
            BlogId = d.BlogId,
            BlogContent = d.BlogContent,
            BlogTitle = _headers.FirstOrDefault(h => h.BlogId == d.BlogId)?.BlogTitle ?? string.Empty
        }).ToList();
    }

    public BlogHeaderListResponseDto GetBlogHeaders(int pageNo, int pageSize)
    {
        try
        {
            if (pageNo <= 0 || pageSize <= 0)
            {
                return new BlogHeaderListResponseDto
                {
                    IsSuccess = false,
                    Message = "Page number and page size must be greater than zero."
                };
            }

            var headers = _headers
                .Skip((pageNo - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            return new BlogHeaderListResponseDto
            {
                IsSuccess = true,
                Message = "Blog headers retrieved successfully.",
                BlogHeaders = headers
            };
        }
        catch (Exception ex)
        {
            return new BlogHeaderListResponseDto
            {
                IsSuccess = false,
                Message = $"An error occurred while retrieving headers: {ex.Message}"
            };
        }
    }

    public BlogDetailListResponseDto GetBlogDetails(int pageNo, int pageSize)
    {
        try
        {
            if (pageNo <= 0 || pageSize <= 0)
            {
                return new BlogDetailListResponseDto
                {
                    IsSuccess = false,
                    Message = "Page number and page size must be greater than zero."
                };
            }

            var details = _details
                .Skip((pageNo - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            return new BlogDetailListResponseDto
            {
                IsSuccess = true,
                Message = "Blog details retrieved successfully.",
                BlogDetails = details
            };
        }
        catch (Exception ex)
        {
            return new BlogDetailListResponseDto
            {
                IsSuccess = false,
                Message = $"An error occurred while retrieving details: {ex.Message}"
            };
        }
    }

    public BlogDetailListResponseDto GetBlogDetailsByHeaderId(int blogHeaderId)
    {
        try
        {
            var details = _details
                .Where(d => d.BlogId == blogHeaderId)
                .ToList();

            return new BlogDetailListResponseDto
            {
                IsSuccess = true,
                Message = $"Retrieved {details.Count} details for the specified header.",
                BlogDetails = details
            };
        }
        catch (Exception ex)
        {
            return new BlogDetailListResponseDto
            {
                IsSuccess = false,
                Message = $"An error occurred while retrieving details by header ID: {ex.Message}"
            };
        }
    }

    public BlogDetailResponseDto GetBlogDetailById(int blogDetailId)
    {
        try
        {
            var detail = _details.FirstOrDefault(d => d.BlogDetailId == blogDetailId);
            if (detail is null)
            {
                return new BlogDetailResponseDto
                {
                    IsSuccess = false,
                    Message = "Blog detail not found."
                };
            }

            return new BlogDetailResponseDto
            {
                IsSuccess = true,
                Message = "Blog detail retrieved successfully.",
                BlogDetail = detail
            };
        }
        catch (Exception ex)
        {
            return new BlogDetailResponseDto
            {
                IsSuccess = false,
                Message = $"An error occurred while retrieving detail by ID: {ex.Message}"
            };
        }
    }

    public BlogDetailListResponseDto SearchDreams(string search)
    {
        try
        {
            if (string.IsNullOrWhiteSpace(search))
            {
                return new BlogDetailListResponseDto
                {
                    IsSuccess = false,
                    Message = "Search query cannot be empty."
                };
            }

            var details = _details
                .Where(d => d.BlogContent.Contains(search, StringComparison.OrdinalIgnoreCase))
                .ToList();

            return new BlogDetailListResponseDto
            {
                IsSuccess = true,
                Message = $"Found {details.Count} matching dreams.",
                BlogDetails = details
            };
        }
        catch (Exception ex)
        {
            return new BlogDetailListResponseDto
            {
                IsSuccess = false,
                Message = $"An error occurred while searching: {ex.Message}"
            };
        }
    }

    public DreamDictionaryResponseDto CreateBlogDetail(BlogDetailCreateRequestDto request) => ReadOnly();

    public DreamDictionaryResponseDto UpdateBlogDetail(int id, BlogDetailUpdateRequestDto request) => ReadOnly();

    public DreamDictionaryResponseDto DeleteBlogDetail(int id) => ReadOnly();

    private static DreamDictionaryResponseDto ReadOnly() => new()
    {
        IsSuccess = false,
        Message = "Read-only JSON data source."
    };
}

