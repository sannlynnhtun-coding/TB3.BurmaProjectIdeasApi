using DreamDictionary.Api.Dtos;
using DreamDictionary.Api.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace DreamDictionary.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class DreamDictionaryController : ControllerBase
    {
        private readonly IDreamDictionaryService _dreamDictionaryService;

        public DreamDictionaryController(IDreamDictionaryService dreamDictionaryService)
        {
            _dreamDictionaryService = dreamDictionaryService;
        }

        [HttpGet("headers/{pageNo}/{pageSize}")]
        public IActionResult GetBlogHeaders(int pageNo, int pageSize)
        {
            var result = _dreamDictionaryService.GetBlogHeaders(pageNo, pageSize);
            if (!result.IsSuccess)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }

        [HttpGet("details/{pageNo}/{pageSize}")]
        public IActionResult GetBlogDetails(int pageNo, int pageSize)
        {
            var result = _dreamDictionaryService.GetBlogDetails(pageNo, pageSize);
            if (!result.IsSuccess)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }

        [HttpGet("header/{blogHeaderId}")]
        public IActionResult GetBlogDetailsByHeaderId(int blogHeaderId)
        {
            var result = _dreamDictionaryService.GetBlogDetailsByHeaderId(blogHeaderId);
            if (!result.IsSuccess)
            {
                return NotFound(result);
            }
            return Ok(result);
        }

        [HttpGet("detail/{blogDetailId}")]
        public IActionResult GetBlogDetailById(int blogDetailId)
        {
            var result = _dreamDictionaryService.GetBlogDetailById(blogDetailId);
            if (!result.IsSuccess)
            {
                return NotFound(result);
            }
            return Ok(result);
        }

        [HttpGet("search/{search}")]
        public IActionResult SearchDreams(string search)
        {
            var result = _dreamDictionaryService.SearchDreams(search);
            if (!result.IsSuccess)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }

        [HttpPost]
        public IActionResult CreateBlogDetail()
        {
            return ReadOnly();
        }

        [HttpPatch("{id}")]
        public IActionResult UpdateBlogDetail(int id)
        {
            return ReadOnly();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteBlogDetail(int id)
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

