using Microsoft.AspNetCore.Mvc;
using MovieTicketOnlineBookingSystem.Api.Dtos;
using MovieTicketOnlineBookingSystem.Api.Services;

namespace MovieTicketOnlineBookingSystem.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ShowDateController : ControllerBase
    {
        private readonly ICrudService _service;

        public ShowDateController(ICrudService service)
        {
            _service = service;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll([FromQuery] PaginationRequestDto request)
        {
            var response = await _service.GetAllShowDatesAsync(request);
            return response.IsSuccess ? Ok(response) : BadRequest(response);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var response = await _service.GetShowDateByIdAsync(id);
            return response.IsSuccess ? Ok(response) : NotFound(response);
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] CreateShowDateDto dto)
        {
            var response = await _service.CreateShowDateAsync(dto);
            return response.IsSuccess ? CreatedAtAction(nameof(GetById), new { id = response.ShowDate?.ShowDateId }, response) : BadRequest(response);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] UpdateShowDateDto dto)
        {
            var response = await _service.UpdateShowDateAsync(id, dto);
            return response.IsSuccess ? Ok(response) : NotFound(response);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var response = await _service.DeleteShowDateAsync(id);
            return response.IsSuccess ? Ok(response) : NotFound(response);
        }
    }
}

