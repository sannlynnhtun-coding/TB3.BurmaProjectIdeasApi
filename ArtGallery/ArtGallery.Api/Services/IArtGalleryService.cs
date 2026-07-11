using ArtGallery.Api.Dtos;

namespace ArtGallery.Api.Services;

public interface IArtGalleryService
{
    ArtGalleryGetResponseDto GetGalleries(int pageNo, int pageSize);
    ArtGalleryGetByIdResponseDto GetGallery(int id);
    ArtGalleryResponseDto CreateGallery(ArtGalleryCreateRequestDto request);
    ArtGalleryResponseDto UpdateGallery(int id, ArtGalleryUpdateRequestDto request);
    ArtGalleryResponseDto DeleteGallery(int id);
}
