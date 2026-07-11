namespace MyanmarProverbs.Api.Dtos;

public class MyanmarProverbsJsonModel
{
    public List<ProverbTitleJsonModel> Tbl_MMProverbsTitle { get; set; } = new();
    public List<ProverbJsonModel> Tbl_MMProverbs { get; set; } = new();
}

public class ProverbTitleJsonModel
{
    public int TitleId { get; set; }
    public string TitleName { get; set; } = null!;
}

public class ProverbJsonModel
{
    public int TitleId { get; set; }
    public int ProverbId { get; set; }
    public string ProverbName { get; set; } = null!;
    public string ProverbDesp { get; set; } = null!;
}

public class ProverbTitleDto
{
    public int TitleId { get; set; }
    public string TitleName { get; set; } = null!;
}

public class ProverbDto
{
    public int TitleId { get; set; }
    public int ProverbId { get; set; }
    public string ProverbName { get; set; } = null!;
    public string ProverbDesp { get; set; } = null!;
}

public class ProverbTitleListResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
    public List<ProverbTitleDto> ProverbTitles { get; set; } = new();
}

public class ProverbListResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
    public List<ProverbDto> Proverbs { get; set; } = new();
}

public class ProverbGetResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
    public ProverbDto? Proverb { get; set; }
}

public class MyanmarProverbResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
}

