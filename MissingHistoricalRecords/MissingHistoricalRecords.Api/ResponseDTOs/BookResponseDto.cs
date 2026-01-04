using MissingHistoricalRecords.Api.DTOs;

namespace MissingHistoricalRecords.Api.DAOs
{
    public class BookResponseDto
    {
        public class BookDto
        {
            public int BookId { get; set; }
            public string BookTitle { get; set; } = null!;
            public string BookAuthor { get; set; } = null!;
            public string BookCover { get; set; } = null!;
            public string BookCategory { get; set; } = null!;
            public string BookDescription { get; set; } = null!;
        }

        public class BookGetListResponseDto
        {
            public bool IsSuccess { get; set; }
            public string Message { get; set; } = string.Empty;
            public List<BookDto>? Books { get; set; }
        }

        public class BookGetByIdResponseDto
        {
            public bool IsSuccess { get; set; }
            public string Message { get; set; } = string.Empty;
            public BookDto? Book { get; set; }
        }

        public class BookResultResponseDto
        {
            public bool IsSuccess { get; set; } = false;
            public string Message { get; set; } = string.Empty;
        }

    }
}
