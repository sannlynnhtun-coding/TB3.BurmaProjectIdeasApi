namespace MovieTicketOnlineBookingSystem.Api.Dtos
{
    public class BaseResponseDto
    {
        public bool IsSuccess { get; set; }
        public string Message { get; set; } = string.Empty;
    }
}

