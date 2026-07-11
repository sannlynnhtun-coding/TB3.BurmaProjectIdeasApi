using PhayarSar.Api.Dtos;
using PhayarSar.Api.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace PhayarSar.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PhayarSarController : ControllerBase
    {
        private readonly IPhayarSarService _phayarSarService;

        public PhayarSarController(IPhayarSarService phayarSarService)
        {
            _phayarSarService = phayarSarService;
        }

        [HttpGet("groups")]
        public IActionResult GetGroups()
        {
            var result = _phayarSarService.GetGroups();
            if (!result.IsSuccess)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }

        [HttpGet("groups/{groupId}")]
        public IActionResult GetGroupById(int groupId)
        {
            var result = _phayarSarService.GetGroupById(groupId);
            if (!result.IsSuccess)
            {
                return NotFound(result);
            }
            return Ok(result);
        }

        [HttpGet("contents/{groupId}/{id}")]
        public IActionResult GetContent(int groupId, int id)
        {
            var result = _phayarSarService.GetContent(groupId, id);
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
