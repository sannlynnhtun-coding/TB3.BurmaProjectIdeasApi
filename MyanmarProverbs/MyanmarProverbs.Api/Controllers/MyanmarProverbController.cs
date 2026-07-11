using MyanmarProverbs.Api.Dtos;
using MyanmarProverbs.Api.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace MyanmarProverbs.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MyanmarProverbsController : ControllerBase
    {
        private readonly IMyanmarProverbService _proverbService;

        public MyanmarProverbsController(IMyanmarProverbService proverbService)
        {
            _proverbService = proverbService;
        }

        [HttpGet("titles")]
        public IActionResult GetProverbTitles()
        {
            var result = _proverbService.GetProverbTitles();
            if (!result.IsSuccess)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }

        [HttpGet("{pageNo}/{pageSize}")]
        public IActionResult GetProverbs(int pageNo, int pageSize)
        {
            var result = _proverbService.GetProverbs(pageNo, pageSize);
            if (!result.IsSuccess)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }

        [HttpGet("by-title/{titleId}")]
        public IActionResult GetProverbsByTitleId(int titleId)
        {
            var result = _proverbService.GetProverbsByTitleId(titleId);
            if (!result.IsSuccess)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }

        [HttpGet("proverb/{titleId}/{proverbId}")]
        public IActionResult GetProverb(int titleId, int proverbId)
        {
            var result = _proverbService.GetProverb(titleId, proverbId);
            if (!result.IsSuccess)
            {
                return NotFound(result);
            }
            return Ok(result);
        }

        [HttpGet("search/{keyword}")]
        public IActionResult SearchProverbs(string keyword)
        {
            var result = _proverbService.SearchProverbs(keyword);
            if (!result.IsSuccess)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }

        [HttpPost]
        public IActionResult Create()
        {
            return ReadOnly();
        }

        [HttpPut("{id}")]
        public IActionResult Update(string id)
        {
            return ReadOnly();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(string id)
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

