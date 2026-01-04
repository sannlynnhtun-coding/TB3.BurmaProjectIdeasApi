namespace MissingHistoricalRecords.Api.RequestDTOs
{
    public class BookContentRequestDto
    {
        public class BookContentCreateRequestDto
        {
            public int BookId { get; set; }
            public int PageNo { get; set; }
            public string? BookContent { get; set; }
        }

        public class BookContentUpdateRequestDto
        {
            public string? BookContent { get; set; }
        }

        public class BookContentPatchRequestDto
        {
            public string? BookContent { get; set; }
        }

    }
}
