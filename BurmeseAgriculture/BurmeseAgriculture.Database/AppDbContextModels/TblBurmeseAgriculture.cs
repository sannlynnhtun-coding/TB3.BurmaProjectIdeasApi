using System;
using System.Collections.Generic;

namespace BurmeseAgriculture.Database.AppDbContextModels;

public partial class TblBurmeseAgriculture
{
    public int Id { get; set; }

    public string Title { get; set; } = null!;

    public DateTime Date { get; set; }

    public string Author { get; set; } = null!;

    public string Content { get; set; } = null!;

    public bool? DeleteFlag { get; set; }
}
