using Microsoft.AspNetCore.Mvc;
using MissingHistoricalRecords.Api.Services;
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
        public IActionResult CreateBook()
        {
            return ReadOnly();
        }

        [HttpPut("{id}")]
        public IActionResult UpdateBook(int id)
        {
            return ReadOnly();
        }

        [HttpPatch("{id}")]
        public IActionResult PatchBook(int id)
        {
            return ReadOnly();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteBook(int id)
        {
            return ReadOnly();
        }

        private ObjectResult ReadOnly()
        {
            return StatusCode(StatusCodes.Status405MethodNotAllowed, new
            {
                IsSuccess = false,
                Message = "Read-only JSON data source."
            });
        }
    }
}
