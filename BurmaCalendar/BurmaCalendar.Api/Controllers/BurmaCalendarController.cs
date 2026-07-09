using BurmaCalendar.Api.Dtos;
using BurmaCalendar.Api.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace BurmaCalendar.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BurmaCalendarController : ControllerBase
    {
        private readonly IBurmaCalendar _burmaCalendarService;

        public BurmaCalendarController(IBurmaCalendar burmaCalendarService)
        {
            _burmaCalendarService = burmaCalendarService;
        }

        [HttpGet("{pageNo}/{pageSize}")]
        public IActionResult GetCalendarList(int pageNo, int pageSize)
        {
            var result = _burmaCalendarService.GetCalendarList(pageNo, pageSize);
            if (!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }

        [HttpGet("{id}")]
        public IActionResult GetCalendarById(int id)
        {
            var result = _burmaCalendarService.GetCalendarById(id);
            if (!result.IsSuccess)
                return NotFound(result);

            return Ok(result);
        }

        [HttpPost]
        public IActionResult CreateCalendar()
        {
            return ReadOnly();
        }

        [HttpPut("{id}")]
        public IActionResult UpdateCalendar(int id)
        {
            return ReadOnly();
        }

        [HttpPatch("{id}")]
        public IActionResult PatchCalendar(int id)
        {
            return ReadOnly();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteCalendar(int id)
        {
            return ReadOnly();
        }

        private ObjectResult ReadOnly()
        {
            return StatusCode(StatusCodes.Status405MethodNotAllowed, new BurmaCalendarResponseDto
            {
                IsSuccess = false,
                Message = "Read-only JSON data source."
            });
        }
    }
}
