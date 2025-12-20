using System;
using System.Collections.Generic;

namespace BurmeseRecipes.Database.BurmeseRecipeDbContextModels;

public partial class TblUserType
{
    public int UserId { get; set; }

    public string UserCode { get; set; } = null!;

    public string UserMmtype { get; set; } = null!;

    public string UserEngType { get; set; } = null!;
}
