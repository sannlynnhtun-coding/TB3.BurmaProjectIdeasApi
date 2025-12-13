using Microsoft.AspNetCore.Mvc;
using MovieTicketOnlineBookingSystem.Api.Dtos;
using MovieTicketOnlineBookingSystem.Api.Services;

namespace MovieTicketOnlineBookingSystem.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RoomSeatController : ControllerBase
    {
        private readonly ICrudService _service;

        public RoomSeatController(ICrudService service)
        {
            _service = service;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll([FromQuery] PaginationRequestDto request)
        {
            var response = await _service.GetAllRoomSeatsAsync(request);
            return response.IsSuccess ? Ok(response) : BadRequest(response);
        }

        [HttpGet("room/{roomId}")]
        public async Task<IActionResult> GetByRoomId(int roomId, [FromQuery] PaginationRequestDto request)
        {
            var response = await _service.GetRoomSeatsByRoomIdAsync(roomId, request);
            return response.IsSuccess ? Ok(response) : BadRequest(response);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var response = await _service.GetRoomSeatByIdAsync(id);
            return response.IsSuccess ? Ok(response) : NotFound(response);
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] CreateRoomSeatDto dto)
        {
            var response = await _service.CreateRoomSeatAsync(dto);
            return response.IsSuccess ? CreatedAtAction(nameof(GetById), new { id = response.Seat?.SeatId }, response) : BadRequest(response);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] UpdateRoomSeatDto dto)
        {
            var response = await _service.UpdateRoomSeatAsync(id, dto);
            return response.IsSuccess ? Ok(response) : NotFound(response);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var response = await _service.DeleteRoomSeatAsync(id);
            return response.IsSuccess ? Ok(response) : NotFound(response);
        }
    }
}

