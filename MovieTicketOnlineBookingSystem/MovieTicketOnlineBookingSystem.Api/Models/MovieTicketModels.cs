namespace MovieTicketOnlineBookingSystem.Api.Models;

public class MovieTicketData
{
    public List<TblMovieList> Movies { get; set; } = new();
    public List<TblCinemaList> Cinemas { get; set; } = new();
    public List<TblCinemaRoom> CinemaRooms { get; set; } = new();
    public List<TblSeatPrice> SeatPrices { get; set; } = new();
    public List<TblRoomSeat> RoomSeats { get; set; } = new();
    public List<TblShowDate> ShowDates { get; set; } = new();
    public List<TblMovieSchedule> MovieSchedules { get; set; } = new();
    public List<TblBooking> Bookings { get; set; } = new();
    public List<TblBookingDetail> BookingDetails { get; set; } = new();
}

public class TblMovieList
{
    public int MovieId { get; set; }
    public string MovieTitle { get; set; } = null!;
    public DateTime? ReleaseDate { get; set; }
    public string? Duration { get; set; }
    public string? MoviePhoto { get; set; }
}

public class TblCinemaList
{
    public int CinemaId { get; set; }
    public string CinemaName { get; set; } = null!;
    public string? CinemaLocation { get; set; }
}

public class TblCinemaRoom
{
    public int RoomId { get; set; }
    public int CinemaId { get; set; }
    public int? RoomNumber { get; set; }
    public string? RoomName { get; set; }
    public int? SeatingCapacity { get; set; }
}

public class TblSeatPrice
{
    public int SeatPriceId { get; set; }
    public int RoomId { get; set; }
    public string? RowName { get; set; }
    public decimal? SeatPrice { get; set; }
}

public class TblRoomSeat
{
    public int SeatId { get; set; }
    public int RoomId { get; set; }
    public int? SeatNo { get; set; }
    public string? RowName { get; set; }
    public string? SeatType { get; set; }
}

public class TblShowDate
{
    public int ShowDateId { get; set; }
    public int CinemaId { get; set; }
    public int RoomId { get; set; }
    public int MovieId { get; set; }
}

public class TblMovieSchedule
{
    public int ShowId { get; set; }
    public int ShowDateId { get; set; }
    public DateTime ShowDateTime { get; set; }
}

public class TblBooking
{
    public int BookingId { get; set; }
    public int ShowId { get; set; }
    public DateTime? BookingDate { get; set; }
    public string? CustomerName { get; set; }
    public decimal? TotalAmount { get; set; }
}

public class TblBookingDetail
{
    public int BookingDetailId { get; set; }
    public int BookingId { get; set; }
    public int SeatId { get; set; }
    public decimal? Price { get; set; }
}
