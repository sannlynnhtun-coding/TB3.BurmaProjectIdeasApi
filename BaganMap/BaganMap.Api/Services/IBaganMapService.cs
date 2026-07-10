using BaganMap.Api.Dtos;

namespace BaganMap.Api.Services;

public interface IBaganMapService
{
    public BaganMapGetResponseDto GetBaganMaps(int pageNo, int pageSize, string? search);
    public BaganMapGetByIdResponseDto GetBaganMap(string id);
    public BaganMapResponseDto CreateBaganMap(BaganMapCreateRequestDto request);
    public BaganMapResponseDto UpdateBaganMap(string id, BaganMapUpdateRequestDto request);
    public BaganMapResponseDto DeleteBaganMap(string id);
}
