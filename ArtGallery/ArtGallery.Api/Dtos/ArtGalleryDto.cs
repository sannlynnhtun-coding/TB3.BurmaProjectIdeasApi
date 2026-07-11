namespace ArtGallery.Api.Dtos;

public class ArtGalleryGetResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
    public List<ArtGalleryDto> Galleries { get; set; } = new();
}

public class ArtGalleryGetByIdResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
    public ArtGalleryDto? Gallery { get; set; }
}

public class ArtGalleryResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
}

public class ArtGalleryCreateRequestDto
{
    public int ArtistId { get; set; }
    public int ArtId { get; set; }
}

public class ArtGalleryUpdateRequestDto
{
    public int ArtistId { get; set; }
    public int ArtId { get; set; }
}

public class ArtGalleryDto
{
    public int GalleryId { get; set; }
    public int ArtistId { get; set; }
    public string ArtistName { get; set; } = null!;
    public string ArtistProfile { get; set; } = null!;
    public List<SocialDto> Social { get; set; } = new();
    public int ArtId { get; set; }
    public string ArtName { get; set; } = null!;
    public string? ArtDescription { get; set; }
    public string ArtImage { get; set; } = null!;
}

public class SocialDto
{
    public string Name { get; set; } = null!;
    public string Link { get; set; } = null!;
}

public class ArtGalleryJsonModel
{
    public List<GalleryJsonModel> Tbl_Gallery { get; set; } = new();
    public List<ArtJsonModel> Tbl_Art { get; set; } = new();
    public List<ArtistJsonModel> Tbl_Artist { get; set; } = new();
}

public class GalleryJsonModel
{
    public int GalleryId { get; set; }
    public int ArtistId { get; set; }
    public int ArtId { get; set; }
}

public class ArtJsonModel
{
    public int ArtId { get; set; }
    public string ArtName { get; set; } = null!;
    public string? ArtDescription { get; set; }
}

public class ArtistJsonModel
{
    public int ArtistId { get; set; }
    public string ArtistName { get; set; } = null!;
    public List<SocialJsonModel> Social { get; set; } = new();
}

public class SocialJsonModel
{
    public string Name { get; set; } = null!;
    public string Link { get; set; } = null!;
}
