using System;
using System.Collections.Generic;

namespace Bird.Database.BirdDbContextModels;

public partial class TblBird
{
    public int Id { get; set; }

    public string BirdMyanmarName { get; set; } = null!;

    public string BirdEnglishName { get; set; } = null!;

    public string Description { get; set; } = null!;

    public string ImagePath { get; set; } = null!;
}
