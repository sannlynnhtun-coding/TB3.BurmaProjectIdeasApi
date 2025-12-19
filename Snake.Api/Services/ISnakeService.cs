using Snake.Api.Dtos;

namespace Snake.Api.Services
{
    public interface ISnakeService
    {
        SnakesResponseDto GetSnakes(int pageNo, int pageSize);

        SnakeResponseDto GetSnakeById(int id);

        SnakeResponseDto CreateSnake(SnakeRequestDto requestDto);
        SnakeResponseDto UpdateSnake(int id, SnakeRequestDto requestDto);
    }
}