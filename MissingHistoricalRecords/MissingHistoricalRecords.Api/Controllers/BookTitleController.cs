using Microsoft.AspNetCore.Mvc;
using MissingHistoricalRecords.Api.Services;
using static MissingHistoricalRecords.Api.DAOs.BookResponseDto;
using static MissingHistoricalRecords.Api.DTOs.BookRequestDto;

namespace MissingHistoricalRecords.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BookTitleController : Controller
    {
        private readonly IBookTitleService _bookService;

        public BookTitleController(IBookTitleService bookService)
        {
            _bookService = bookService;
        }

        [HttpGet("{pageNo}/{pageSize}")]
        public IActionResult GetBooks(int pageNo, int pageSize)
        {
            var result = _bookService.GetBooks(pageNo, pageSize);
            if (!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }

        [HttpGet("{id}")]
        public IActionResult GetBook(int id)
        {
            var result = _bookService.GetBookById(id);
            if (!result.IsSuccess)
                return NotFound(result);

            return Ok(result);
        }

        [HttpPost]
        public IActionResult CreateBook(BookCreateRequestDto request)
        {
            var result = _bookService.CreateBook(request);
            if (!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }

        [HttpPut("{id}")]
        public IActionResult UpdateBook(int id, BookUpdateRequestDto request)
        {
            var result = _bookService.UpdateBook(id, request);
            if (!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }

        [HttpPatch("{id}")]
        public IActionResult PatchBook(int id, BookPatchRequestDto request)
        {
            BookResultResponseDto result = _bookService.PatchBook(id, request);

            if (!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteBook(int id)
        {
            BookResultResponseDto result = _bookService.DeleteBook(id);
            if (!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }
    }
}