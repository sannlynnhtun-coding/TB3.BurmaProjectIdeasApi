namespace BurmeseRecipes.Api.Dtos
{
    public class RecipeRequestDto
    {
        public string Name { get; set; } = null!;

        public string Ingredients { get; set; } = null!;

        public string CookingInstructions { get; set; } = null!;

        public string UserType { get; set; } = null!;
    }
    public class RecipePatchRequestDto
    {
        public string? Name { get; set; }

        public string? Ingredients { get; set; } 

        public string? CookingInstructions { get; set; }

        public string? UserType { get; set; } 
    }
    

}
