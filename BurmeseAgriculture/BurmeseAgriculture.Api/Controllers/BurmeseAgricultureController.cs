using BurmeseAgriculture.Api.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace BurmeseAgriculture.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BurmeseAgricultureController : ControllerBase
    {
        private readonly IBurmeseAgricultureService _IburmeseAgricultureService;

        public BurmeseAgricultureController(IBurmeseAgricultureService IburmeseAgricultureService)
        {
            _IburmeseAgricultureService = IburmeseAgricultureService;
        }

        [HttpGet("{pageNo}/{pageSize}")]
        public IActionResult GetAgricultures(int pageNo = 1, int pageSize = 10)
        {
            var result = _IburmeseAgricultureService.GetList(pageNo, pageSize);
            if (!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }

        [HttpGet("{id}")]
        public IActionResult GetAgricultureById(int id)
        {
            var result = _IburmeseAgricultureService.GetById(id);
            if(!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }


        [HttpPost]
        public IActionResult CreateAgriculture(AgricultureCreateRequestDto request)
        {
            var result = _IburmeseAgricultureService.Create(request);
            if (!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }

        [HttpPut("{id}")]
        public IActionResult UpdateAgriculture(int id, AgricultureUpdateRequestDto request)
        {
            var result = _IburmeseAgricultureService.Update(id, request);
            if (!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }

        [HttpPatch("{id}")]
        public IActionResult UpdateAgriculture(int id, AgriculturePatchRequestDto request)
        {
            AgricultureResponseDto result = _IburmeseAgricultureService.Patch(id, request);

            if (!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }

        [HttpDelete("{id}")]
        public IActionResult DeleteAgriculture(int id)
        {
            AgricultureResponseDto result = _IburmeseAgricultureService.Delete(id);
            if (!result.IsSuccess)
                return BadRequest(result);

            return Ok(result);
        }
    }
}
