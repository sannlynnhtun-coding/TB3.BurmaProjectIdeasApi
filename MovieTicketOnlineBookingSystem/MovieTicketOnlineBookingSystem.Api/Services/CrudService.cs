using MovieTicketOnlineBookingSystem.Api.Dtos;
using MovieTicketOnlineBookingSystem.Api.Models;

namespace MovieTicketOnlineBookingSystem.Api.Services
{
    public class CrudService : ICrudService
    {
        private readonly MovieTicketData _data;

        public CrudService(MovieTicketDataStore dataStore)
        {
            _data = dataStore.Data;
        }

        public Task<MovieListResponseDto> GetAllMoviesAsync(PaginationRequestDto request)
        {
            var response = Page(_data.Movies.OrderBy(m => m.MovieTitle), request, "Movies retrieved successfully");
            return Task.FromResult(new MovieListResponseDto
            {
                IsSuccess = true,
                Message = response.Message,
                Movies = response.Items,
                TotalCount = response.TotalCount,
                PageNo = response.PageNo,
                PageSize = response.PageSize,
                TotalPages = response.TotalPages
            });
        }

        public Task<MovieResponseDto> GetMovieByIdAsync(int id)
        {
            var movie = _data.Movies.FirstOrDefault(x => x.MovieId == id);
            return Task.FromResult(movie is null
                ? new MovieResponseDto { IsSuccess = false, Message = "Movie not found" }
                : new MovieResponseDto { IsSuccess = true, Message = "Movie retrieved successfully", Movie = movie });
        }

        public Task<MovieResponseDto> CreateMovieAsync(CreateMovieDto dto) =>
            Task.FromResult(ReadOnly<MovieResponseDto>());

        public Task<MovieResponseDto> UpdateMovieAsync(int id, UpdateMovieDto dto) =>
            Task.FromResult(ReadOnly<MovieResponseDto>());

        public Task<BaseResponseDto> DeleteMovieAsync(int id) =>
            Task.FromResult(ReadOnly<BaseResponseDto>());

        public Task<CinemaListResponseDto> GetAllCinemasAsync(PaginationRequestDto request)
        {
            var response = Page(_data.Cinemas.OrderBy(c => c.CinemaName), request, "Cinemas retrieved successfully");
            return Task.FromResult(new CinemaListResponseDto
            {
                IsSuccess = true,
                Message = response.Message,
                Cinemas = response.Items,
                TotalCount = response.TotalCount,
                PageNo = response.PageNo,
                PageSize = response.PageSize,
                TotalPages = response.TotalPages
            });
        }

        public Task<CinemaResponseDto> GetCinemaByIdAsync(int id)
        {
            var cinema = _data.Cinemas.FirstOrDefault(x => x.CinemaId == id);
            return Task.FromResult(cinema is null
                ? new CinemaResponseDto { IsSuccess = false, Message = "Cinema not found" }
                : new CinemaResponseDto { IsSuccess = true, Message = "Cinema retrieved successfully", Cinema = cinema });
        }

        public Task<CinemaResponseDto> CreateCinemaAsync(CreateCinemaDto dto) =>
            Task.FromResult(ReadOnly<CinemaResponseDto>());

        public Task<CinemaResponseDto> UpdateCinemaAsync(int id, UpdateCinemaDto dto) =>
            Task.FromResult(ReadOnly<CinemaResponseDto>());

        public Task<BaseResponseDto> DeleteCinemaAsync(int id) =>
            Task.FromResult(ReadOnly<BaseResponseDto>());

        public Task<CinemaRoomListResponseDto> GetAllCinemaRoomsAsync(PaginationRequestDto request)
        {
            var response = Page(_data.CinemaRooms.OrderBy(r => r.CinemaId).ThenBy(r => r.RoomNumber), request, "Cinema rooms retrieved successfully");
            return Task.FromResult(new CinemaRoomListResponseDto
            {
                IsSuccess = true,
                Message = response.Message,
                Rooms = response.Items,
                TotalCount = response.TotalCount,
                PageNo = response.PageNo,
                PageSize = response.PageSize,
                TotalPages = response.TotalPages
            });
        }

