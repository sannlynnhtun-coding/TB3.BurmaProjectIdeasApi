namespace BurmeseAgriculture.Api.Dtos
{
    public class BurmeseAgricultureDto
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public DateTime Date { get; set; }
        public string Author { get; set; }
        public string Content { get; set; }
    }

    public class AgricultureResponseDto
    {
        public bool IsSuccess { get; set; } = false;
        public string Message { get; set; } = string.Empty;
    }

    public class BurmeseAgricultureListItemDto
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public DateTime Date { get; set; }
        public string Author { get; set; }
    }

    public class BurmeseAgricultureGetByIdResponseDto
    {
        public bool IsSuccess { get; set; }
        public string Message { get; set; }
        public BurmeseAgricultureDto BurmeseAgricultureDto { get; set; }
    }

    public class BurmeseAgricultureListResponseDto
    {
        public bool IsSuccess { get; set; }
        public string Message { get; set; }
        public List<BurmeseAgricultureListItemDto> BurmeseAgricultureList { get; set; }
    }

    public class AgricultureCreateRequestDto
    {
        public string Title { get; set; }
        public DateTime Date { get; set; }
        public string Author { get; set; }
        public string Content { get; set; }
    }

    public class AgricultureUpdateRequestDto
    {
        public string Title { get; set; }
        public DateTime Date { get; set; }
        public string Author { get; set; }
        public string Content { get; set; }
    }

    public class AgriculturePatchRequestDto
    {
        public string? Title { get; set; }
        public DateTime? Date { get; set; }
        public string? Author { get; set; }
        public string? Content { get; set; }
    }


}
