namespace DreamDictionary.Api.Dtos;

public class DreamDictionaryJsonModel
{
    public List<BlogHeaderJsonModel> BlogHeader { get; set; } = new();
    public List<BlogDetailJsonModel> BlogDetail { get; set; } = new();
}

public class BlogHeaderJsonModel
{
    public int BlogId { get; set; }
    public string BlogTitle { get; set; } = null!;
}

public class BlogDetailJsonModel
{
    public int BlogDetailId { get; set; }
    public int BlogId { get; set; }
    public string BlogContent { get; set; } = null!;
}

public class BlogHeaderDto
{
    public int BlogId { get; set; }
    public string BlogTitle { get; set; } = null!;
}

public class BlogDetailDto
{
    public int BlogDetailId { get; set; }
    public int BlogId { get; set; }
    public string BlogContent { get; set; } = null!;
    public string BlogTitle { get; set; } = null!;
}

public class BlogHeaderListResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
    public List<BlogHeaderDto> BlogHeaders { get; set; } = new();
}

public class BlogDetailListResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
    public List<BlogDetailDto> BlogDetails { get; set; } = new();
}

public class BlogDetailResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
    public BlogDetailDto? BlogDetail { get; set; }
}

public class DreamDictionaryResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; } = string.Empty;
}

public class BlogDetailCreateRequestDto
{
    public int BlogId { get; set; }
    public string BlogContent { get; set; } = null!;
}

public class BlogDetailUpdateRequestDto
{
    public int BlogId { get; set; }
    public string BlogContent { get; set; } = null!;
}