        public Task<CinemaRoomListResponseDto> GetCinemaRoomsByCinemaIdAsync(int cinemaId, PaginationRequestDto request)
        {
            var response = Page(
                _data.CinemaRooms.Where(r => r.CinemaId == cinemaId).OrderBy(r => r.RoomNumber),
                request,
                "Cinema rooms retrieved successfully");

            return Task.FromResult(new CinemaRoomListResponseDto
            {
                IsSuccess = true,
                Message = response.Message,
                Rooms = response.Items,
                TotalCount = response.TotalCount,
                PageNo = response.PageNo,
                PageSize = response.PageSize,
                TotalPages = response.TotalPages
            });
        }

        public Task<CinemaRoomResponseDto> GetCinemaRoomByIdAsync(int id)
        {
            var room = _data.CinemaRooms.FirstOrDefault(x => x.RoomId == id);
            return Task.FromResult(room is null
                ? new CinemaRoomResponseDto { IsSuccess = false, Message = "Cinema room not found" }
                : new CinemaRoomResponseDto { IsSuccess = true, Message = "Cinema room retrieved successfully", Room = room });
        }

        public Task<CinemaRoomResponseDto> CreateCinemaRoomAsync(CreateCinemaRoomDto dto) =>
            Task.FromResult(ReadOnly<CinemaRoomResponseDto>());

        public Task<CinemaRoomResponseDto> UpdateCinemaRoomAsync(int id, UpdateCinemaRoomDto dto) =>
            Task.FromResult(ReadOnly<CinemaRoomResponseDto>());

        public Task<BaseResponseDto> DeleteCinemaRoomAsync(int id) =>
            Task.FromResult(ReadOnly<BaseResponseDto>());

        public Task<ShowDateListResponseDto> GetAllShowDatesAsync(PaginationRequestDto request)
        {
            var response = Page(_data.ShowDates.OrderBy(x => x.ShowDateId), request, "Show dates retrieved successfully");
            return Task.FromResult(new ShowDateListResponseDto
            {
                IsSuccess = true,
                Message = response.Message,
                ShowDates = response.Items,
                TotalCount = response.TotalCount,
                PageNo = response.PageNo,
                PageSize = response.PageSize,
                TotalPages = response.TotalPages
            });
        }

        public Task<ShowDateResponseDto> GetShowDateByIdAsync(int id)
        {
            var showDate = _data.ShowDates.FirstOrDefault(x => x.ShowDateId == id);
            return Task.FromResult(showDate is null
                ? new ShowDateResponseDto { IsSuccess = false, Message = "Show date not found" }
                : new ShowDateResponseDto { IsSuccess = true, Message = "Show date retrieved successfully", ShowDate = showDate });
        }

        public Task<ShowDateResponseDto> CreateShowDateAsync(CreateShowDateDto dto) =>
            Task.FromResult(ReadOnly<ShowDateResponseDto>());

        public Task<ShowDateResponseDto> UpdateShowDateAsync(int id, UpdateShowDateDto dto) =>
            Task.FromResult(ReadOnly<ShowDateResponseDto>());

        public Task<BaseResponseDto> DeleteShowDateAsync(int id) =>
            Task.FromResult(ReadOnly<BaseResponseDto>());

        public Task<ScheduleResponseDto> GetAllMovieSchedulesAsync(PaginationRequestDto request)
        {
            var response = Page(_data.MovieSchedules.OrderBy(x => x.ShowDateTime), request, "Movie schedules retrieved successfully");
            return Task.FromResult(new ScheduleResponseDto
            {
                IsSuccess = true,
                Message = response.Message,
                Schedules = response.Items,
                TotalCount = response.TotalCount,
                PageNo = response.PageNo,
                PageSize = response.PageSize,
                TotalPages = response.TotalPages
            });
        }

