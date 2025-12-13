using MovieTicketOnlineBookingSystem.Database.AppDbContextModels;

namespace MovieTicketOnlineBookingSystem.Api.Dtos
{
    public class MovieListResponseDto : BaseResponseDto
    {
        public List<TblMovieList> Movies { get; set; } = new();
        public int TotalCount { get; set; }
        public int PageNo { get; set; }
        public int PageSize { get; set; }
        public int TotalPages { get; set; }
    }

    public class CinemaListResponseDto : BaseResponseDto
    {
        public List<TblCinemaList> Cinemas { get; set; } = new();
        public int TotalCount { get; set; }
        public int PageNo { get; set; }
        public int PageSize { get; set; }
        public int TotalPages { get; set; }
    }

    public class ScheduleResponseDto : BaseResponseDto
    {
        public List<TblMovieSchedule> Schedules { get; set; } = new();
        public int TotalCount { get; set; }
        public int PageNo { get; set; }
        public int PageSize { get; set; }
        public int TotalPages { get; set; }
    }

    public class SeatResponseDto : BaseResponseDto
    {
        public List<TblRoomSeat> Seats { get; set; } = new();
        public int TotalCount { get; set; }
        public int PageNo { get; set; }
        public int PageSize { get; set; }
        public int TotalPages { get; set; }
    }

    public class BookingResponseDto : BaseResponseDto
    {
        public int? BookingId { get; set; }
        public decimal? TotalAmount { get; set; }
    }
}
