using PickAPile.Api.Dtos;
using PickAPile.Api.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace PickAPile.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PickAPileController : ControllerBase
    {
        private readonly IPickAPileService _pickAPileService;

        public PickAPileController(IPickAPileService pickAPileService)
        {
            _pickAPileService = pickAPileService;
        }

        [HttpGet("questions")]
        public IActionResult GetQuestions()
        {
            var result = _pickAPileService.GetQuestions();
            if (!result.IsSuccess)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }

        [HttpGet("questions/{id}")]
        public IActionResult GetQuestionById(int id)
        {
            var result = _pickAPileService.GetQuestionById(id);
            if (!result.IsSuccess)
            {
                return NotFound(result);
            }
            return Ok(result);
        }

        [HttpGet("answers/{questionId}")]
        public IActionResult GetAnswersByQuestionId(int questionId)
        {
            var result = _pickAPileService.GetAnswersByQuestionId(questionId);
            if (!result.IsSuccess)
            {
                return BadRequest(result);
            }
            return Ok(result);
        }

        [HttpGet("answers/{questionId}/{answerId}")]
        public IActionResult GetAnswer(int questionId, int answerId)
        {
            var result = _pickAPileService.GetAnswer(questionId, answerId);
            if (!result.IsSuccess)
            {
                return NotFound(result);
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

