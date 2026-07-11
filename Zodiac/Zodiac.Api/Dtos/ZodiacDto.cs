namespace Zodiac.Api.Dtos;

public class TraitDto
{
    public string Name { get; set; } = null!;
    public int Percentage { get; set; }
}

public class ZodiacSignDto
{
    public int Id { get; set; }
    public string Name { get; set; } = null!;
    public string MyanmarMonth { get; set; } = null!;
    public string ZodiacSignImageUrl { get; set; } = null!;
    public string ZodiacSign2ImageUrl { get; set; } = null!;
    public string Dates { get; set; } = null!;
    public string Element { get; set; } = null!;
    public string ElementImageUrl { get; set; } = null!;
    public string LifePurpose { get; set; } = null!;
    public string Loyal { get; set; } = null!;
    public string RepresentativeFlower { get; set; } = null!;
    public string Angry { get; set; } = null!;
    public string Character { get; set; } = null!;
    public string PrettyFeatures { get; set; } = null!;
    public List<TraitDto> Traits { get; set; } = new();
}

public class ZodiacJsonModel
{
    public List<ZodiacSignDto> ZodiacSignsDetail { get; set; } = new();
}

public class ZodiacSignListResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
    public List<ZodiacSignDto> ZodiacSigns { get; set; } = new();
}

public class ZodiacSignGetResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
    public ZodiacSignDto? ZodiacSign { get; set; }
}
