using System;
using System.Collections.Generic;

namespace MovieTicketOnlineBookingSystem.Database.AppDbContextModels;

public partial class TblMovieSchedule
{
    public int ShowId { get; set; }

    public int ShowDateId { get; set; }

    public DateTime ShowDateTime { get; set; }

    public virtual TblShowDate ShowDate { get; set; } = null!;

    public virtual ICollection<TblBooking> TblBookings { get; set; } = new List<TblBooking>();
}
