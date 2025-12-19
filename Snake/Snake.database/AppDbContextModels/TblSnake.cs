using System;
using System.Collections.Generic;

namespace Snake.Database.AppDbContextModels;

public partial class TblSnake
{
    public int Id { get; set; }

    public string? Mmname { get; set; }

    public string? EngName { get; set; }

    public string Details { get; set; } = null!;

    public string? IsPoison { get; set; }

    public string? IsDanger { get; set; }
}
