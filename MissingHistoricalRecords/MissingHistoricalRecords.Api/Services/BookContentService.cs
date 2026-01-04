using MissingHistoricalRecords.Database.AppDbContextModels;
using static MissingHistoricalRecords.Api.RequestDTOs.BookContentRequestDto;
using static MissingHistoricalRecords.Api.ResponseDTOs.BookContentResponseDto;

namespace MissingHistoricalRecords.Api.Services
{
    public class BookContentService : IBookContentService
    {
        private readonly MissingHistoricalRecordsDbContext _db;

        public BookContentService(MissingHistoricalRecordsDbContext db)
        {
            _db = db;
        }

        public BookContentGetListResponseDto GetContentsByBookID(int bookId)
        {
            BookContentGetListResponseDto dto = new();

            var lst = _db.TblContents
                .Where(x => x.DeleteFlag == false && x.BookId == bookId)
                .OrderBy(x => x.PageNo)
                .ToList();

            var contents = lst.Select(x => new BookContentDto
            {
                BookId = x.BookId,
                PageNo = x.PageNo,
                BookContent = x.BookContent
            }).ToList();

            dto.IsSuccess = true;
            dto.Message = "Success.";
            dto.Contents = contents;

            return dto;
        }

        public BookContentGetByIdResponseDto GetSingleContent(int bookId, int pageNo)
        {
            BookContentGetByIdResponseDto dto = new();

            var item = _db.TblContents
                .Where(x => x.DeleteFlag == false)
                .FirstOrDefault(x => x.BookId == bookId && x.PageNo == pageNo);

            if (item is null)
            {
                dto.IsSuccess = false;
                dto.Message = "Content not found.";
                return dto;
            }

            dto.IsSuccess = true;
            dto.Message = "Content retrieved successfully.";
            dto.Content = new BookContentDto
            {
                BookId = item.BookId,
                PageNo = item.PageNo,
                BookContent = item.BookContent
            };

            return dto;
        }

        public BookContentResultResponseDto CreateContent(BookContentCreateRequestDto requestDto)
        {
            bool isSuccess = false;
            string message = string.Empty;

            if (requestDto.BookId <= 0)
            {
                message = "Invalid Book Id.";
                goto Response;
            }

            if (requestDto.PageNo <= 0)
            {
                message = "Invalid Page No.";
                goto Response;
            }

            if (string.IsNullOrEmpty(requestDto.BookContent))
            {
                message = "Content cannot be empty.";
                goto Response;
            }

            var item = _db.TblContents
                .Where(x => x.DeleteFlag == false)
                .FirstOrDefault(x => x.BookId == requestDto.BookId && x.PageNo == requestDto.PageNo);

            if(item is not null)
            {
                message = "Content for the given Book Id and Page No already exists.";
                goto Response;
            }

            _db.TblContents.Add(new TblContent
            {
                BookId = requestDto.BookId,
                PageNo = requestDto.PageNo,
                BookContent = requestDto.BookContent,
                DeleteFlag = false
            });

            int result = _db.SaveChanges();

            message = "Saving Failed.";
            if (result > 0)
            {
                isSuccess = true;
                message = "Saving Successful.";
            }

        Response:
            return new BookContentResultResponseDto
            {
                IsSuccess = isSuccess,
                Message = message
            };
        }

        public BookContentResultResponseDto UpdateContent(
            int bookId,
            int pageNo,
            BookContentUpdateRequestDto requestDto)
        {
            bool isSuccess = false;
            string message = string.Empty;

            if (string.IsNullOrEmpty(requestDto.BookContent))
            {
                message = "Content cannot be empty.";
                goto Response;
            }

            var item = _db.TblContents
                .Where(x => x.DeleteFlag == false)
                .FirstOrDefault(x => x.BookId == bookId && x.PageNo == pageNo);

            if (item is null)
            {
                message = "Content not found.";
                goto Response;
            }

            item.BookContent = requestDto.BookContent;

            int result = _db.SaveChanges();

            message = "Updating Failed.";
            if (result > 0)
            {
                isSuccess = true;
                message = "Updating Successful.";
            }

        Response:
            return new BookContentResultResponseDto
            {
                IsSuccess = isSuccess,
                Message = message
            };
        }

        public BookContentResultResponseDto PatchContent(
            int bookId,
            int pageNo,
            BookContentPatchRequestDto requestDto)
        {
            bool isSuccess = false;
            string message = string.Empty;

            if (string.IsNullOrEmpty(requestDto.BookContent))
            {
                message = "No data to update.";
                goto Response;
            }

            var item = _db.TblContents
                .Where(x => x.DeleteFlag == false)
                .FirstOrDefault(x => x.BookId == bookId && x.PageNo == pageNo);

            if (item is null)
            {
                message = "Content not found.";
                goto Response;
            }

            item.BookContent = requestDto.BookContent;

            int result = _db.SaveChanges();

            message = "Patching Failed.";
            if (result > 0)
            {
                isSuccess = true;
                message = "Patching Successful.";
            }

        Response:
            return new BookContentResultResponseDto
            {
                IsSuccess = isSuccess,
                Message = message
            };
        }

        public BookContentResultResponseDto DeleteContent(int bookId, int pageNo)
        {
            BookContentResultResponseDto dto = new();

            var item = _db.TblContents
                .Where(x => x.DeleteFlag == false)
                .FirstOrDefault(x => x.BookId == bookId && x.PageNo == pageNo);

            if (item is null)
            {
                dto.Message = "Content not found.";
                return dto;
            }

            item.DeleteFlag = true;

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
