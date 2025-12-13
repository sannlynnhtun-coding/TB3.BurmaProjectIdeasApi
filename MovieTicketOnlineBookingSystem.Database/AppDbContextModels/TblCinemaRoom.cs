using System;
using System.Collections.Generic;

namespace MovieTicketOnlineBookingSystem.Database.AppDbContextModels;

public partial class TblCinemaRoom
{
    public int RoomId { get; set; }

    public int CinemaId { get; set; }

    public int? RoomNumber { get; set; }

    public string? RoomName { get; set; }

    public int? SeatingCapacity { get; set; }

    public virtual TblCinemaList Cinema { get; set; } = null!;

    public virtual ICollection<TblRoomSeat> TblRoomSeats { get; set; } = new List<TblRoomSeat>();

    public virtual ICollection<TblSeatPrice> TblSeatPrices { get; set; } = new List<TblSeatPrice>();

    public virtual ICollection<TblShowDate> TblShowDates { get; set; } = new List<TblShowDate>();
}
