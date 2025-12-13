using System;
using System.Collections.Generic;

namespace MovieTicketOnlineBookingSystem.Database.AppDbContextModels;

public partial class TblBookingDetail
{
    public int BookingDetailId { get; set; }

    public int BookingId { get; set; }

    public int SeatId { get; set; }

    public decimal? Price { get; set; }

    public virtual TblBooking Booking { get; set; } = null!;

    public virtual TblRoomSeat Seat { get; set; } = null!;
}
