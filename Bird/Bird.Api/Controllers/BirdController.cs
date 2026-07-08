using Bird.Api.Dtos;
using Bird.Api.Services;
using Microsoft.AspNetCore.Mvc;

namespace Bird.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BirdController : ControllerBase
    {
        private readonly IBirdService _birdService;

        public BirdController(IBirdService birdService)
        {
            _birdService = birdService;
        }

        [HttpGet("{pageNo}/{pageSize}")]
        public IActionResult GetBirds(int pageNo, int pageSize, [FromQuery] string? search)
        {
            var result = _birdService.GetBirds(pageNo, pageSize, search);
            if (!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }

        [HttpGet("{id}")]
        public IActionResult GetBird(int id)
        {
            var result = _birdService.GetBird(id);
            if (!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }

        [HttpPost]
        public IActionResult PostBird()
        {
            return ReadOnly();
        }

        [HttpPatch]
        public IActionResult PatchBird()
        {
            return ReadOnly();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteBird(int id)
        {
            return ReadOnly();
        }

        [HttpPost("Seed")]
        public IActionResult SeedBird()
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
