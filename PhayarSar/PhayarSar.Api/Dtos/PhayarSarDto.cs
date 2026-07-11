namespace PhayarSar.Api.Dtos;

public class PhayarSarGroupJsonModel
{
    public int GroupId { get; set; }
    public string Title { get; set; } = null!;
    public List<PhayarSarItemJsonModel> Data { get; set; } = new();
}

public class PhayarSarItemJsonModel
{
    public int Id { get; set; }
    public int GroupId { get; set; }
    public string Title { get; set; } = null!;
}

public class PhayarSarContentJsonModel
{
    public int Id { get; set; }
    public int GroupId { get; set; }
    public string Title { get; set; } = null!;
    public string Content { get; set; } = null!;
}

public class PhayarSarGroupDto
{
    public int GroupId { get; set; }
    public string Title { get; set; } = null!;
    public List<PhayarSarItemDto> Data { get; set; } = new();
}

public class PhayarSarItemDto
{
    public int Id { get; set; }
    public int GroupId { get; set; }
    public string Title { get; set; } = null!;
}

public class PhayarSarContentDto
{
    public int Id { get; set; }
    public int GroupId { get; set; }
    public string Title { get; set; } = null!;
    public string Content { get; set; } = null!;
}

public class PhayarSarGroupListResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
    public List<PhayarSarGroupDto> Groups { get; set; } = new();
}

public class PhayarSarGroupGetResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
    public PhayarSarGroupDto? Group { get; set; }
}

public class PhayarSarContentResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
    public PhayarSarContentDto? Content { get; set; }
}
