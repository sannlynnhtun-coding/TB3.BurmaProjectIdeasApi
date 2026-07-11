using ArtGallery.Api.Dtos;
using ArtGallery.Api.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace ArtGallery.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ArtGalleryController : ControllerBase
    {
        private readonly IArtGalleryService _artGalleryService;

        public ArtGalleryController(IArtGalleryService artGalleryService)
        {
            _artGalleryService = artGalleryService;
        }

        [HttpGet("{pageNo}/{pageSize}")]
        public IActionResult GetGalleries(int pageNo, int pageSize)
        {
            var result = _artGalleryService.GetGalleries(pageNo, pageSize);
            if (!result.IsSuccess)
            {
                return BadRequest(result);
            }

            return Ok(result);
        }

        [HttpGet("{id}")]
        public IActionResult GetGallery(int id)
        {
            var result = _artGalleryService.GetGallery(id);
            if (!result.IsSuccess)
            {
                return NotFound(result);
            }

            return Ok(result);
        }

        [HttpPost]
        public IActionResult CreateGallery()
        {
            return ReadOnly();
        }

        [HttpPatch]
        public IActionResult UpdateGallery()
        {
            return ReadOnly();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteGallery(int id)
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
