using Zodiac.Api.Dtos;

namespace Zodiac.Api.Services;

public interface IZodiacService
{
    ZodiacSignListResponseDto GetZodiacSigns();
    ZodiacSignGetResponseDto GetZodiacSignById(int id);
    ZodiacSignGetResponseDto GetZodiacSignByName(string name);
}
