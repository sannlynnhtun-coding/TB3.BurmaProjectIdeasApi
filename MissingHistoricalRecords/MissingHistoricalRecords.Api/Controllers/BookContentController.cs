using Microsoft.AspNetCore.Mvc;
using MissingHistoricalRecords.Api.Services;
using static MissingHistoricalRecords.Api.RequestDTOs.BookContentRequestDto;
using static MissingHistoricalRecords.Api.ResponseDTOs.BookContentResponseDto;

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
        public IActionResult CreateContent(BookContentCreateRequestDto request)
        {
            var result = _bookContentService.CreateContent(request);
            if (!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }

        [HttpPut("{bookId}/{pageNo}")]
        public IActionResult UpdateContent(
            int bookId,
            int pageNo,
            BookContentUpdateRequestDto request)
        {
            var result = _bookContentService.UpdateContent(bookId, pageNo, request);
            if (!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }

        [HttpPatch("{bookId}/{pageNo}")]
        public IActionResult PatchContent(
            int bookId,
            int pageNo,
            BookContentPatchRequestDto request)
        {
            BookContentResultResponseDto result =
                _bookContentService.PatchContent(bookId, pageNo, request);

            if (!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }

        [HttpDelete("{bookId}/{pageNo}")]
        public IActionResult DeleteContent(int bookId, int pageNo)
        {
            BookContentResultResponseDto result =
                _bookContentService.DeleteContent(bookId, pageNo);

            if (!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }
    }
}
