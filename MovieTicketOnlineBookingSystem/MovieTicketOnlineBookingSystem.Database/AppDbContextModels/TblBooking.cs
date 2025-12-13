using System;
using System.Collections.Generic;

namespace MovieTicketOnlineBookingSystem.Database.AppDbContextModels;

public partial class TblBooking
{
    public int BookingId { get; set; }

    public int ShowId { get; set; }

    public DateTime? BookingDate { get; set; }

    public string? CustomerName { get; set; }

    public decimal? TotalAmount { get; set; }

    public virtual TblMovieSchedule Show { get; set; } = null!;

    public virtual ICollection<TblBookingDetail> TblBookingDetails { get; set; } = new List<TblBookingDetail>();
}
