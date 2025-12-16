using Bird.Api.Dtos;

namespace Bird.Api.Services;

public interface IBirdService
{
    public BirdGetResponseDto GetBirds(int pageNo, int pageSize, string? search);
    public BirdGetByIdResponseDto GetBird(int id);
    public BirdResponseDto CreateBird(BirdCreateRequestDto request);
    public BirdResponseDto UpdateBird(int id, BirdUpdateRequestDto request);
    public BirdResponseDto DeleteBird(int id);
    public string SeedBird();
}