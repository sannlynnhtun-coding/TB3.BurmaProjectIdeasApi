using BaganMap.Api.Dtos;
using BaganMap.Api.Services;
using Microsoft.AspNetCore.Mvc;

namespace BaganMap.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BaganMapController : ControllerBase
    {
        private readonly IBaganMapService _baganMapService;

        public BaganMapController(IBaganMapService baganMapService)
        {
            _baganMapService = baganMapService;
        }

        [HttpGet("{pageNo}/{pageSize}")]
        public IActionResult GetBaganMaps(int pageNo, int pageSize, [FromQuery] string? search)
        {
            var result = _baganMapService.GetBaganMaps(pageNo, pageSize, search);
            if (!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }

        [HttpGet("{id}")]
        public IActionResult GetBaganMap(string id)
        {
            var result = _baganMapService.GetBaganMap(id);
            if (!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }

        [HttpPost]
        public IActionResult PostBaganMap()
        {
            return ReadOnly();
        }

        [HttpPatch]
        public IActionResult PatchBaganMap()
        {
            return ReadOnly();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteBaganMap(string id)
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
