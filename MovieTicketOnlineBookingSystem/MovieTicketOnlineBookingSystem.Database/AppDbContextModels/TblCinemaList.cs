using System;
using System.Collections.Generic;

namespace MovieTicketOnlineBookingSystem.Database.AppDbContextModels;

public partial class TblCinemaList
{
    public int CinemaId { get; set; }

    public string CinemaName { get; set; } = null!;

    public string? CinemaLocation { get; set; }

    public virtual ICollection<TblCinemaRoom> TblCinemaRooms { get; set; } = new List<TblCinemaRoom>();

    public virtual ICollection<TblShowDate> TblShowDates { get; set; } = new List<TblShowDate>();
}
