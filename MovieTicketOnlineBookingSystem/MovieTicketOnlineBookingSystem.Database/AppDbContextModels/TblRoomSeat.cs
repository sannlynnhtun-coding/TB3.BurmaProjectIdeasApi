using System;
using System.Collections.Generic;

namespace MovieTicketOnlineBookingSystem.Database.AppDbContextModels;

public partial class TblRoomSeat
{
    public int SeatId { get; set; }

    public int RoomId { get; set; }

    public int? SeatNo { get; set; }

    public string? RowName { get; set; }

    public string? SeatType { get; set; }

    public virtual TblCinemaRoom Room { get; set; } = null!;

    public virtual ICollection<TblBookingDetail> TblBookingDetails { get; set; } = new List<TblBookingDetail>();
}
