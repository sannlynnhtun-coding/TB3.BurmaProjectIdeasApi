using MovieTicketOnlineBookingSystem.Database.AppDbContextModels;

namespace MovieTicketOnlineBookingSystem.Api.Dtos
{
    // Movie CRUD DTOs
    public class CreateMovieDto
    {
        public string MovieTitle { get; set; } = null!;
        public DateTime? ReleaseDate { get; set; }
        public string? Duration { get; set; }
        public string? MoviePhoto { get; set; }
    }

    public class UpdateMovieDto
    {
        public string? MovieTitle { get; set; }
        public DateTime? ReleaseDate { get; set; }
        public string? Duration { get; set; }
        public string? MoviePhoto { get; set; }
    }

    public class MovieResponseDto : BaseResponseDto
    {
        public TblMovieList? Movie { get; set; }
    }

    // Cinema CRUD DTOs
    public class CreateCinemaDto
    {
        public string CinemaName { get; set; } = null!;
        public string? CinemaLocation { get; set; }
    }

    public class UpdateCinemaDto
    {
        public string? CinemaName { get; set; }
        public string? CinemaLocation { get; set; }
    }

    public class CinemaResponseDto : BaseResponseDto
    {
        public TblCinemaList? Cinema { get; set; }
    }

    // Cinema Room CRUD DTOs
    public class CreateCinemaRoomDto
    {
        public int CinemaId { get; set; }
        public int? RoomNumber { get; set; }
        public string? RoomName { get; set; }
        public int? SeatingCapacity { get; set; }
    }

    public class UpdateCinemaRoomDto
    {
        public int? CinemaId { get; set; }
        public int? RoomNumber { get; set; }
        public string? RoomName { get; set; }
        public int? SeatingCapacity { get; set; }
    }

    public class CinemaRoomResponseDto : BaseResponseDto
    {
        public TblCinemaRoom? Room { get; set; }
    }

    public class CinemaRoomListResponseDto : BaseResponseDto
    {
        public List<TblCinemaRoom> Rooms { get; set; } = new();
        public int TotalCount { get; set; }
        public int PageNo { get; set; }
        public int PageSize { get; set; }
        public int TotalPages { get; set; }
    }

    // Show Date CRUD DTOs
    public class CreateShowDateDto
    {
        public int CinemaId { get; set; }
        public int RoomId { get; set; }
        public int MovieId { get; set; }
    }

    public class UpdateShowDateDto
    {
        public int? CinemaId { get; set; }
        public int? RoomId { get; set; }
        public int? MovieId { get; set; }
    }

    public class ShowDateResponseDto : BaseResponseDto
    {
        public TblShowDate? ShowDate { get; set; }
    }

    public class ShowDateListResponseDto : BaseResponseDto
    {
        public List<TblShowDate> ShowDates { get; set; } = new();
        public int TotalCount { get; set; }
        public int PageNo { get; set; }
        public int PageSize { get; set; }
        public int TotalPages { get; set; }
    }

    // Movie Schedule CRUD DTOs
    public class CreateMovieScheduleDto
    {
        public int ShowDateId { get; set; }
        public DateTime ShowDateTime { get; set; }
    }

    public class UpdateMovieScheduleDto
    {
        public int? ShowDateId { get; set; }
        public DateTime? ShowDateTime { get; set; }
    }

    public class MovieScheduleResponseDto : BaseResponseDto
    {
        public TblMovieSchedule? Schedule { get; set; }
    }

    // Room Seat CRUD DTOs
    public class CreateRoomSeatDto
    {
        public int RoomId { get; set; }
        public int? SeatNo { get; set; }
        public string? RowName { get; set; }
        public string? SeatType { get; set; }
    }

    public class UpdateRoomSeatDto
    {
        public int? RoomId { get; set; }
        public int? SeatNo { get; set; }
        public string? RowName { get; set; }
        public string? SeatType { get; set; }
    }

    public class RoomSeatResponseDto : BaseResponseDto
    {
        public TblRoomSeat? Seat { get; set; }
    }

    // Seat Price CRUD DTOs
    public class CreateSeatPriceDto
    {
        public int RoomId { get; set; }
        public string? RowName { get; set; }
        public decimal? SeatPrice { get; set; }
    }

    public class UpdateSeatPriceDto
    {
        public int? RoomId { get; set; }
        public string? RowName { get; set; }
        public decimal? SeatPrice { get; set; }
    }

    public class SeatPriceResponseDto : BaseResponseDto
    {
        public TblSeatPrice? SeatPrice { get; set; }
    }

    public class SeatPriceListResponseDto : BaseResponseDto
    {
        public List<TblSeatPrice> SeatPrices { get; set; } = new();
        public int TotalCount { get; set; }
        public int PageNo { get; set; }
        public int PageSize { get; set; }
        public int TotalPages { get; set; }
    }

    // Booking CRUD DTOs
    public class UpdateBookingDto
    {
        public int? ShowId { get; set; }
        public string? CustomerName { get; set; }
        public decimal? TotalAmount { get; set; }
    }

    public class BookingListResponseDto : BaseResponseDto
    {
        public List<TblBooking> Bookings { get; set; } = new();
        public int TotalCount { get; set; }
        public int PageNo { get; set; }
        public int PageSize { get; set; }
        public int TotalPages { get; set; }
    }

    // Generic pagination request
    public class PaginationRequestDto
    {
        public int PageNo { get; set; } = 1;
        public int PageSize { get; set; } = 10;
    }
}

