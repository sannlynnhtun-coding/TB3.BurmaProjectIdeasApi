using MovieTicketOnlineBookingSystem.Api.Dtos;
using MovieTicketOnlineBookingSystem.Api.Models;

namespace MovieTicketOnlineBookingSystem.Api.Services
{
    public interface IMovieBookingService
    {
        Task<MovieListResponseDto> GetMoviesAsync(MovieListRequestDto request);
        Task<CinemaListResponseDto> GetCinemasAsync(CinemaListRequestDto request);
        Task<ScheduleResponseDto> GetSchedulesAsync(ScheduleRequestDto request);
        Task<SeatResponseDto> GetSeatsForShowAsync(SeatRequestDto request);
        Task<BookingResponseDto> BookTicketsAsync(BookingRequestDto request);
    }

    public class MovieBookingService : IMovieBookingService
    {
        private readonly MovieTicketData _data;

        public MovieBookingService(MovieTicketDataStore dataStore)
        {
            _data = dataStore.Data;
        }

        public Task<MovieListResponseDto> GetMoviesAsync(MovieListRequestDto request)
        {
            var result = Page(_data.Movies, request.PageNo, request.PageSize);
            return Task.FromResult(new MovieListResponseDto
            {
                IsSuccess = true,
                Message = "Movies retrieved successfully",
                Movies = result.Items,
                TotalCount = result.TotalCount,
                PageNo = result.PageNo,
                PageSize = result.PageSize,
                TotalPages = result.TotalPages
            });
        }

        public Task<CinemaListResponseDto> GetCinemasAsync(CinemaListRequestDto request)
        {
            var result = Page(_data.Cinemas, request.PageNo, request.PageSize);
            return Task.FromResult(new CinemaListResponseDto
            {
                IsSuccess = true,
                Message = "Cinemas retrieved successfully",
                Cinemas = result.Items,
                TotalCount = result.TotalCount,
                PageNo = result.PageNo,
                PageSize = result.PageSize,
                TotalPages = result.TotalPages
            });
        }

        public Task<ScheduleResponseDto> GetSchedulesAsync(ScheduleRequestDto request)
        {
            var showDateIds = _data.ShowDates
                .Where(x => x.MovieId == request.MovieId && x.CinemaId == request.CinemaId)
                .Select(x => x.ShowDateId)
                .ToHashSet();

            var query = _data.MovieSchedules.Where(x => showDateIds.Contains(x.ShowDateId));
            if (request.Date != default)
            {
                query = query.Where(x => x.ShowDateTime.Date == request.Date.Date);
            }

            var result = Page(query.OrderBy(x => x.ShowDateTime), request.PageNo, request.PageSize);
            return Task.FromResult(new ScheduleResponseDto
            {
                IsSuccess = true,
                Message = "Schedules retrieved successfully",
                Schedules = result.Items,
                TotalCount = result.TotalCount,
                PageNo = result.PageNo,
                PageSize = result.PageSize,
                TotalPages = result.TotalPages
            });
        }

        public Task<SeatResponseDto> GetSeatsForShowAsync(SeatRequestDto request)
        {
            var schedule = _data.MovieSchedules.FirstOrDefault(x => x.ShowId == request.ShowId);
            if (schedule is null)
            {
                return Task.FromResult(new SeatResponseDto
                {
                    IsSuccess = false,
                    Message = "Show not found",
                    Seats = new List<TblRoomSeat>()
                });
            }

            var showDate = _data.ShowDates.FirstOrDefault(x => x.ShowDateId == schedule.ShowDateId);
            if (showDate is null)
            {
                return Task.FromResult(new SeatResponseDto
                {
                    IsSuccess = false,
                    Message = "Show date not found",
                    Seats = new List<TblRoomSeat>()
                });
            }

            var result = Page(
                _data.RoomSeats
                    .Where(s => s.RoomId == showDate.RoomId)
                    .OrderBy(s => s.RowName)
                    .ThenBy(s => s.SeatNo),
                request.PageNo,
                request.PageSize);

            return Task.FromResult(new SeatResponseDto
            {
                IsSuccess = true,
                Message = "Seats retrieved successfully",
                Seats = result.Items,
                TotalCount = result.TotalCount,
                PageNo = result.PageNo,
                PageSize = result.PageSize,
                TotalPages = result.TotalPages
            });
        }

        public Task<BookingResponseDto> BookTicketsAsync(BookingRequestDto request)
        {
            return Task.FromResult(new BookingResponseDto
            {
                IsSuccess = false,
                Message = "Read-only JSON data source."
            });
        }

        private static PageResult<T> Page<T>(IEnumerable<T> source, int pageNo, int pageSize)
        {
            pageNo = pageNo <= 0 ? 1 : pageNo;
            pageSize = pageSize <= 0 ? 10 : pageSize;
            var items = source.ToList();
            var totalCount = items.Count;
            var totalPages = (int)Math.Ceiling(totalCount / (double)pageSize);

            return new PageResult<T>
            {
                Items = items.Skip((pageNo - 1) * pageSize).Take(pageSize).ToList(),
                TotalCount = totalCount,
                PageNo = pageNo,
                PageSize = pageSize,
                TotalPages = totalPages
            };
        }

        private class PageResult<T>
        {
            public List<T> Items { get; set; } = new();
            public int TotalCount { get; set; }
            public int PageNo { get; set; }
            public int PageSize { get; set; }
            public int TotalPages { get; set; }
        }
    }
}
