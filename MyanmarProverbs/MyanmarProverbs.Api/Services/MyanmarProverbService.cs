using System.Text.Json;
using MyanmarProverbs.Api.Dtos;
using Microsoft.AspNetCore.Hosting;

namespace MyanmarProverbs.Api.Services;

public class MyanmarProverbService : IMyanmarProverbService
{
    private static readonly JsonSerializerOptions JsonOptions = new()
    {
        PropertyNameCaseInsensitive = true
    };

    private readonly List<ProverbTitleDto> _titles;
    private readonly List<ProverbDto> _proverbs;

    public MyanmarProverbService(IWebHostEnvironment env)
    {
        var filePath = Path.Combine(env.ContentRootPath, "Data", "MyanmarProverbs.json");
        var json = File.ReadAllText(filePath);
        var rawData = JsonSerializer.Deserialize<MyanmarProverbsJsonModel>(json, JsonOptions)
            ?? new MyanmarProverbsJsonModel();

        _titles = rawData.Tbl_MMProverbsTitle.Select(t => new ProverbTitleDto
        {
            TitleId = t.TitleId,
            TitleName = t.TitleName
        }).ToList();

        _proverbs = rawData.Tbl_MMProverbs.Select(p => new ProverbDto
        {
            TitleId = p.TitleId,
            ProverbId = p.ProverbId,
            ProverbName = p.ProverbName,
            ProverbDesp = p.ProverbDesp
        }).ToList();
    }

    public ProverbTitleListResponseDto GetProverbTitles()
    {
        try
        {
            return new ProverbTitleListResponseDto
            {
                IsSuccess = true,
                Message = "Proverb titles retrieved successfully.",
                ProverbTitles = _titles
            };
        }
        catch (Exception ex)
        {
            return new ProverbTitleListResponseDto
            {
                IsSuccess = false,
                Message = $"An error occurred while retrieving proverb titles: {ex.Message}"
            };
        }
    }

    public ProverbListResponseDto GetProverbs(int pageNo, int pageSize)
    {
        try
        {
            if (pageNo <= 0 || pageSize <= 0)
            {
                return new ProverbListResponseDto
                {
                    IsSuccess = false,
                    Message = "Page number and page size must be greater than zero."
                };
            }

            var proverbs = _proverbs
                .Skip((pageNo - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            return new ProverbListResponseDto
            {
                IsSuccess = true,
                Message = "Proverbs retrieved successfully.",
                Proverbs = proverbs
            };
        }
        catch (Exception ex)
        {
            return new ProverbListResponseDto
            {
                IsSuccess = false,
                Message = $"An error occurred while retrieving proverbs: {ex.Message}"
            };
        }
    }

    public ProverbListResponseDto GetProverbsByTitleId(int titleId)
    {
        try
        {
            var proverbs = _proverbs.Where(p => p.TitleId == titleId).ToList();
            return new ProverbListResponseDto
            {
                IsSuccess = true,
                Message = $"Proverbs for title ID {titleId} retrieved successfully.",
                Proverbs = proverbs
            };
        }
        catch (Exception ex)
        {
            return new ProverbListResponseDto
            {
                IsSuccess = false,
                Message = $"An error occurred while retrieving proverbs: {ex.Message}"
            };
        }
    }

    public ProverbGetResponseDto GetProverb(int titleId, int proverbId)
    {
        try
        {
            var proverb = _proverbs.FirstOrDefault(p => p.TitleId == titleId && p.ProverbId == proverbId);
            if (proverb == null)
            {
                return new ProverbGetResponseDto
                {
                    IsSuccess = false,
                    Message = $"Proverb not found for title ID {titleId} and proverb ID {proverbId}."
                };
            }

            return new ProverbGetResponseDto
            {
                IsSuccess = true,
                Message = "Proverb retrieved successfully.",
                Proverb = proverb
            };
        }
        catch (Exception ex)
        {
            return new ProverbGetResponseDto
            {
                IsSuccess = false,
                Message = $"An error occurred while retrieving the proverb: {ex.Message}"
            };
        }
    }

    public ProverbListResponseDto SearchProverbs(string keyword)
    {
        try
        {
            if (string.IsNullOrWhiteSpace(keyword))
            {
                return new ProverbListResponseDto
                {
                    IsSuccess = false,
                    Message = "Search keyword cannot be empty."
                };
            }

            var proverbs = _proverbs.Where(p => 
                p.ProverbName.Contains(keyword, StringComparison.OrdinalIgnoreCase) || 
                p.ProverbDesp.Contains(keyword, StringComparison.OrdinalIgnoreCase)
            ).ToList();

            return new ProverbListResponseDto
            {
                IsSuccess = true,
                Message = "Search results retrieved successfully.",
                Proverbs = proverbs
            };
        }
        catch (Exception ex)
        {
            return new ProverbListResponseDto
            {
                IsSuccess = false,
                Message = $"An error occurred while searching proverbs: {ex.Message}"
            };
        }
    }
}

