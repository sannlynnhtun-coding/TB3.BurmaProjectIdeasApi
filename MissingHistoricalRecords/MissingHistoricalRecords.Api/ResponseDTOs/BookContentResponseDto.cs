namespace MissingHistoricalRecords.Api.ResponseDTOs
{
    public class BookContentResponseDto
    {
        public class BookContentDto
        {
            public int BookId { get; set; }
            public int PageNo { get; set; }
            public string? BookContent { get; set; }
        }

        public class BookContentGetListResponseDto
        {
            public bool IsSuccess { get; set; }
            public string Message { get; set; } = string.Empty;
            public List<BookContentDto>? Contents { get; set; }
        }

        public class BookContentGetByIdResponseDto
        {
            public bool IsSuccess { get; set; }
            public string Message { get; set; } = string.Empty;
            public BookContentDto? Content { get; set; }
        }

        public class BookContentResultResponseDto
        {
            public bool IsSuccess { get; set; } = false;
            public string Message { get; set; } = string.Empty;
        }

    }
}
