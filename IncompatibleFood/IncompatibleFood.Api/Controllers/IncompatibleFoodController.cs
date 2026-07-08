using IncompatibleFood.Api.Dtos;
using IncompatibleFood.Api.Services;
using Microsoft.AspNetCore.Mvc;

namespace IncompatibleFood.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class IncompatibleFoodController : ControllerBase
    {
        private readonly IIncompatibleFoodService _incompatibleFoodService;

        public IncompatibleFoodController(IIncompatibleFoodService incompatibleFoodService)
        {
            _incompatibleFoodService = incompatibleFoodService;
        }

        [HttpGet("{pageNo}/{pageSize}")]
        public IActionResult GetIncompatibleFoods(int pageNo, int pageSize)
        {
            var result = _incompatibleFoodService.GetIncompatibleFoods(pageNo, pageSize);
            if (!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }

        [HttpGet("{id}")]
        public IActionResult GetIncompatibleFoodById(int id)
        {
            var result = _incompatibleFoodService.GetIncompatibleFoodById(id);
            if (!result.IsSuccess)
                return NotFound(result);

            return Ok(result);
        }

        [HttpPost]
        public IActionResult CreateIncompatibleFood()
        {
            return ReadOnly();
        }

        [HttpPut("{id}")]
        public IActionResult UpdateIncompatibleFoods(int id)
        {
            return ReadOnly();
        }

        [HttpPatch("{id}")]
        public IActionResult PatchIncompatibleFood(int id)
        {
            return ReadOnly();
        }

        [HttpDelete]
        public IActionResult DeleteIncompatibleFoods()
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
