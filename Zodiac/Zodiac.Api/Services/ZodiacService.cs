using System.Text.Json;
using Microsoft.AspNetCore.Hosting;
using Zodiac.Api.Dtos;

namespace Zodiac.Api.Services;

public class ZodiacService : IZodiacService
{
    private static readonly JsonSerializerOptions JsonOptions = new()
    {
        PropertyNameCaseInsensitive = true
    };

    private readonly List<ZodiacSignDto> _zodiacSigns = new();

    public ZodiacService(IWebHostEnvironment env)
    {
        var filePath = Path.Combine(env.ContentRootPath, "Data", "Zodiac.json");
        var json = File.ReadAllText(filePath);
        var rawData = JsonSerializer.Deserialize<ZodiacJsonModel>(json, JsonOptions);
        if (rawData != null && rawData.ZodiacSignsDetail != null)
        {
            _zodiacSigns = rawData.ZodiacSignsDetail;
        }
    }

    public ZodiacSignListResponseDto GetZodiacSigns()
    {
        try
        {
            return new ZodiacSignListResponseDto
            {
                IsSuccess = true,
                Message = "Zodiac signs retrieved successfully.",
                ZodiacSigns = _zodiacSigns
            };
        }
        catch (Exception ex)
        {
            return new ZodiacSignListResponseDto
            {
                IsSuccess = false,
                Message = $"An error occurred while retrieving zodiac signs: {ex.Message}"
            };
        }
    }

    public ZodiacSignGetResponseDto GetZodiacSignById(int id)
    {
        try
        {
            var sign = _zodiacSigns.FirstOrDefault(x => x.Id == id);
            if (sign == null)
            {
                return new ZodiacSignGetResponseDto
                {
                    IsSuccess = false,
                    Message = $"Zodiac sign ID {id} not found."
                };
            }

            return new ZodiacSignGetResponseDto
            {
                IsSuccess = true,
                Message = "Zodiac sign retrieved successfully.",
                ZodiacSign = sign
            };
        }
        catch (Exception ex)
        {
            return new ZodiacSignGetResponseDto
            {
                IsSuccess = false,
                Message = $"An error occurred while retrieving zodiac sign: {ex.Message}"
            };
        }
    }

    public ZodiacSignGetResponseDto GetZodiacSignByName(string name)
    {
        try
        {
            var sign = _zodiacSigns.FirstOrDefault(x => x.Name.Equals(name, StringComparison.OrdinalIgnoreCase));
            if (sign == null)
            {
                return new ZodiacSignGetResponseDto
                {
                    IsSuccess = false,
                    Message = $"Zodiac sign '{name}' not found."
                };
            }

            return new ZodiacSignGetResponseDto
            {
                IsSuccess = true,
                Message = "Zodiac sign retrieved successfully.",
                ZodiacSign = sign
            };
        }
        catch (Exception ex)
        {
            return new ZodiacSignGetResponseDto
            {
                IsSuccess = false,
                Message = $"An error occurred while retrieving zodiac sign: {ex.Message}"
            };
        }
    }
}
