namespace BaganMap.Api.Dtos;

public class BaganMapGetResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
    public List<BaganMapDto> BaganMaps { get; set; } = new();
}

public class BaganMapGetByIdResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
    public BaganMapDto? BaganMap { get; set; }
}

public class BaganMapResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
}

public class BaganMapCreateRequestDto
{
    public string PagodaMmName { get; set; } = string.Empty;
    public string PagodaEngName { get; set; } = string.Empty;
    public double Latitude { get; set; }
    public double Longitude { get; set; }
}

public class BaganMapUpdateRequestDto
{
    public string? PagodaMmName { get; set; }
    public string? PagodaEngName { get; set; }
    public double? Latitude { get; set; }
    public double? Longitude { get; set; }
}

public class BaganMapDto
{
    public string Id { get; set; } = string.Empty;
    public string PagodaMmName { get; set; } = string.Empty;
    public string PagodaEngName { get; set; } = string.Empty;
    public double Latitude { get; set; }
    public double Longitude { get; set; }
}

public class BaganMapData
{
    public List<BaganMapDto> Tbl_BaganMapInfoData { get; set; } = new();
}
