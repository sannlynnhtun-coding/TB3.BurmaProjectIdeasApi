namespace MovieTicketOnlineBookingSystem.Api.Dtos
{
    public class MovieListRequestDto
    {
        public int PageNo { get; set; } = 1;
        public int PageSize { get; set; } = 10;
    }

    public class CinemaListRequestDto
    {
        public int PageNo { get; set; } = 1;
        public int PageSize { get; set; } = 10;
    }

    public class ScheduleRequestDto
    {
        public int MovieId { get; set; }
        public int CinemaId { get; set; }
        public DateTime Date { get; set; }
        public int PageNo { get; set; } = 1;
        public int PageSize { get; set; } = 10;
    }

    public class SeatRequestDto
    {
        public int ShowId { get; set; }
        public int PageNo { get; set; } = 1;
        public int PageSize { get; set; } = 10;
    }

    public class BookingRequestDto
    {
        public int ShowId { get; set; }
        public string CustomerName { get; set; } = string.Empty;
        public List<int> SeatIds { get; set; } = new();
    }
}

