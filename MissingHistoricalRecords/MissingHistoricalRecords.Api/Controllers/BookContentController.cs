using Microsoft.AspNetCore.Mvc;
using MissingHistoricalRecords.Api.Services;
using static MissingHistoricalRecords.Api.RequestDTOs.BookContentRequestDto;

namespace MissingHistoricalRecords.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BookContentController : Controller
    {
        private readonly IBookContentService _bookContentService;

        public BookContentController(IBookContentService bookContentService)
        {
            _bookContentService = bookContentService;
        }

        [HttpGet("{bookId}")]
        public IActionResult GetContentsByBookID(int bookId)
        {
            var result = _bookContentService.GetContentsByBookID(bookId);
            if (!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }

        [HttpGet("{bookId}/{pageNo}")]
        public IActionResult GetSingleContent(int bookId, int pageNo)
        {
            var result = _bookContentService.GetSingleContent(bookId, pageNo);
            if (!result.IsSuccess)
                return NotFound(result);

            return Ok(result);
        }

        [HttpPost]
        public IActionResult CreateContent()
        {
            return ReadOnly();
        }

        [HttpPut("{bookId}/{pageNo}")]
        public IActionResult UpdateContent(int bookId, int pageNo)
        {
            return ReadOnly();
        }

        [HttpPatch("{bookId}/{pageNo}")]
        public IActionResult PatchContent(int bookId, int pageNo)
        {
            return ReadOnly();
        }

        [HttpDelete("{bookId}/{pageNo}")]
        public IActionResult DeleteContent(int bookId, int pageNo)
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
