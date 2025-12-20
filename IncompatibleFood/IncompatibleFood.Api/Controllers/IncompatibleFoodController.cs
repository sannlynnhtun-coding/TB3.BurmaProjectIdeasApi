using Azure.Core;
using IncompatibleFood.Api.Dtos;
using IncompatibleFood.Api.Services;
using IncompatibleFood.Database.IncompatibleFoodDbContextModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace IncompatibleFood.Api.Controllers
{
    // https://localhost:7197/api/IncompatibleFood
    [Route("api/[controller]")]
    [ApiController]
    public class IncompatibleFoodController : ControllerBase
    {
        // private readonly IncompatibleFoodDbContext _context;
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
        public IActionResult CreateIncompatibleFood(IncompatibleFoodCreateRequestDto request)
        {
            var result = _incompatibleFoodService.CreateIncompatibleFood(request);
            if (!result.IsSuccess)
                return BadRequest(result);
            return Ok(result);
        }

        [HttpPut("{id}")]
        public IActionResult UpdateIncompatibleFoods(int id, IncompatibleFoodUpdateRequestDto request)
        {
            var result = _incompatibleFoodService.UpdateIncompatibleFood(id, request);
            if (!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }

        [HttpPatch("{id}")]
        public IActionResult PatchIncompatibleFood(int id, IncompatibleFoodPatchRequestDto request)
        {
            IncompatibleFoodResponseDto result = _incompatibleFoodService.PatchIncompatibleFood(id, request);

            if (!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }

        [HttpDelete]
        public IActionResult DeleteIncompatibleFoods()
        {
            return Ok("Delete Incompatible Foods");
        }
    }
}
