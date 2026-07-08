using System.Text.Json;
using static MissingHistoricalRecords.Api.DAOs.BookResponseDto;
using static MissingHistoricalRecords.Api.DTOs.BookRequestDto;

namespace MissingHistoricalRecords.Api.Services
{
    public class BookTitleService : IBookTitleService
    {
        private static readonly JsonSerializerOptions JsonOptions = new()
        {
            PropertyNameCaseInsensitive = true
        };

        private readonly List<BookDto> _books;

        public BookTitleService(IWebHostEnvironment env)
        {
            var filePath = Path.Combine(env.ContentRootPath, "Data", "missing-historical-records", "books.json");
            var json = File.ReadAllText(filePath);
            _books = JsonSerializer.Deserialize<List<BookDto>>(json, JsonOptions) ?? new List<BookDto>();
        }

        public BookGetListResponseDto GetBooks(int pageNo, int pageSize)
        {
            if (pageNo <= 0)
            {
                return new BookGetListResponseDto
                {
                    IsSuccess = false,
                    Message = "Page number must be greater than zero."
                };
            }

            if (pageSize <= 0)
            {
                return new BookGetListResponseDto
                {
                    IsSuccess = false,
                    Message = "Page size must be greater than zero."
                };
            }

            var books = _books
                .OrderByDescending(x => x.BookId)
                .Skip((pageNo - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            return new BookGetListResponseDto
            {
                IsSuccess = true,
                Message = "Success.",
                Books = books
            };
        }

        public BookGetByIdResponseDto GetBookById(int id)
        {
            var book = _books.FirstOrDefault(x => x.BookId == id);
            if (book is null)
            {
                return new BookGetByIdResponseDto
                {
                    IsSuccess = false,
                    Message = "Book not found."
                };
            }

            return new BookGetByIdResponseDto
            {
                IsSuccess = true,
                Message = "Book retrieved successfully.",
                Book = book
            };
        }

        public BookResultResponseDto CreateBook(BookCreateRequestDto requestDto) => ReadOnly();

        public BookResultResponseDto UpdateBook(int id, BookUpdateRequestDto requestDto) => ReadOnly();

        public BookResultResponseDto PatchBook(int id, BookPatchRequestDto requestDto) => ReadOnly();

        public BookResultResponseDto DeleteBook(int id) => ReadOnly();

        private static BookResultResponseDto ReadOnly() => new()
        {
            IsSuccess = false,
            Message = "Read-only JSON data source."
        };
    }
}
