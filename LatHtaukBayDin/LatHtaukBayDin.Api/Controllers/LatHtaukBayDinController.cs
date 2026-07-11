using LatHtaukBayDin.Api.Dtos;
using LatHtaukBayDin.Api.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace LatHtaukBayDin.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LatHtaukBayDinController : ControllerBase
    {
        private readonly ILatHtaukBayDinService _bayDinService;

        public LatHtaukBayDinController(ILatHtaukBayDinService bayDinService)
        {
            _bayDinService = bayDinService;
        }

        [HttpGet("questions")]
        public IActionResult GetQuestions()
        {
            var result = _bayDinService.GetQuestions();
            if (!result.IsSuccess)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }

        [HttpGet("questions/{questionNo}")]
        public IActionResult GetQuestionByNo(int questionNo)
        {
            var result = _bayDinService.GetQuestionByNo(questionNo);
            if (!result.IsSuccess)
            {
                return NotFound(result);
            }
            return Ok(result);
        }

        [HttpGet("numberList")]
        public IActionResult GetNumberList()
        {
            var result = _bayDinService.GetNumberList();
            if (!result.IsSuccess)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }

        [HttpGet("answer")]
        public IActionResult GetFortune([FromQuery] int questionNo, [FromQuery] int answerNo)
        {
            var result = _bayDinService.GetAnswer(questionNo, answerNo);
            if (!result.IsSuccess)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }

        [HttpGet("answer/by-index")]
        public IActionResult GetFortuneByIndex([FromQuery] int questionNo, [FromQuery] int gridIndex)
        {
            var result = _bayDinService.GetAnswerByIndex(questionNo, gridIndex);
            if (!result.IsSuccess)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }

        [HttpPost]
        public IActionResult Create()
        {
            return ReadOnly();
        }

        [HttpPut("{id}")]
        public IActionResult Update(string id)
        {
            return ReadOnly();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(string id)
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

