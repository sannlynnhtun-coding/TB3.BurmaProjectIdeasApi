using Microsoft.AspNetCore.Mvc;
using MovieTicketOnlineBookingSystem.Api.Dtos;
using MovieTicketOnlineBookingSystem.Api.Services;

namespace MovieTicketOnlineBookingSystem.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SeatPriceController : ControllerBase
    {
        private readonly ICrudService _service;

        public SeatPriceController(ICrudService service)
        {
            _service = service;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll([FromQuery] PaginationRequestDto request)
        {
            var response = await _service.GetAllSeatPricesAsync(request);
            return response.IsSuccess ? Ok(response) : BadRequest(response);
        }

        [HttpGet("room/{roomId}")]
        public async Task<IActionResult> GetByRoomId(int roomId, [FromQuery] PaginationRequestDto request)
        {
            var response = await _service.GetSeatPricesByRoomIdAsync(roomId, request);
            return response.IsSuccess ? Ok(response) : BadRequest(response);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var response = await _service.GetSeatPriceByIdAsync(id);
            return response.IsSuccess ? Ok(response) : NotFound(response);
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] CreateSeatPriceDto dto)
        {
            var response = await _service.CreateSeatPriceAsync(dto);
            return response.IsSuccess ? CreatedAtAction(nameof(GetById), new { id = response.SeatPrice?.SeatPriceId }, response) : BadRequest(response);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] UpdateSeatPriceDto dto)
        {
            var response = await _service.UpdateSeatPriceAsync(id, dto);
            return response.IsSuccess ? Ok(response) : NotFound(response);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var response = await _service.DeleteSeatPriceAsync(id);
            return response.IsSuccess ? Ok(response) : NotFound(response);
        }
    }
}

