using System.Text.Json;
using ArtGallery.Api.Dtos;

namespace ArtGallery.Api.Services;

public class ArtGalleryService : IArtGalleryService
{
    private static readonly JsonSerializerOptions JsonOptions = new()
    {
        PropertyNameCaseInsensitive = true
    };

    private readonly List<ArtGalleryDto> _galleries;

    public ArtGalleryService(IWebHostEnvironment env)
    {
        var filePath = Path.Combine(env.ContentRootPath, "Data", "ArtGallery.json");
        var json = File.ReadAllText(filePath);
        var rawData = JsonSerializer.Deserialize<ArtGalleryJsonModel>(json, JsonOptions)
            ?? new ArtGalleryJsonModel();

        _galleries = (from gallery in rawData.Tbl_Gallery
                      join artist in rawData.Tbl_Artist on gallery.ArtistId equals artist.ArtistId
                      join art in rawData.Tbl_Art on gallery.ArtId equals art.ArtId
                      select new ArtGalleryDto
                      {
                          GalleryId = gallery.GalleryId,
                          ArtistId = artist.ArtistId,
                          ArtistName = artist.ArtistName,
                          ArtistProfile = $"art-gallery/profile/{artist.ArtistId}.jpg",
                          Social = artist.Social.Select(s => new SocialDto
                          {
                              Name = s.Name,
                              Link = s.Link
                          }).ToList(),
                          ArtId = art.ArtId,
                          ArtName = art.ArtName,
                          ArtDescription = art.ArtDescription,
                          ArtImage = $"art-gallery/{art.ArtId}.jpg"
                      }).ToList();
    }

    public ArtGalleryGetResponseDto GetGalleries(int pageNo, int pageSize)
    {
        try
        {
            if (pageNo <= 0 || pageSize <= 0)
            {
                return new ArtGalleryGetResponseDto
                {
                    IsSuccess = false,
                    Message = "Invalid page number or page size."
                };
            }

            var galleries = _galleries
                .Skip((pageNo - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            return new ArtGalleryGetResponseDto
            {
                IsSuccess = true,
                Message = "Art galleries retrieved successfully.",
                Galleries = galleries
            };
        }
        catch (Exception)
        {
            return new ArtGalleryGetResponseDto
            {
                IsSuccess = false,
                Message = "An error occurred while retrieving art galleries."
            };
        }
    }

    public ArtGalleryGetByIdResponseDto GetGallery(int id)
    {
        try
        {
            var gallery = _galleries.FirstOrDefault(g => g.GalleryId == id);
            if (gallery is null)
            {
                return new ArtGalleryGetByIdResponseDto
                {
                    IsSuccess = false,
                    Message = "Gallery item not found."
                };
            }

            return new ArtGalleryGetByIdResponseDto
            {
                IsSuccess = true,
                Message = "Gallery item retrieved successfully.",
                Gallery = gallery
            };
        }
        catch (Exception)
        {
            return new ArtGalleryGetByIdResponseDto
            {
                IsSuccess = false,
                Message = "An error occurred while retrieving the gallery item."
            };
        }
    }

    public ArtGalleryResponseDto CreateGallery(ArtGalleryCreateRequestDto request) => ReadOnly();

    public ArtGalleryResponseDto UpdateGallery(int id, ArtGalleryUpdateRequestDto request) => ReadOnly();

    public ArtGalleryResponseDto DeleteGallery(int id) => ReadOnly();

    private static ArtGalleryResponseDto ReadOnly() => new()
    {
        IsSuccess = false,
        Message = "Read-only JSON data source."
    };
}
