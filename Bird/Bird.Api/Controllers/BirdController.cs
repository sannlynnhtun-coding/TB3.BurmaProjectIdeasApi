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
        public IActionResult PostBird(BirdCreateRequestDto request)
        {
            var result = _birdService.CreateBird(request);
            if (!result.IsSuccess)
                return BadRequest(result);
            
            return Ok(result);
        }

        [HttpPatch]
        public IActionResult PatchBird(int id, BirdUpdateRequestDto request)
        {
            var result = _birdService.UpdateBird(id, request);
            if (!result.IsSuccess)
                return BadRequest(result);
            
            return Ok(result);
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteBird(int id)
        {
            var result = _birdService.DeleteBird(id);
            if (!result.IsSuccess)
                return BadRequest(result);
            
            return Ok(result);
        }

        [HttpPost("Seed")]
        public IActionResult SeedBird()
        {
            var result = _birdService.SeedBird();
            return Ok(result);
        }
    }
}