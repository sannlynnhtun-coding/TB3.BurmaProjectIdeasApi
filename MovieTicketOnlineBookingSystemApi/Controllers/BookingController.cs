using Microsoft.AspNetCore.Mvc;
using MovieTicketOnlineBookingSystem.Api.Dtos;
using MovieTicketOnlineBookingSystem.Api.Services;

namespace MovieTicketOnlineBookingSystem.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BookingController : ControllerBase
    {
        private readonly IMovieBookingService _bookingService;
        private readonly ICrudService _crudService;

        public BookingController(IMovieBookingService bookingService, ICrudService crudService)
        {
            _bookingService = bookingService;
            _crudService = crudService;
        }

        // Existing booking endpoints
        [HttpGet("movies")]
        public async Task<IActionResult> GetMovies([FromQuery] MovieListRequestDto request)
        {
            var response = await _bookingService.GetMoviesAsync(request);
            return response.IsSuccess ? Ok(response) : BadRequest(response);
        }

        [HttpGet("cinemas")]
        public async Task<IActionResult> GetCinemas([FromQuery] CinemaListRequestDto request)
        {
            var response = await _bookingService.GetCinemasAsync(request);
            return response.IsSuccess ? Ok(response) : BadRequest(response);
        }

        [HttpGet("schedules")]
        public async Task<IActionResult> GetSchedules([FromQuery] ScheduleRequestDto request)
        {
            var response = await _bookingService.GetSchedulesAsync(request);
            return response.IsSuccess ? Ok(response) : BadRequest(response);
        }

        [HttpGet("seats/{showId}")]
        public async Task<IActionResult> GetSeats(int showId, [FromQuery] int pageNo = 1, [FromQuery] int pageSize = 10)
        {
            var request = new SeatRequestDto
            {
                ShowId = showId,
                PageNo = pageNo,
                PageSize = pageSize
            };
            var response = await _bookingService.GetSeatsForShowAsync(request);
            return response.IsSuccess ? Ok(response) : BadRequest(response);
        }

        [HttpPost("book")]
        public async Task<IActionResult> BookTickets([FromBody] BookingRequestDto request)
        {
            var response = await _bookingService.BookTicketsAsync(request);
            return response.IsSuccess ? Ok(response) : BadRequest(response);
        }

        // CRUD operations for Bookings
        [HttpGet]
        public async Task<IActionResult> GetAll([FromQuery] PaginationRequestDto request)
        {
            var response = await _crudService.GetAllBookingsAsync(request);
            return response.IsSuccess ? Ok(response) : BadRequest(response);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var response = await _crudService.GetBookingByIdAsync(id);
            return response.IsSuccess ? Ok(response) : NotFound(response);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] UpdateBookingDto dto)
        {
            var response = await _crudService.UpdateBookingAsync(id, dto);
            return response.IsSuccess ? Ok(response) : NotFound(response);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var response = await _crudService.DeleteBookingAsync(id);
            return response.IsSuccess ? Ok(response) : NotFound(response);
        }
    }
}

