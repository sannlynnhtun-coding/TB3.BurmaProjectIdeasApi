using static Snake.Api.Enums.Enum;

namespace Snake.Api.Dtos
{
    public class SnakesResponseDto
    {
        public EnumResultType Type { get; set; }
        public string Message { get; set; }
        public List<SnakeDto>? Snakes { get; set; }
    }

    public class SnakeResponseDto
    {
        public EnumResultType Type { get; set; }
        public string Message { get; set; }
        public SnakeDto? Snake { get; set; }
    }
}
