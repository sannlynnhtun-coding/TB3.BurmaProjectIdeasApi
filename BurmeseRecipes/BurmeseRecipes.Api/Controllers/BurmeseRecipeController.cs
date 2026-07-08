using BurmeseRecipes.Api.Dtos;
using BurmeseRecipes.Api.Services;
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

        [HttpPost]
        public IActionResult CreateRecipe()
        {
            return ReadOnly();
        }

        [HttpPut("{id}")]
        public IActionResult UpdateRecipe(int id)
        {
            return ReadOnly();
        }

        [HttpPatch("{id}")]
        public IActionResult PatchRecipe(int id)
        {
            return ReadOnly();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteRecipe(int id)
        {
            return ReadOnly();
        }

        private ObjectResult ReadOnly()
        {
            return StatusCode(StatusCodes.Status405MethodNotAllowed, new
            {
                IsSuccess = false,
                Message = "Read-only JSON data source."
            });
        }
    }
}
