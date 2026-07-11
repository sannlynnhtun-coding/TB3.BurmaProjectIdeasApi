using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Quotlets.Api.Dtos;
using Quotlets.Api.Service;

namespace Quotlets.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class QuotletsController : ControllerBase
    {
        private readonly IQuotletsService _quotletsService;

        public QuotletsController(IQuotletsService quotletsService)
        {
            _quotletsService = quotletsService;
        }

        [HttpGet]
        public IActionResult Get() {
            var result = _quotletsService.Get(1, 10);
            
            if (!result.IsSuccess)
            {
                return BadRequest(result.Message);
            }

            return Ok(result);
        }

        [HttpGet("{id}")]
        public IActionResult GetById(string id)
        {
            var result = _quotletsService.GetById(id);
            if (!result.IsSuccess)
            {
                return NotFound(result.Message);
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
