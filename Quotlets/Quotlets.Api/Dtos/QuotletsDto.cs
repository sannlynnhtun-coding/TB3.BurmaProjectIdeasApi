namespace Quotlets.Api.Dtos
{
    public class QuotletsDto
    {
        public string Id { get; set; } = null!;
        public int UserId { get; set; }
        public string Quotes { get; set; } = null!;
        public string ImageUrl { get; set; } = null!;
    }

    public class QuotletsResponseDto
    {
        public bool IsSuccess { get; set; }
        public string Message { get; set; } = string.Empty;
    }

    public class QuotletsListResponseDto
    {
        public bool IsSuccess { get; set; }
        public string Message { get; set; } = string.Empty;
        public List<QuotletsDto> QuotletsList { get; set; } = new();
    }

    public class QuotletsGetByIdResponseDto
    {
        public bool IsSuccess { get; set; }
        public string Message { get; set; } = string.Empty;
        public QuotletsDto? QuotletsDto { get; set; }
    }

    public class QuotletsCreateRequestDto
    {
        public string Quotes { get; set; }
        public string ImageUrl { get; set; }
    }

    public class QuotletsUpdateRequestDto
    {
        public string Quotes { get; set; }
        public string ImageUrl { get; set; }
    }
}
