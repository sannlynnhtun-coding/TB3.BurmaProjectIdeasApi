using MovieTicketOnlineBookingSystem.Api.Dtos;
using MovieTicketOnlineBookingSystem.Database.AppDbContextModels;

namespace MovieTicketOnlineBookingSystem.Api.Services
{
    public interface ICrudService
    {
        // Movie CRUD
        Task<MovieListResponseDto> GetAllMoviesAsync(PaginationRequestDto request);
        Task<MovieResponseDto> GetMovieByIdAsync(int id);
        Task<MovieResponseDto> CreateMovieAsync(CreateMovieDto dto);
        Task<MovieResponseDto> UpdateMovieAsync(int id, UpdateMovieDto dto);
        Task<BaseResponseDto> DeleteMovieAsync(int id);

        // Cinema CRUD
        Task<CinemaListResponseDto> GetAllCinemasAsync(PaginationRequestDto request);
        Task<CinemaResponseDto> GetCinemaByIdAsync(int id);
        Task<CinemaResponseDto> CreateCinemaAsync(CreateCinemaDto dto);
        Task<CinemaResponseDto> UpdateCinemaAsync(int id, UpdateCinemaDto dto);
        Task<BaseResponseDto> DeleteCinemaAsync(int id);

        // Cinema Room CRUD
        Task<CinemaRoomListResponseDto> GetAllCinemaRoomsAsync(PaginationRequestDto request);
        Task<CinemaRoomListResponseDto> GetCinemaRoomsByCinemaIdAsync(int cinemaId, PaginationRequestDto request);
        Task<CinemaRoomResponseDto> GetCinemaRoomByIdAsync(int id);
        Task<CinemaRoomResponseDto> CreateCinemaRoomAsync(CreateCinemaRoomDto dto);
        Task<CinemaRoomResponseDto> UpdateCinemaRoomAsync(int id, UpdateCinemaRoomDto dto);
        Task<BaseResponseDto> DeleteCinemaRoomAsync(int id);

        // Show Date CRUD
        Task<ShowDateListResponseDto> GetAllShowDatesAsync(PaginationRequestDto request);
        Task<ShowDateResponseDto> GetShowDateByIdAsync(int id);
        Task<ShowDateResponseDto> CreateShowDateAsync(CreateShowDateDto dto);
        Task<ShowDateResponseDto> UpdateShowDateAsync(int id, UpdateShowDateDto dto);
        Task<BaseResponseDto> DeleteShowDateAsync(int id);

        // Movie Schedule CRUD
        Task<ScheduleResponseDto> GetAllMovieSchedulesAsync(PaginationRequestDto request);
        Task<MovieScheduleResponseDto> GetMovieScheduleByIdAsync(int id);
        Task<MovieScheduleResponseDto> CreateMovieScheduleAsync(CreateMovieScheduleDto dto);
        Task<MovieScheduleResponseDto> UpdateMovieScheduleAsync(int id, UpdateMovieScheduleDto dto);
        Task<BaseResponseDto> DeleteMovieScheduleAsync(int id);

        // Room Seat CRUD
        Task<SeatResponseDto> GetAllRoomSeatsAsync(PaginationRequestDto request);
        Task<SeatResponseDto> GetRoomSeatsByRoomIdAsync(int roomId, PaginationRequestDto request);
        Task<RoomSeatResponseDto> GetRoomSeatByIdAsync(int id);
        Task<RoomSeatResponseDto> CreateRoomSeatAsync(CreateRoomSeatDto dto);
        Task<RoomSeatResponseDto> UpdateRoomSeatAsync(int id, UpdateRoomSeatDto dto);
        Task<BaseResponseDto> DeleteRoomSeatAsync(int id);

        // Seat Price CRUD
        Task<SeatPriceListResponseDto> GetAllSeatPricesAsync(PaginationRequestDto request);
        Task<SeatPriceListResponseDto> GetSeatPricesByRoomIdAsync(int roomId, PaginationRequestDto request);
        Task<SeatPriceResponseDto> GetSeatPriceByIdAsync(int id);
        Task<SeatPriceResponseDto> CreateSeatPriceAsync(CreateSeatPriceDto dto);
        Task<SeatPriceResponseDto> UpdateSeatPriceAsync(int id, UpdateSeatPriceDto dto);
        Task<BaseResponseDto> DeleteSeatPriceAsync(int id);

        // Booking CRUD
        Task<BookingListResponseDto> GetAllBookingsAsync(PaginationRequestDto request);
        Task<BookingResponseDto> GetBookingByIdAsync(int id);
        Task<BookingResponseDto> UpdateBookingAsync(int id, UpdateBookingDto dto);
        Task<BaseResponseDto> DeleteBookingAsync(int id);
    }
}

