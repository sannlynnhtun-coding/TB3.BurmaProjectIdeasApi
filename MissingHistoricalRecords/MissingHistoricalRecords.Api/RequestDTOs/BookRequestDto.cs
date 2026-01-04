namespace MissingHistoricalRecords.Api.DTOs
{
    public class BookRequestDto
    {
        public class BookCreateRequestDto
        {
            public string BookTitle { get; set; }

            public string BookAuthor { get; set; }

            public string BookCover { get; set; }

            public string BookCategory { get; set; }

            public string BookDescription { get; set; }
        }

        public class BookUpdateRequestDto
        {
            public string BookTitle { get; set; }

            public string BookAuthor { get; set; }

            public string BookCover { get; set; }

            public string BookCategory { get; set; }

            public string BookDescription { get; set; }
        }

        public class BookPatchRequestDto
        {
            public string? BookTitle { get; set; }

            public string? BookAuthor { get; set; }

            public string? BookCover { get; set; }

            public string? BookCategory { get; set; }

            public string? BookDescription { get; set; }
        }
    }
}
