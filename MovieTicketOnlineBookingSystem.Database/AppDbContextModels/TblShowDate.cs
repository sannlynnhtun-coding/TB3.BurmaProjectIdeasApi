using System;
using System.Collections.Generic;

namespace MovieTicketOnlineBookingSystem.Database.AppDbContextModels;

public partial class TblShowDate
{
    public int ShowDateId { get; set; }

    public int CinemaId { get; set; }

    public int RoomId { get; set; }

    public int MovieId { get; set; }

    public virtual TblCinemaList Cinema { get; set; } = null!;

    public virtual TblMovieList Movie { get; set; } = null!;

    public virtual TblCinemaRoom Room { get; set; } = null!;

    public virtual ICollection<TblMovieSchedule> TblMovieSchedules { get; set; } = new List<TblMovieSchedule>();
}
