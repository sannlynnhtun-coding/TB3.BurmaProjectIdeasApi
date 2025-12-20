using BurmeseRecipes.Api.Dtos;

namespace BurmeseRecipes.Api.Services
{
    public interface IBurmeseRecipeService
    {
        RecipesGetResponseDto GetRecipes(int pageNo, int pageSize);
        RecipeGetResponseByIdDto GetRecipeById(int id);
        RecipeResponseDto CreateRecipe(RecipeRequestDto request);
        RecipeResponseDto UpdateRecipe(int id, RecipeRequestDto request);
        RecipeResponseDto PatchRecipe(int id, RecipePatchRequestDto request);
        RecipeResponseDto DeleteRecipe(int id);
    }
}