using Azure.Core;
using BurmeseRecipes.Api.Dtos;
using BurmeseRecipes.Api.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace BurmeseRecipes.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BurmeseRecipeController : ControllerBase
    {
        private readonly IBurmeseRecipeService _burmeseRecipeService;

        public BurmeseRecipeController(IBurmeseRecipeService burmeseRecipeService)
        {
            _burmeseRecipeService = burmeseRecipeService;
        }

        [HttpGet("{pageNo}/{pageSize}")]
        public IActionResult GetRecipes(int pageNo, int pageSize)
        {
            var result = _burmeseRecipeService.GetRecipes(pageNo, pageSize);
            if (!result.IsSuccess)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }
        [HttpGet("{id}")]
        public IActionResult GetRecipeById(int id)
        {
            var result = _burmeseRecipeService.GetRecipeById(id);
            if (!result.IsSuccess)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }
        [HttpPost()]
        public IActionResult CreateRecipe(RecipeRequestDto request)
        {
            var result = _burmeseRecipeService.CreateRecipe(request);
            if (!result.IsSuccess)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }
        [HttpPut("{id}")]
        public IActionResult UpdateRecipe(int id, RecipeRequestDto request)
        {
            var result = _burmeseRecipeService.UpdateRecipe(id,request);
            if (!result.IsSuccess)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }
        [HttpPatch("{id}")]
        public IActionResult PatchRecipe(int id, RecipePatchRequestDto request)
        {
            var result = _burmeseRecipeService.PatchRecipe(id, request);
            if (!result.IsSuccess)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }
        [HttpDelete("{id}")]
        public IActionResult DeleteRecipe(int id)
        {
            var result = _burmeseRecipeService.DeleteRecipe(id);
            if (!result.IsSuccess)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }
    }
}
