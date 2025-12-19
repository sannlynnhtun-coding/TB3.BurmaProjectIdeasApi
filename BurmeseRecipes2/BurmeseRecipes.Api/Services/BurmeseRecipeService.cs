using BurmeseRecipes.Api.Dtos;
using BurmeseRecipes.Database.BurmeseRecipeDbContextModels;

namespace BurmeseRecipes.Api.Services;

public class BurmeseRecipeService : IBurmeseRecipeService
{
    private readonly BurmeseRecipeDbContext _db;

    public BurmeseRecipeService(BurmeseRecipeDbContext db)
    {
        _db = db;
    }

    public RecipesGetResponseDto GetRecipes(int pageNo, int pageSize)
    {
        RecipesGetResponseDto dto = new RecipesGetResponseDto();
        if (pageNo == 0)
        {
            dto = new RecipesGetResponseDto()
            {
                IsSuccess = false,
                Message = "Page size must be greater than zero."
            };
            return dto;
        }
        if (pageSize == 0)
        {
            dto = new RecipesGetResponseDto()
            {
                IsSuccess = false,
                Message = "Page size must be greater than zero."
            };
            return dto;
        }
        var lst = _db.TblBurmeseRecipes
            .Where(x => x.DeleteFlag == false)
            .Skip((pageNo - 1) * pageSize)
            .Take(pageSize)
            .ToList();
        var recipes = lst.Select(item => new RecipesDto()
        {
            RecipeId = item.RecipeId,
            Name = item.Name,
            Ingredients = item.Ingredients,
            CookingInstructions = item.CookingInstructions,
            UserType = item.UserType
        }).ToList();
        dto = new RecipesGetResponseDto()
        {
            IsSuccess = true,
            Message = "Success",
            Recipes = recipes
        };
        return dto;
    }
    public RecipeGetResponseByIdDto GetRecipeById(int id)
    {
        RecipeGetResponseByIdDto dto = new RecipeGetResponseByIdDto();
        var item = _db.TblBurmeseRecipes
            .Where(x => x.DeleteFlag == false)
            .FirstOrDefault(x => x.RecipeId == id);
        if (item is null)
        {
            dto = new RecipeGetResponseByIdDto()
            {
                IsSuccess = false,
                Message = "Not found."
            };
            return dto;
        }
        if (id <= 0)
        {
            dto = new RecipeGetResponseByIdDto()
            {
                IsSuccess = false,
                Message = "Id must be greater than 0."
            };
            return dto;
        }
        var response = new RecipesDto()
        {
            RecipeId = item.RecipeId,
            Name = item.Name,
            Ingredients = item.Ingredients,
            CookingInstructions = item.CookingInstructions,
            UserType = item.UserType
        };
        dto = new RecipeGetResponseByIdDto()
        {
            IsSuccess = true,
            Message = "Success",
            Recipe = response
        };
        return dto;
    }

    public RecipeResponseDto CreateRecipe(RecipeRequestDto request)
    {
        RecipeResponseDto dto = new RecipeResponseDto();
        if (string.IsNullOrEmpty(request.Name) || string.IsNullOrEmpty(request.Ingredients) || string.IsNullOrEmpty(request.CookingInstructions))
        {
            dto = new RecipeResponseDto
            {
                IsSuccess = false,
                Message = "Please fill all the values."
            };
            return dto;
        }
        _db.TblBurmeseRecipes.Add(new TblBurmeseRecipe
        {
            CreatedDateTime = DateTime.Now,
            DeleteFlag = false,
            Name = request.Name,
            Ingredients = request.Ingredients,
            CookingInstructions= request.CookingInstructions,
            UserType = request.UserType
        });
        _db.SaveChanges();
        dto = new RecipeResponseDto()
        {
            IsSuccess = true,
            Message = "Success"
        };
        return dto;
    }

    public RecipeResponseDto UpdateRecipe(int id, RecipeRequestDto request)
    {
        RecipeResponseDto dto = new RecipeResponseDto();
        var item = _db.TblBurmeseRecipes
            .Where(x => x.DeleteFlag == false)
            .FirstOrDefault(x => x.RecipeId == id);
        if (string.IsNullOrEmpty(request.Name) || string.IsNullOrEmpty(request.Ingredients) || string.IsNullOrEmpty(request.CookingInstructions) || string.IsNullOrEmpty(request.UserType))
        {
            dto = new RecipeResponseDto
            {
                IsSuccess = false,
                Message = "Please fill all the values to update."
            };
            return dto;
        }
        item.Name = request.Name;
        item.Ingredients = request.Ingredients;
        item.CookingInstructions = request.CookingInstructions;
        item.UserType = request.UserType;
        item.ModifiedDateTime = DateTime.Now;
        _db.SaveChanges();
        dto = new RecipeResponseDto()
        {
            IsSuccess = true,
            Message = "Success"
        };
        return dto;
    }

    public RecipeResponseDto PatchRecipe(int id, RecipePatchRequestDto request)
    {
        RecipeResponseDto dto = new RecipeResponseDto();
        var item = _db.TblBurmeseRecipes
            .Where(x => x.DeleteFlag == false)
            .FirstOrDefault(x => x.RecipeId == id);
        
        if (string.IsNullOrEmpty(request.Name) && string.IsNullOrEmpty(request.Ingredients) && string.IsNullOrEmpty(request.CookingInstructions) && string.IsNullOrEmpty(request.UserType))
        {
            dto = new RecipeResponseDto
            {
                IsSuccess = false,
                Message = "You need to put at least one value to update."
            };
            return dto;
        }
        if(!string.IsNullOrEmpty(request.Name))
            item.Name = request.Name;
        if (!string.IsNullOrEmpty(request.Ingredients))
            item.Ingredients = request.Ingredients;
        if (!string.IsNullOrEmpty(request.CookingInstructions))
            item.CookingInstructions = request.CookingInstructions;
        if (!string.IsNullOrEmpty(request.UserType))
            item.UserType = request.UserType;
        item.ModifiedDateTime = DateTime.Now;
        _db.SaveChanges();
        dto = new RecipeResponseDto
        {
            IsSuccess = true,
            Message = "Success"
        };
        return dto;
    }
    public RecipeResponseDto DeleteRecipe(int id)
    {
        RecipeResponseDto dto = new RecipeResponseDto();
        var item = _db.TblBurmeseRecipes
            .Where(x => x.DeleteFlag == false)
            .FirstOrDefault(x => x.RecipeId == id);
        if (item is null)
        {
            dto = new RecipeResponseDto()
            {
                IsSuccess = false,
                Message = "Not found."
            };
            return dto;
        }
        if (id <= 0)
        {
            dto = new RecipeResponseDto()
            {
                IsSuccess = false,
                Message = "Id must be greater than 0."
            };
            return dto;
        }
        item.DeleteFlag = true;
        _db.SaveChanges();
        dto = new RecipeResponseDto()
        {
            IsSuccess = true,
            Message = "Success"
        };
        return dto;
    }

}


