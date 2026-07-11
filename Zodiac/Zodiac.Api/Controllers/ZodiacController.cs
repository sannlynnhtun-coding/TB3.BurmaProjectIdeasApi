using Zodiac.Api.Dtos;
using Zodiac.Api.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Zodiac.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ZodiacController : ControllerBase
    {
        private readonly IZodiacService _zodiacService;

        public ZodiacController(IZodiacService zodiacService)
        {
            _zodiacService = zodiacService;
        }

        [HttpGet]
        public IActionResult GetZodiacSigns()
        {
            var result = _zodiacService.GetZodiacSigns();
            if (!result.IsSuccess)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }

        [HttpGet("{id}")]
        public IActionResult GetZodiacSignById(int id)
        {
            var result = _zodiacService.GetZodiacSignById(id);
            if (!result.IsSuccess)
            {
                return NotFound(result);
            }
            return Ok(result);
        }

        [HttpGet("name/{name}")]
        public IActionResult GetZodiacSignByName(string name)
        {
            var result = _zodiacService.GetZodiacSignByName(name);
            if (!result.IsSuccess)
            {
                return NotFound(result);
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
