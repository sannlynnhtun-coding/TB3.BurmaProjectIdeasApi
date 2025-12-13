using Microsoft.AspNetCore.Mvc;
using MovieTicketOnlineBookingSystem.Api.Dtos;
using MovieTicketOnlineBookingSystem.Api.Services;

namespace MovieTicketOnlineBookingSystem.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CinemaRoomController : ControllerBase
    {
        private readonly ICrudService _service;

        public CinemaRoomController(ICrudService service)
        {
            _service = service;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll([FromQuery] PaginationRequestDto request)
        {
            var response = await _service.GetAllCinemaRoomsAsync(request);
            return response.IsSuccess ? Ok(response) : BadRequest(response);
        }

        [HttpGet("cinema/{cinemaId}")]
        public async Task<IActionResult> GetByCinemaId(int cinemaId, [FromQuery] PaginationRequestDto request)
        {
            var response = await _service.GetCinemaRoomsByCinemaIdAsync(cinemaId, request);
            return response.IsSuccess ? Ok(response) : BadRequest(response);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var response = await _service.GetCinemaRoomByIdAsync(id);
            return response.IsSuccess ? Ok(response) : NotFound(response);
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] CreateCinemaRoomDto dto)
        {
            var response = await _service.CreateCinemaRoomAsync(dto);
            return response.IsSuccess ? CreatedAtAction(nameof(GetById), new { id = response.Room?.RoomId }, response) : BadRequest(response);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] UpdateCinemaRoomDto dto)
        {
            var response = await _service.UpdateCinemaRoomAsync(id, dto);
            return response.IsSuccess ? Ok(response) : NotFound(response);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var response = await _service.DeleteCinemaRoomAsync(id);
            return response.IsSuccess ? Ok(response) : NotFound(response);
        }
    }
}

