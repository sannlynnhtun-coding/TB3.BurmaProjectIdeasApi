using System;
using System.Collections.Generic;

namespace MissingHistoricalRecords.Database.AppDbContextModels;

public partial class TblContent
{
    public int BookId { get; set; }

    public int PageNo { get; set; }

    public string? BookContent { get; set; }

    public bool DeleteFlag { get; set; }
}
