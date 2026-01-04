using MissingHistoricalRecords.Api.RequestDTOs;
using MissingHistoricalRecords.Api.ResponseDTOs;

namespace MissingHistoricalRecords.Api.Services
{
    public interface IBookContentService
    {
        BookContentResponseDto.BookContentResultResponseDto CreateContent(BookContentRequestDto.BookContentCreateRequestDto requestDto);
        BookContentResponseDto.BookContentResultResponseDto DeleteContent(int bookId, int pageNo);
        BookContentResponseDto.BookContentGetByIdResponseDto GetSingleContent(int bookId, int pageNo);
        BookContentResponseDto.BookContentGetListResponseDto GetContentsByBookID(int bookId);
        BookContentResponseDto.BookContentResultResponseDto PatchContent(int bookId, int pageNo, BookContentRequestDto.BookContentPatchRequestDto requestDto);
        BookContentResponseDto.BookContentResultResponseDto UpdateContent(int bookId, int pageNo, BookContentRequestDto.BookContentUpdateRequestDto requestDto);
    }
}