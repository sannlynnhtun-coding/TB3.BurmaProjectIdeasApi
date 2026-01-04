using MissingHistoricalRecords.Api.DAOs;
using MissingHistoricalRecords.Api.DTOs;

namespace MissingHistoricalRecords.Api.Services
{
    public interface IBookTitleService
    {
        BookResponseDto.BookResultResponseDto CreateBook(BookRequestDto.BookCreateRequestDto requestDto);
        BookResponseDto.BookResultResponseDto DeleteBook(int id);
        BookResponseDto.BookGetByIdResponseDto GetBookById(int id);
        BookResponseDto.BookGetListResponseDto GetBooks(int pageNo, int pageSize);
        BookResponseDto.BookResultResponseDto PatchBook(int id, BookRequestDto.BookPatchRequestDto requestDto);
        BookResponseDto.BookResultResponseDto UpdateBook(int id, BookRequestDto.BookUpdateRequestDto requestDto);
    }
}