using System.Text.Json;
using BurmeseRecipes.Api.Dtos;

namespace BurmeseRecipes.Api.Services;

public class BurmeseRecipeService : IBurmeseRecipeService
{
    private static readonly JsonSerializerOptions JsonOptions = new()
    {
        PropertyNameCaseInsensitive = true
    };

    private readonly List<RecipesDto> _recipes;

    public BurmeseRecipeService(IWebHostEnvironment env)
    {
        var filePath = Path.Combine(env.ContentRootPath, "Data", "burmese-recipes.json");
        var json = File.ReadAllText(filePath);
        _recipes = JsonSerializer.Deserialize<List<RecipesDto>>(json, JsonOptions) ?? new List<RecipesDto>();
    }

    public RecipesGetResponseDto GetRecipes(int pageNo, int pageSize)
    {
        if (pageNo <= 0)
        {
            return new RecipesGetResponseDto
            {
                IsSuccess = false,
                Message = "Page size must be greater than zero."
            };
        }

        if (pageSize <= 0)
        {
            return new RecipesGetResponseDto
            {
                IsSuccess = false,
                Message = "Page size must be greater than zero."
            };
        }

        var recipes = _recipes
            .OrderBy(x => x.RecipeId)
            .Skip((pageNo - 1) * pageSize)
            .Take(pageSize)
            .ToList();

        return new RecipesGetResponseDto
        {
            IsSuccess = true,
            Message = "Success",
            Recipes = recipes
        };
    }

    public RecipeGetResponseByIdDto GetRecipeById(int id)
    {
        if (id <= 0)
        {
            return new RecipeGetResponseByIdDto
            {
                IsSuccess = false,
                Message = "Id must be greater than 0."
            };
        }

        var item = _recipes.FirstOrDefault(x => x.RecipeId == id);
        if (item is null)
        {
            return new RecipeGetResponseByIdDto
            {
                IsSuccess = false,
                Message = "Not found."
            };
        }

        return new RecipeGetResponseByIdDto
        {
            IsSuccess = true,
            Message = "Success",
            Recipe = item
        };
    }

    public RecipeResponseDto CreateRecipe(RecipeRequestDto request) => ReadOnly();

    public RecipeResponseDto UpdateRecipe(int id, RecipeRequestDto request) => ReadOnly();

    public RecipeResponseDto PatchRecipe(int id, RecipePatchRequestDto request) => ReadOnly();

    public RecipeResponseDto DeleteRecipe(int id) => ReadOnly();

    private static RecipeResponseDto ReadOnly() => new()
    {
        IsSuccess = false,
        Message = "Read-only JSON data source."
    };
}
