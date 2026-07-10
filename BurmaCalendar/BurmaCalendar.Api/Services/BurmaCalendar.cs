using System.Text.Json;
using BurmaCalendar.Api.Dtos;

namespace BurmaCalendar.Api.Services
{
    public class BurmaCalendar : IBurmaCalendar
    {
        private static readonly JsonSerializerOptions JsonOptions = new()
        {
            PropertyNameCaseInsensitive = true
        };

        private readonly List<BurmaCalendarDto> _calendars;

        public BurmaCalendar(IWebHostEnvironment env)
        {
            var filePath = Path.Combine(env.ContentRootPath, "Data", "burma-calendar.json");
            var json = File.ReadAllText(filePath);
            _calendars = JsonSerializer.Deserialize<List<BurmaCalendarDto>>(json, JsonOptions)
                ?? new List<BurmaCalendarDto>();
        }

        public BurmaCalendarListResponseDto GetCalendarList(int pageNo, int pageSize)
        {
            if (pageNo <= 0)
            {
                return new BurmaCalendarListResponseDto
                {
                    IsSuccess = false,
                    Message = "Page number must be greater than zero."
                };
            }

            if (pageSize <= 0)
            {
                return new BurmaCalendarListResponseDto
                {
                    IsSuccess = false,
                    Message = "Page size must be greater than zero."
                };
            }

            var items = _calendars
                .OrderBy(x => x.Id)
                .Skip((pageNo - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            return new BurmaCalendarListResponseDto
            {
                IsSuccess = true,
                Message = "Data retrieved successfully.",
                BurmaCalendarList = items
            };
        }

        public BurmaCalendarGetByIdResponseDto GetCalendarById(int id)
        {
            var item = _calendars.FirstOrDefault(x => x.Id == id);
            if (item is null)
            {
                return new BurmaCalendarGetByIdResponseDto
                {
                    IsSuccess = false,
                    Message = "No data found.",
                    BurmaCalendarDto = null
                };
            }

            return new BurmaCalendarGetByIdResponseDto
            {
                IsSuccess = true,
                Message = "Data is retrieved successfully.",
                BurmaCalendarDto = item
            };
        }

        public BurmaCalendarResponseDto Create() => ReadOnly();

        public BurmaCalendarResponseDto Update(int id) => ReadOnly();

        public BurmaCalendarResponseDto Patch(int id) => ReadOnly();

        public BurmaCalendarResponseDto Delete(int id) => ReadOnly();

        private static BurmaCalendarResponseDto ReadOnly() => new()
        {
            IsSuccess = false,
            Message = "Read-only JSON data source."
        };
    }
}
