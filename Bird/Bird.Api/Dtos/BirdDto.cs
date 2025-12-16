namespace Bird.Api.Dtos;

public class BirdGetResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; }
    public List<BirdDto> Birds { get; set; }
}

public class BirdGetByIdResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; }
    public BirdDto Bird { get; set; }
}

public class BirdResponseDto
{
    public bool IsSuccess { get; set; }
    public string Message { get; set; }
}

public class BirdCreateRequestDto
{
    public string BirdMyanmarName { get; set; }
    public string BirdEnglishName { get; set; }
    public string Description { get; set; }
    public string ImagePath { get; set; }
}

public class BirdUpdateRequestDto
{
    public string? BirdMyanmarName { get; set; }
    public string? BirdEnglishName { get; set; }
    public string? Description { get; set; }
    public string? ImagePath { get; set; }
}

public class BirdDto
{
    public string BirdMyanmarName { get; set; }
    public string BirdEnglishName { get; set; }
    public string Description { get; set; }
    public string ImagePath { get; set; }
}

public class BirdSeedResponse
{
    public List<Bird> Tbl_Bird { get; set; }
}

public class Bird : BirdDto
{
    public int Id { get; set; }
}