        public Task<MovieScheduleResponseDto> GetMovieScheduleByIdAsync(int id)
        {
            var schedule = _data.MovieSchedules.FirstOrDefault(x => x.ShowId == id);
            return Task.FromResult(schedule is null
                ? new MovieScheduleResponseDto { IsSuccess = false, Message = "Movie schedule not found" }
                : new MovieScheduleResponseDto { IsSuccess = true, Message = "Movie schedule retrieved successfully", Schedule = schedule });
        }

        public Task<MovieScheduleResponseDto> CreateMovieScheduleAsync(CreateMovieScheduleDto dto) =>
            Task.FromResult(ReadOnly<MovieScheduleResponseDto>());

        public Task<MovieScheduleResponseDto> UpdateMovieScheduleAsync(int id, UpdateMovieScheduleDto dto) =>
            Task.FromResult(ReadOnly<MovieScheduleResponseDto>());

        public Task<BaseResponseDto> DeleteMovieScheduleAsync(int id) =>
            Task.FromResult(ReadOnly<BaseResponseDto>());

        public Task<SeatResponseDto> GetAllRoomSeatsAsync(PaginationRequestDto request)
        {
            var response = Page(_data.RoomSeats.OrderBy(s => s.RoomId).ThenBy(s => s.RowName).ThenBy(s => s.SeatNo), request, "Room seats retrieved successfully");
            return Task.FromResult(new SeatResponseDto
            {
                IsSuccess = true,
                Message = response.Message,
                Seats = response.Items,
                TotalCount = response.TotalCount,
                PageNo = response.PageNo,
                PageSize = response.PageSize,
                TotalPages = response.TotalPages
            });
        }

        public Task<SeatResponseDto> GetRoomSeatsByRoomIdAsync(int roomId, PaginationRequestDto request)
        {
            var response = Page(
                _data.RoomSeats.Where(s => s.RoomId == roomId).OrderBy(s => s.RowName).ThenBy(s => s.SeatNo),
                request,
                "Room seats retrieved successfully");

            return Task.FromResult(new SeatResponseDto
            {
                IsSuccess = true,
                Message = response.Message,
                Seats = response.Items,
                TotalCount = response.TotalCount,
                PageNo = response.PageNo,
                PageSize = response.PageSize,
                TotalPages = response.TotalPages
            });
        }

        public Task<RoomSeatResponseDto> GetRoomSeatByIdAsync(int id)
        {
            var seat = _data.RoomSeats.FirstOrDefault(x => x.SeatId == id);
            return Task.FromResult(seat is null
                ? new RoomSeatResponseDto { IsSuccess = false, Message = "Room seat not found" }
                : new RoomSeatResponseDto { IsSuccess = true, Message = "Room seat retrieved successfully", Seat = seat });
        }

        public Task<RoomSeatResponseDto> CreateRoomSeatAsync(CreateRoomSeatDto dto) =>
            Task.FromResult(ReadOnly<RoomSeatResponseDto>());

        public Task<RoomSeatResponseDto> UpdateRoomSeatAsync(int id, UpdateRoomSeatDto dto) =>
            Task.FromResult(ReadOnly<RoomSeatResponseDto>());

        public Task<BaseResponseDto> DeleteRoomSeatAsync(int id) =>
            Task.FromResult(ReadOnly<BaseResponseDto>());

        public Task<SeatPriceListResponseDto> GetAllSeatPricesAsync(PaginationRequestDto request)
        {
            var response = Page(_data.SeatPrices.OrderBy(sp => sp.RoomId).ThenBy(sp => sp.RowName), request, "Seat prices retrieved successfully");
            return Task.FromResult(new SeatPriceListResponseDto
            {
                IsSuccess = true,
                Message = response.Message,
                SeatPrices = response.Items,
                TotalCount = response.TotalCount,
                PageNo = response.PageNo,
                PageSize = response.PageSize,
                TotalPages = response.TotalPages
            });
        }

