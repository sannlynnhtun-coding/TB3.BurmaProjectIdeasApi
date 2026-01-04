using System;
using System.Collections.Generic;

namespace MissingHistoricalRecords.Database.AppDbContextModels;

public partial class TblBook
{
    public int BookId { get; set; }

    public string? BookTitle { get; set; }

    public string? BookAuthor { get; set; }

    public string? BookCover { get; set; }

    public string? BookCategory { get; set; }

    public string? BookDescription { get; set; }

    public DateTime? CreatedDateTime { get; set; }

    public DateTime? ModifiedDateTime { get; set; }

    public bool DeleteFlag { get; set; }
}
