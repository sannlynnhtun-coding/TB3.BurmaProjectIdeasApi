using System;
using System.Collections.Generic;

namespace BurmeseRecipes.Database.BurmeseRecipeDbContextModels;

public partial class TblBurmeseRecipe
{
    public int RecipeId { get; set; }

    public string Name { get; set; } = null!;

    public string Ingredients { get; set; } = null!;

    public string CookingInstructions { get; set; } = null!;

    public string UserType { get; set; } = null!;

    public bool DeleteFlag { get; set; }

    public DateTime CreatedDateTime { get; set; }

    public DateTime? ModifiedDateTime { get; set; }
}
