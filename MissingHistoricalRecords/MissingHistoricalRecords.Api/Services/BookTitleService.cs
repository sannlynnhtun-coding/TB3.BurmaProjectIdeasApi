using MissingHistoricalRecords.Database.AppDbContextModels;
using static MissingHistoricalRecords.Api.DAOs.BookResponseDto;
using static MissingHistoricalRecords.Api.DTOs.BookRequestDto;

namespace MissingHistoricalRecords.Api.Services
{
    public class BookTitleService : IBookTitleService
    {
        private readonly MissingHistoricalRecordsDbContext _db;

        public BookTitleService(MissingHistoricalRecordsDbContext db)
        {
            _db = db;
        }

        public BookGetListResponseDto GetBooks(int pageNo, int pageSize)
        {
            BookGetListResponseDto dto = new();

            if (pageNo <= 0)
            {
                dto.IsSuccess = false;
                dto.Message = "Page number must be greater than zero.";
                return dto;
            }

            if (pageSize <= 0)
            {
                dto.IsSuccess = false;
                dto.Message = "Page size must be greater than zero.";
                return dto;
            }

            var lst = _db.TblBooks
                .Where(x => x.DeleteFlag == false)
                .OrderByDescending(x => x.BookId)
                .Skip((pageNo - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            var books = lst.Select(x => new BookDto
            {
                BookId = x.BookId,
                BookTitle = x.BookTitle,
                BookAuthor = x.BookAuthor,
                BookCover = x.BookCover,
                BookCategory = x.BookCategory,
                BookDescription = x.BookDescription
            }).ToList();

            dto.IsSuccess = true;
            dto.Message = "Success.";
            dto.Books = books;

            return dto;
        }

        public BookGetByIdResponseDto GetBookById(int id)
        {
            BookGetByIdResponseDto dto = new();

            var item = _db.TblBooks
                .Where(x => x.DeleteFlag == false)
                .FirstOrDefault(x => x.BookId == id);

            if (item is null)
            {
                dto.IsSuccess = false;
                dto.Message = "Book not found.";
                return dto;
            }

            dto.IsSuccess = true;
            dto.Message = "Book retrieved successfully.";
            dto.Book = new BookDto
            {
                BookId = item.BookId,
                BookTitle = item.BookTitle,
                BookAuthor = item.BookAuthor,
                BookCover = item.BookCover,
                BookCategory = item.BookCategory,
                BookDescription = item.BookDescription
            };

            return dto;
        }

        public BookResultResponseDto CreateBook(BookCreateRequestDto requestDto)
        {
            bool isSuccess = false;
            string message = string.Empty;

            if (string.IsNullOrEmpty(requestDto.BookTitle))
            {
                message = "Book title cannot be empty.";
                goto Response;
            }

            if (string.IsNullOrEmpty(requestDto.BookAuthor))
            {
                message = "Book author cannot be empty.";
                goto Response;
            }

            if (string.IsNullOrEmpty(requestDto.BookCover))
            {
                message = "Book cover cannot be empty.";
                goto Response;
            }

            if (string.IsNullOrEmpty(requestDto.BookCategory))
            {
                message = "Book category cannot be empty.";
                goto Response;
            }

            _db.TblBooks.Add(new TblBook
            {
                BookTitle = requestDto.BookTitle,
                BookAuthor = requestDto.BookAuthor,
                BookCover = requestDto.BookCover,
                BookCategory = requestDto.BookCategory,
                BookDescription = requestDto.BookDescription,
                DeleteFlag = false,
                CreatedDateTime = DateTime.Now
            });

            int result = _db.SaveChanges();

            message = "Saving Failed.";
            if (result > 0)
            {
                isSuccess = true;
                message = "Saving Successful.";
            }

        Response:
            return new BookResultResponseDto
            {
                IsSuccess = isSuccess,
                Message = message
            };
        }

        public BookResultResponseDto UpdateBook(int id, BookUpdateRequestDto requestDto)
        {
            bool isSuccess = false;
            string message = string.Empty;

            if (string.IsNullOrEmpty(requestDto.BookTitle))
            {
                message = "Book title cannot be empty.";
                goto Response;
            }

            if (string.IsNullOrEmpty(requestDto.BookAuthor))
            {
                message = "Book author cannot be empty.";
                goto Response;
            }

            if (string.IsNullOrEmpty(requestDto.BookCover))
            {
                message = "Book cover cannot be empty.";
                goto Response;
            }

            if (string.IsNullOrEmpty(requestDto.BookCategory))
            {
                message = "Book category cannot be empty.";
                goto Response;
            }

            var item = _db.TblBooks
                .Where(x => x.DeleteFlag == false)
                .FirstOrDefault(x => x.BookId == id);

            if (item is null)
            {
                message = "Book not found.";
                goto Response;
            }

            item.BookTitle = requestDto.BookTitle;
            item.BookAuthor = requestDto.BookAuthor;
            item.BookCover = requestDto.BookCover;
            item.BookCategory = requestDto.BookCategory;
            item.BookDescription = requestDto.BookDescription;
            item.ModifiedDateTime = DateTime.Now;

            int result = _db.SaveChanges();

            message = "Updating Failed.";
            if (result > 0)
            {
                isSuccess = true;
                message = "Updating Successful.";
            }

        Response:
            return new BookResultResponseDto
            {
                IsSuccess = isSuccess,
                Message = message
            };
        }

        public BookResultResponseDto PatchBook(int id, BookPatchRequestDto requestDto)
        {
            bool isSuccess = false;
            string message = string.Empty;

            if (string.IsNullOrEmpty(requestDto.BookTitle) && string.IsNullOrEmpty(requestDto.BookAuthor) && string.IsNullOrEmpty(requestDto.BookCategory) && string.IsNullOrEmpty(requestDto.BookCover) && string.IsNullOrEmpty(requestDto.BookDescription))
            {
                message = "No data to update.";
                goto Response;
            }

            var item = _db.TblBooks
                .Where(x => x.DeleteFlag == false)
                .FirstOrDefault(x => x.BookId == id);

            if (item is null)
            {
                message = "Book not found.";
                goto Response;
            }

            if (!string.IsNullOrEmpty(requestDto.BookTitle))
                item.BookTitle = requestDto.BookTitle;

            if (!string.IsNullOrEmpty(requestDto.BookAuthor))
                item.BookAuthor = requestDto.BookAuthor;

            if (!string.IsNullOrEmpty(requestDto.BookCover))
                item.BookCover = requestDto.BookCover;

            if (!string.IsNullOrEmpty(requestDto.BookCategory))
                item.BookCategory = requestDto.BookCategory;

            if (!string.IsNullOrEmpty(requestDto.BookDescription))
                item.BookDescription = requestDto.BookDescription;

            item.ModifiedDateTime = DateTime.Now;

            int result = _db.SaveChanges();

            message = "Patching Failed.";
            if (result > 0)
            {
                isSuccess = true;
                message = "Patching Successful.";
            }

        Response:
            return new BookResultResponseDto
            {
                IsSuccess = isSuccess,
                Message = message
            };
        }

        public BookResultResponseDto DeleteBook(int id)
        {
            BookResultResponseDto dto = new();

            List<TblContent> contents = _db.TblContents
                .Where(x => x.DeleteFlag == false && x.BookId == id)
                .ToList();

            foreach (var content in contents)
            {
                content.DeleteFlag = true;
            }

            var item = _db.TblBooks
                .Where(x => x.DeleteFlag == false)
                .FirstOrDefault(x => x.BookId == id);

            if (item is null)
            {
                dto.Message = "Book not found.";
                return dto;
            }

            item.DeleteFlag = true;
            item.ModifiedDateTime = DateTime.Now;

            int result = _db.SaveChanges();

            if (result < 1)
            {
                dto.Message = "Deleting Failed.";
                return dto;
            }

            dto.IsSuccess = true;
            dto.Message = "Deleting Successful.";
            return dto;
        }
    }
}
