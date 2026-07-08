using Microsoft.AspNetCore.Mvc;
using Snake.Api.Dtos;
using Snake.Api.Services;
using static Snake.Api.Enums.Enum;

namespace Snake.Api.Controllers;

[Route("api/[controller]")]
[ApiController]
public class SnakeController : ControllerBase
{
    private readonly ISnakeService _snakeService;

    public SnakeController(ISnakeService snakeService)
    {
        _snakeService = snakeService;
    }

    [HttpGet("{pageNo}/{pageSize}")]
    public IActionResult GetSnakes(int pageNo, int pageSize)
    {
        SnakesResponseDto result = _snakeService.GetSnakes(pageNo, pageSize);
        if (result.Type == EnumResultType.Success)
        {
            return Ok(result.Snakes);
        }

        return BadRequest(result.Message);
    }

    [HttpGet("{id}")]
    public IActionResult GetSnakeById(int id)
    {
        SnakeResponseDto result = _snakeService.GetSnakeById(id);
        if (result.Type == EnumResultType.Success)
        {
            return Ok(result.Snake);
        }

        return NotFound(result.Message);
    }

    [HttpPost]
    public IActionResult CreateSnake(SnakeRequestDto requestDto)
    {
        return ReadOnly();
    }

    [HttpPatch("{id}")]
    public IActionResult UpdateSnake(int id, SnakeRequestDto requestDto)
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
