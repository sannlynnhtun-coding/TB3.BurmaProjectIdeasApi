namespace BurmaCalendar.Api.Dtos
{
    public class BurmaCalendarDto
    {
        public int Id { get; set; }
        public string MonthMm { get; set; } = null!;
        public string MonthEn { get; set; } = null!;
        public string FestivalMm { get; set; } = null!;
        public string FestivalEn { get; set; } = null!;
        public string Description { get; set; } = null!;
        public string Detail { get; set; } = null!;
    }

    public class BurmaCalendarResponseDto
    {
        public bool IsSuccess { get; set; }
        public string Message { get; set; } = string.Empty;
    }

    public class BurmaCalendarListResponseDto
    {
        public bool IsSuccess { get; set; }
        public string Message { get; set; } = string.Empty;
        public List<BurmaCalendarDto> BurmaCalendarList { get; set; } = new();
    }

    public class BurmaCalendarGetByIdResponseDto
    {
        public bool IsSuccess { get; set; }
        public string Message { get; set; } = string.Empty;
        public BurmaCalendarDto? BurmaCalendarDto { get; set; }
    }
}