        public Task<SeatPriceListResponseDto> GetSeatPricesByRoomIdAsync(int roomId, PaginationRequestDto request)
        {
            var response = Page(
                _data.SeatPrices.Where(sp => sp.RoomId == roomId).OrderBy(sp => sp.RowName),
                request,
                "Seat prices retrieved successfully");

            return Task.FromResult(new SeatPriceListResponseDto
            {
                IsSuccess = true,
                Message = response.Message,
                SeatPrices = response.Items,
                TotalCount = response.TotalCount,
                PageNo = response.PageNo,
                PageSize = response.PageSize,
                TotalPages = response.TotalPages
            });
        }

        public Task<SeatPriceResponseDto> GetSeatPriceByIdAsync(int id)
        {
            var seatPrice = _data.SeatPrices.FirstOrDefault(x => x.SeatPriceId == id);
            return Task.FromResult(seatPrice is null
                ? new SeatPriceResponseDto { IsSuccess = false, Message = "Seat price not found" }
                : new SeatPriceResponseDto { IsSuccess = true, Message = "Seat price retrieved successfully", SeatPrice = seatPrice });
        }

        public Task<SeatPriceResponseDto> CreateSeatPriceAsync(CreateSeatPriceDto dto) =>
            Task.FromResult(ReadOnly<SeatPriceResponseDto>());

        public Task<SeatPriceResponseDto> UpdateSeatPriceAsync(int id, UpdateSeatPriceDto dto) =>
            Task.FromResult(ReadOnly<SeatPriceResponseDto>());

        public Task<BaseResponseDto> DeleteSeatPriceAsync(int id) =>
            Task.FromResult(ReadOnly<BaseResponseDto>());

        public Task<BookingListResponseDto> GetAllBookingsAsync(PaginationRequestDto request)
        {
            var response = Page(_data.Bookings.OrderByDescending(b => b.BookingDate), request, "Bookings retrieved successfully");
            return Task.FromResult(new BookingListResponseDto
            {
                IsSuccess = true,
                Message = response.Message,
                Bookings = response.Items,
                TotalCount = response.TotalCount,
                PageNo = response.PageNo,
                PageSize = response.PageSize,
                TotalPages = response.TotalPages
            });
        }

        public Task<BookingResponseDto> GetBookingByIdAsync(int id)
        {
            var booking = _data.Bookings.FirstOrDefault(x => x.BookingId == id);
            return Task.FromResult(booking is null
                ? new BookingResponseDto { IsSuccess = false, Message = "Booking not found" }
                : new BookingResponseDto
                {
                    IsSuccess = true,
                    Message = "Booking retrieved successfully",
                    BookingId = booking.BookingId,
                    TotalAmount = booking.TotalAmount
                });
        }

        public Task<BookingResponseDto> UpdateBookingAsync(int id, UpdateBookingDto dto) =>
            Task.FromResult(ReadOnly<BookingResponseDto>());

        public Task<BaseResponseDto> DeleteBookingAsync(int id) =>
            Task.FromResult(ReadOnly<BaseResponseDto>());

        private static TResponse ReadOnly<TResponse>()
            where TResponse : BaseResponseDto, new()
        {
            return new TResponse
            {
                IsSuccess = false,
                Message = "Read-only JSON data source."
            };
        }

        private static PageResult<T> Page<T>(IEnumerable<T> source, PaginationRequestDto request, string message)
        {
            var pageNo = request.PageNo <= 0 ? 1 : request.PageNo;
            var pageSize = request.PageSize <= 0 ? 10 : request.PageSize;
            var items = source.ToList();
            var totalCount = items.Count;
            var totalPages = (int)Math.Ceiling(totalCount / (double)pageSize);

            return new PageResult<T>
            {
                Message = message,
                Items = items.Skip((pageNo - 1) * pageSize).Take(pageSize).ToList(),
                TotalCount = totalCount,
                PageNo = pageNo,
                PageSize = pageSize,
                TotalPages = totalPages
            };
        }

        private class PageResult<T>
        {
            public string Message { get; set; } = string.Empty;
            public List<T> Items { get; set; } = new();
            public int TotalCount { get; set; }
            public int PageNo { get; set; }
            public int PageSize { get; set; }
            public int TotalPages { get; set; }
        }
    }
}
