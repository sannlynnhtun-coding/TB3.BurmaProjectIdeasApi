using Microsoft.AspNetCore.Mvc;
using MovieTicketOnlineBookingSystem.Api.Dtos;
using MovieTicketOnlineBookingSystem.Api.Services;

namespace MovieTicketOnlineBookingSystem.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MovieController : ControllerBase
    {
        private readonly ICrudService _service;

        public MovieController(ICrudService service)
        {
            _service = service;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll([FromQuery] PaginationRequestDto request)
        {
            var response = await _service.GetAllMoviesAsync(request);
            return response.IsSuccess ? Ok(response) : BadRequest(response);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var response = await _service.GetMovieByIdAsync(id);
            return response.IsSuccess ? Ok(response) : NotFound(response);
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] CreateMovieDto dto)
        {
            var response = await _service.CreateMovieAsync(dto);
            return response.IsSuccess ? CreatedAtAction(nameof(GetById), new { id = response.Movie?.MovieId }, response) : BadRequest(response);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] UpdateMovieDto dto)
        {
            var response = await _service.UpdateMovieAsync(id, dto);
            return response.IsSuccess ? Ok(response) : NotFound(response);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var response = await _service.DeleteMovieAsync(id);
            return response.IsSuccess ? Ok(response) : NotFound(response);
        }
    }
}

