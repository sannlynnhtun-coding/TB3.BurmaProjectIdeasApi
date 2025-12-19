using Microsoft.AspNetCore.Http;
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
        if(result.Type == EnumResultType.Success)
        {
            return Ok(result.Snake);
        }
        return NotFound(result.Message);
    }

    [HttpPost]
    public IActionResult CreateSnake(SnakeRequestDto requestDto)
    {
        SnakeResponseDto result = _snakeService.CreateSnake(requestDto);
        if (result.Type == EnumResultType.Success)
        {
            return Ok(result.Snake);
        }
        if (result.Type == EnumResultType.ValidationError)
        {
            return BadRequest(result.Message);
        }
     
        return StatusCode(500, result.Message);      
    }

    [HttpPatch("{id}")]
    public IActionResult UpdateSnake(int id, SnakeRequestDto requestDto)
    {
        SnakeResponseDto result = _snakeService.UpdateSnake(id, requestDto);
        if (result.Type == EnumResultType.NotFound)
        {
            return NotFound(result.Message);
        }
        if (result.Type == EnumResultType.Success)
        {
            return Ok(result.Snake);
        }
        if (result.Type == EnumResultType.ValidationError)
        {
            return BadRequest(result.Message);
        }

        return StatusCode(500, result.Message);
    }
}
