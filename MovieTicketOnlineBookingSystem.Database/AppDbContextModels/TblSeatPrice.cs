using System;
using System.Collections.Generic;

namespace MovieTicketOnlineBookingSystem.Database.AppDbContextModels;

public partial class TblSeatPrice
{
    public int SeatPriceId { get; set; }

    public int RoomId { get; set; }

    public string? RowName { get; set; }

    public decimal? SeatPrice { get; set; }

    public virtual TblCinemaRoom Room { get; set; } = null!;
}
