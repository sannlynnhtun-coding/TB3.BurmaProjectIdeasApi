using System.Text.Json;
using static MissingHistoricalRecords.Api.RequestDTOs.BookContentRequestDto;
using static MissingHistoricalRecords.Api.ResponseDTOs.BookContentResponseDto;

namespace MissingHistoricalRecords.Api.Services
{
    public class BookContentService : IBookContentService
    {
        private static readonly JsonSerializerOptions JsonOptions = new()
        {
            PropertyNameCaseInsensitive = true
        };

        private readonly List<BookContentDto> _contents;

        public BookContentService(IWebHostEnvironment env)
        {
            var dataPath = Path.Combine(env.ContentRootPath, "Data", "missing-historical-records");
            _contents = Directory
                .EnumerateFiles(dataPath, "*.json")
                .Where(x => !string.Equals(Path.GetFileName(x), "books.json", StringComparison.OrdinalIgnoreCase))
                .SelectMany(ReadContents)
                .ToList();
        }

        public BookContentGetListResponseDto GetContentsByBookID(int bookId)
        {
            var contents = _contents
                .Where(x => x.BookId == bookId)
                .OrderBy(x => x.PageNo)
                .ToList();

            return new BookContentGetListResponseDto
            {
                IsSuccess = true,
                Message = "Success.",
                Contents = contents
            };
        }

        public BookContentGetByIdResponseDto GetSingleContent(int bookId, int pageNo)
        {
            var item = _contents.FirstOrDefault(x => x.BookId == bookId && x.PageNo == pageNo);
            if (item is null)
            {
                return new BookContentGetByIdResponseDto
                {
                    IsSuccess = false,
                    Message = "Content not found."
                };
            }

            return new BookContentGetByIdResponseDto
            {
                IsSuccess = true,
                Message = "Content retrieved successfully.",
                Content = item
            };
        }

        public BookContentResultResponseDto CreateContent(BookContentCreateRequestDto requestDto) => ReadOnly();

        public BookContentResultResponseDto UpdateContent(
            int bookId,
            int pageNo,
            BookContentUpdateRequestDto requestDto) => ReadOnly();

        public BookContentResultResponseDto PatchContent(
            int bookId,
            int pageNo,
            BookContentPatchRequestDto requestDto) => ReadOnly();

        public BookContentResultResponseDto DeleteContent(int bookId, int pageNo) => ReadOnly();

        private static IEnumerable<BookContentDto> ReadContents(string filePath)
        {
            var json = File.ReadAllText(filePath);
            return JsonSerializer.Deserialize<List<BookContentDto>>(json, JsonOptions) ?? new List<BookContentDto>();
        }

        private static BookContentResultResponseDto ReadOnly() => new()
        {
            IsSuccess = false,
            Message = "Read-only JSON data source."
        };
    }
}
