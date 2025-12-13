using Microsoft.EntityFrameworkCore;
using MovieTicketOnlineBookingSystem.Database.AppDbContextModels;
using MovieTicketOnlineBookingSystem.Api.Dtos;

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
        private readonly AppDbContext _context;

        public MovieBookingService(AppDbContext context)
        {
            _context = context;
        }

        public async Task<MovieListResponseDto> GetMoviesAsync(MovieListRequestDto request)
        {
            try
            {
                var query = _context.TblMovieLists.AsQueryable();
                var totalCount = await query.CountAsync();

                var movies = await query
                    .Skip((request.PageNo - 1) * request.PageSize)
                    .Take(request.PageSize)
                    .ToListAsync();

                var totalPages = (int)Math.Ceiling(totalCount / (double)request.PageSize);

                return new MovieListResponseDto
                {
                    IsSuccess = true,
                    Message = "Movies retrieved successfully",
                    Movies = movies,
                    TotalCount = totalCount,
                    PageNo = request.PageNo,
                    PageSize = request.PageSize,
                    TotalPages = totalPages
                };
            }
            catch (Exception ex)
            {
                return new MovieListResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error retrieving movies: {ex.Message}",
                    Movies = new List<TblMovieList>()
                };
            }
        }

        public async Task<CinemaListResponseDto> GetCinemasAsync(CinemaListRequestDto request)
        {
            try
            {
                var query = _context.TblCinemaLists.AsQueryable();
                var totalCount = await query.CountAsync();

                var cinemas = await query
                    .Skip((request.PageNo - 1) * request.PageSize)
                    .Take(request.PageSize)
                    .ToListAsync();

                var totalPages = (int)Math.Ceiling(totalCount / (double)request.PageSize);

                return new CinemaListResponseDto
                {
                    IsSuccess = true,
                    Message = "Cinemas retrieved successfully",
                    Cinemas = cinemas,
                    TotalCount = totalCount,
                    PageNo = request.PageNo,
                    PageSize = request.PageSize,
                    TotalPages = totalPages
                };
            }
            catch (Exception ex)
            {
                return new CinemaListResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error retrieving cinemas: {ex.Message}",
                    Cinemas = new List<TblCinemaList>()
                };
            }
        }

        public async Task<ScheduleResponseDto> GetSchedulesAsync(ScheduleRequestDto request)
        {
            try
            {
                var query = _context.TblMovieSchedules
                    .Include(s => s.ShowDate)
                    .Where(s => s.ShowDate.MovieId == request.MovieId 
                             && s.ShowDate.CinemaId == request.CinemaId
                             && s.ShowDateTime.Date == request.Date.Date)
                    .AsQueryable();

                var totalCount = await query.CountAsync();

                var schedules = await query
                    .Skip((request.PageNo - 1) * request.PageSize)
                    .Take(request.PageSize)
                    .ToListAsync();

                var totalPages = (int)Math.Ceiling(totalCount / (double)request.PageSize);

                return new ScheduleResponseDto
                {
                    IsSuccess = true,
                    Message = "Schedules retrieved successfully",
                    Schedules = schedules,
                    TotalCount = totalCount,
                    PageNo = request.PageNo,
                    PageSize = request.PageSize,
                    TotalPages = totalPages
                };
            }
            catch (Exception ex)
            {
                return new ScheduleResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error retrieving schedules: {ex.Message}",
                    Schedules = new List<TblMovieSchedule>()
                };
            }
        }

        public async Task<SeatResponseDto> GetSeatsForShowAsync(SeatRequestDto request)
        {
            try
            {
                // 1. Get the RoomId for the Show
                var schedule = await _context.TblMovieSchedules
                    .Include(s => s.ShowDate)
                    .FirstOrDefaultAsync(s => s.ShowId == request.ShowId);

                if (schedule == null)
                {
                    return new SeatResponseDto
                    {
                        IsSuccess = false,
                        Message = "Show not found",
                        Seats = new List<TblRoomSeat>()
                    };
                }

                // 2. Get all seats in that room with pagination
                var query = _context.TblRoomSeats
                    .Where(s => s.RoomId == schedule.ShowDate.RoomId)
                    .AsQueryable();

                var totalCount = await query.CountAsync();

                var seats = await query
                    .Skip((request.PageNo - 1) * request.PageSize)
                    .Take(request.PageSize)
                    .ToListAsync();

                var totalPages = (int)Math.Ceiling(totalCount / (double)request.PageSize);

                // Note: In a real app, you would also check TblBookingDetail to mark taken seats.
                return new SeatResponseDto
                {
                    IsSuccess = true,
                    Message = "Seats retrieved successfully",
                    Seats = seats,
                    TotalCount = totalCount,
                    PageNo = request.PageNo,
                    PageSize = request.PageSize,
                    TotalPages = totalPages
                };
            }
            catch (Exception ex)
            {
                return new SeatResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error retrieving seats: {ex.Message}",
                    Seats = new List<TblRoomSeat>()
                };
            }
        }

        public async Task<BookingResponseDto> BookTicketsAsync(BookingRequestDto request)
        {
            using var transaction = await _context.Database.BeginTransactionAsync();
            try
            {
                var booking = new TblBooking
                {
                    ShowId = request.ShowId,
                    CustomerName = request.CustomerName,
                    BookingDate = DateTime.Now,
                    TotalAmount = 0 
                };

                _context.TblBookings.Add(booking);
                await _context.SaveChangesAsync();

                decimal total = 0;

                foreach (var seatId in request.SeatIds)
                {
                    // Fetch price for the seat's row
                    var seat = await _context.TblRoomSeats.FindAsync(seatId);
                    if (seat == null)
                    {
                        await transaction.RollbackAsync();
                        return new BookingResponseDto
                        {
                            IsSuccess = false,
                            Message = $"Seat with ID {seatId} not found"
                        };
                    }

                    var priceObj = await _context.TblSeatPrices
                        .FirstOrDefaultAsync(p => p.RoomId == seat.RoomId && p.RowName == seat.RowName);
                    
                    decimal price = priceObj?.SeatPrice ?? 0;
                    total += price;

                    _context.TblBookingDetails.Add(new TblBookingDetail
                    {
                        BookingId = booking.BookingId,
                        SeatId = seatId,
                        Price = price
                    });
                }

                booking.TotalAmount = total;
                await _context.SaveChangesAsync();
                await transaction.CommitAsync();

                return new BookingResponseDto
                {
                    IsSuccess = true,
                    Message = "Booking successful",
                    BookingId = booking.BookingId,
                    TotalAmount = booking.TotalAmount
                };
            }
            catch (Exception ex)
            {
                await transaction.RollbackAsync();
                return new BookingResponseDto
                {
                    IsSuccess = false,
                    Message = $"Booking failed: {ex.Message}"
                };
            }
        }
    }
}
