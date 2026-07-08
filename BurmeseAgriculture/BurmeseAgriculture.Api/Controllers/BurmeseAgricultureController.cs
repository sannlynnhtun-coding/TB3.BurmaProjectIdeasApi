using BurmeseAgriculture.Api.Dtos;
using BurmeseAgriculture.Api.Services;
using Microsoft.AspNetCore.Mvc;

namespace BurmeseAgriculture.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BurmeseAgricultureController : ControllerBase
    {
        private readonly IBurmeseAgricultureService _burmeseAgricultureService;

        public BurmeseAgricultureController(IBurmeseAgricultureService burmeseAgricultureService)
        {
            _burmeseAgricultureService = burmeseAgricultureService;
        }

        [HttpGet("{pageNo}/{pageSize}")]
        public IActionResult GetAgricultures(int pageNo = 1, int pageSize = 10)
        {
            var result = _burmeseAgricultureService.GetList(pageNo, pageSize);
            if (!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }

        [HttpGet("{id}")]
        public IActionResult GetAgricultureById(int id)
        {
            var result = _burmeseAgricultureService.GetById(id);
            if (!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }

        [HttpPost]
        public IActionResult CreateAgriculture()
        {
            return ReadOnly();
        }

        [HttpPut("{id}")]
        public IActionResult UpdateAgriculture(int id)
        {
            return ReadOnly();
        }

        [HttpPatch("{id}")]
        public IActionResult PatchAgriculture(int id)
        {
            return ReadOnly();
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteAgriculture(int id)
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
