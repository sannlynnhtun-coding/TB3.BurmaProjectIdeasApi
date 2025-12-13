using System;
using System.Collections.Generic;

namespace MovieTicketOnlineBookingSystem.Database.AppDbContextModels;

public partial class TblMovieList
{
    public int MovieId { get; set; }

    public string MovieTitle { get; set; } = null!;

    public DateTime? ReleaseDate { get; set; }

    public string? Duration { get; set; }

    public string? MoviePhoto { get; set; }

    public virtual ICollection<TblShowDate> TblShowDates { get; set; } = new List<TblShowDate>();
}
