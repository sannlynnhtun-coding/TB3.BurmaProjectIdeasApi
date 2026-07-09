using BurmaCalendar.Api.Dtos;

namespace BurmaCalendar.Api.Services
{
    public interface IBurmaCalendar
    {
        BurmaCalendarListResponseDto GetCalendarList(int pageNo, int pageSize);
        BurmaCalendarGetByIdResponseDto GetCalendarById(int id);
        BurmaCalendarResponseDto Create();
        BurmaCalendarResponseDto Update(int id);
        BurmaCalendarResponseDto Patch(int id);
        BurmaCalendarResponseDto Delete(int id);
    }
}
