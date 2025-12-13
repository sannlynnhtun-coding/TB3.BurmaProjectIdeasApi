using Microsoft.AspNetCore.Mvc;
using MovieTicketOnlineBookingSystem.Api.Dtos;
using MovieTicketOnlineBookingSystem.Api.Services;

namespace MovieTicketOnlineBookingSystem.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CinemaController : ControllerBase
    {
        private readonly ICrudService _service;

        public CinemaController(ICrudService service)
        {
            _service = service;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll([FromQuery] PaginationRequestDto request)
        {
            var response = await _service.GetAllCinemasAsync(request);
            return response.IsSuccess ? Ok(response) : BadRequest(response);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var response = await _service.GetCinemaByIdAsync(id);
            return response.IsSuccess ? Ok(response) : NotFound(response);
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] CreateCinemaDto dto)
        {
            var response = await _service.CreateCinemaAsync(dto);
            return response.IsSuccess ? CreatedAtAction(nameof(GetById), new { id = response.Cinema?.CinemaId }, response) : BadRequest(response);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] UpdateCinemaDto dto)
        {
            var response = await _service.UpdateCinemaAsync(id, dto);
            return response.IsSuccess ? Ok(response) : NotFound(response);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var response = await _service.DeleteCinemaAsync(id);
            return response.IsSuccess ? Ok(response) : NotFound(response);
        }
    }
}

