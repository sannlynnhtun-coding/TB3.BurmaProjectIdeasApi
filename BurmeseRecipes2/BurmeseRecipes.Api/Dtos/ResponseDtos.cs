namespace BurmeseRecipes.Api.Dtos
{
    public class RecipesGetResponseDto
    {
        public bool IsSuccess { get; set; }
        public string Message { get; set; }
        public List<RecipesDto> Recipes { get; set; }
    }

    public class RecipeResponseDto
    {
        public bool IsSuccess { get; set; }
        public string Message { get; set; }
    }
    public class RecipeGetResponseByIdDto
    {
        public bool IsSuccess { get; set; }
        public string Message { get; set; }
        public RecipesDto Recipe { get; set; }
    }
    public class RecipesDto
    {
        public int RecipeId { get; set; }

        public string Name { get; set; } = null!;

        public string Ingredients { get; set; } = null!;

        public string CookingInstructions { get; set; } = null!;

        public string UserType { get; set; } = null!;
    }
}
