using Microsoft.EntityFrameworkCore;
using MovieTicketOnlineBookingSystem.Database.AppDbContextModels;
using MovieTicketOnlineBookingSystem.Api.Dtos;

namespace MovieTicketOnlineBookingSystem.Api.Services
{
    public class CrudService : ICrudService
    {
        private readonly AppDbContext _context;

        public CrudService(AppDbContext context)
        {
            _context = context;
        }

        #region Movie CRUD
        public async Task<MovieListResponseDto> GetAllMoviesAsync(PaginationRequestDto request)
        {
            try
            {
                var query = _context.TblMovieLists.AsQueryable();
                var totalCount = await query.CountAsync();

                var movies = await query
                    .OrderBy(m => m.MovieTitle)
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

        public async Task<MovieResponseDto> GetMovieByIdAsync(int id)
        {
            try
            {
                var movie = await _context.TblMovieLists.FindAsync(id);
                if (movie == null)
                {
                    return new MovieResponseDto
                    {
                        IsSuccess = false,
                        Message = "Movie not found"
                    };
                }

                return new MovieResponseDto
                {
                    IsSuccess = true,
                    Message = "Movie retrieved successfully",
                    Movie = movie
                };
            }
            catch (Exception ex)
            {
                return new MovieResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error retrieving movie: {ex.Message}"
                };
            }
        }

        public async Task<MovieResponseDto> CreateMovieAsync(CreateMovieDto dto)
        {
            try
            {
                var movie = new TblMovieList
                {
                    MovieTitle = dto.MovieTitle,
                    ReleaseDate = dto.ReleaseDate,
                    Duration = dto.Duration,
                    MoviePhoto = dto.MoviePhoto
                };

                _context.TblMovieLists.Add(movie);
                await _context.SaveChangesAsync();

                return new MovieResponseDto
                {
                    IsSuccess = true,
                    Message = "Movie created successfully",
                    Movie = movie
                };
            }
            catch (Exception ex)
            {
                return new MovieResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error creating movie: {ex.Message}"
                };
            }
        }

        public async Task<MovieResponseDto> UpdateMovieAsync(int id, UpdateMovieDto dto)
        {
            try
            {
                var movie = await _context.TblMovieLists.FindAsync(id);
                if (movie == null)
                {
                    return new MovieResponseDto
                    {
                        IsSuccess = false,
                        Message = "Movie not found"
                    };
                }

                if (!string.IsNullOrEmpty(dto.MovieTitle))
                    movie.MovieTitle = dto.MovieTitle;
                if (dto.ReleaseDate.HasValue)
                    movie.ReleaseDate = dto.ReleaseDate;
                if (dto.Duration != null)
                    movie.Duration = dto.Duration;
                if (dto.MoviePhoto != null)
                    movie.MoviePhoto = dto.MoviePhoto;

                await _context.SaveChangesAsync();

                return new MovieResponseDto
                {
                    IsSuccess = true,
                    Message = "Movie updated successfully",
                    Movie = movie
                };
            }
            catch (Exception ex)
            {
                return new MovieResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error updating movie: {ex.Message}"
                };
            }
        }

        public async Task<BaseResponseDto> DeleteMovieAsync(int id)
        {
            try
            {
                var movie = await _context.TblMovieLists.FindAsync(id);
                if (movie == null)
                {
                    return new BaseResponseDto
                    {
                        IsSuccess = false,
                        Message = "Movie not found"
                    };
                }

                _context.TblMovieLists.Remove(movie);
                await _context.SaveChangesAsync();

                return new BaseResponseDto
                {
                    IsSuccess = true,
                    Message = "Movie deleted successfully"
                };
            }
            catch (Exception ex)
            {
                return new BaseResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error deleting movie: {ex.Message}"
                };
            }
        }
        #endregion

        #region Cinema CRUD
        public async Task<CinemaListResponseDto> GetAllCinemasAsync(PaginationRequestDto request)
        {
            try
            {
                var query = _context.TblCinemaLists.AsQueryable();
                var totalCount = await query.CountAsync();

                var cinemas = await query
                    .OrderBy(c => c.CinemaName)
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

        public async Task<CinemaResponseDto> GetCinemaByIdAsync(int id)
        {
            try
            {
                var cinema = await _context.TblCinemaLists.FindAsync(id);
                if (cinema == null)
                {
                    return new CinemaResponseDto
                    {
                        IsSuccess = false,
                        Message = "Cinema not found"
                    };
                }

                return new CinemaResponseDto
                {
                    IsSuccess = true,
                    Message = "Cinema retrieved successfully",
                    Cinema = cinema
                };
            }
            catch (Exception ex)
            {
                return new CinemaResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error retrieving cinema: {ex.Message}"
                };
            }
        }

        public async Task<CinemaResponseDto> CreateCinemaAsync(CreateCinemaDto dto)
        {
            try
            {
                var cinema = new TblCinemaList
                {
                    CinemaName = dto.CinemaName,
                    CinemaLocation = dto.CinemaLocation
                };

                _context.TblCinemaLists.Add(cinema);
                await _context.SaveChangesAsync();

                return new CinemaResponseDto
                {
                    IsSuccess = true,
                    Message = "Cinema created successfully",
                    Cinema = cinema
                };
            }
            catch (Exception ex)
            {
                return new CinemaResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error creating cinema: {ex.Message}"
                };
            }
        }

        public async Task<CinemaResponseDto> UpdateCinemaAsync(int id, UpdateCinemaDto dto)
        {
            try
            {
                var cinema = await _context.TblCinemaLists.FindAsync(id);
                if (cinema == null)
                {
                    return new CinemaResponseDto
                    {
                        IsSuccess = false,
                        Message = "Cinema not found"
                    };
                }

                if (!string.IsNullOrEmpty(dto.CinemaName))
                    cinema.CinemaName = dto.CinemaName;
                if (dto.CinemaLocation != null)
                    cinema.CinemaLocation = dto.CinemaLocation;

                await _context.SaveChangesAsync();

                return new CinemaResponseDto
                {
                    IsSuccess = true,
                    Message = "Cinema updated successfully",
                    Cinema = cinema
                };
            }
            catch (Exception ex)
            {
                return new CinemaResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error updating cinema: {ex.Message}"
                };
            }
        }

        public async Task<BaseResponseDto> DeleteCinemaAsync(int id)
        {
            try
            {
                var cinema = await _context.TblCinemaLists.FindAsync(id);
                if (cinema == null)
                {
                    return new BaseResponseDto
                    {
                        IsSuccess = false,
                        Message = "Cinema not found"
                    };
                }

                _context.TblCinemaLists.Remove(cinema);
                await _context.SaveChangesAsync();

                return new BaseResponseDto
                {
                    IsSuccess = true,
                    Message = "Cinema deleted successfully"
                };
            }
            catch (Exception ex)
            {
                return new BaseResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error deleting cinema: {ex.Message}"
                };
            }
        }
        #endregion

        #region Cinema Room CRUD
        public async Task<CinemaRoomListResponseDto> GetAllCinemaRoomsAsync(PaginationRequestDto request)
        {
            try
            {
                var query = _context.TblCinemaRooms
                    .Include(r => r.Cinema)
                    .AsQueryable();
                var totalCount = await query.CountAsync();

                var rooms = await query
                    .OrderBy(r => r.CinemaId)
                    .ThenBy(r => r.RoomNumber)
                    .Skip((request.PageNo - 1) * request.PageSize)
                    .Take(request.PageSize)
                    .ToListAsync();

                var totalPages = (int)Math.Ceiling(totalCount / (double)request.PageSize);

                return new CinemaRoomListResponseDto
                {
                    IsSuccess = true,
                    Message = "Cinema rooms retrieved successfully",
                    Rooms = rooms,
                    TotalCount = totalCount,
                    PageNo = request.PageNo,
                    PageSize = request.PageSize,
                    TotalPages = totalPages
                };
            }
            catch (Exception ex)
            {
                return new CinemaRoomListResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error retrieving cinema rooms: {ex.Message}",
                    Rooms = new List<TblCinemaRoom>()
                };
            }
        }

        public async Task<CinemaRoomListResponseDto> GetCinemaRoomsByCinemaIdAsync(int cinemaId, PaginationRequestDto request)
        {
            try
            {
                var query = _context.TblCinemaRooms
                    .Include(r => r.Cinema)
                    .Where(r => r.CinemaId == cinemaId)
                    .AsQueryable();
                var totalCount = await query.CountAsync();

                var rooms = await query
                    .OrderBy(r => r.RoomNumber)
                    .Skip((request.PageNo - 1) * request.PageSize)
                    .Take(request.PageSize)
                    .ToListAsync();

                var totalPages = (int)Math.Ceiling(totalCount / (double)request.PageSize);

                return new CinemaRoomListResponseDto
                {
                    IsSuccess = true,
                    Message = "Cinema rooms retrieved successfully",
                    Rooms = rooms,
                    TotalCount = totalCount,
                    PageNo = request.PageNo,
                    PageSize = request.PageSize,
                    TotalPages = totalPages
                };
            }
            catch (Exception ex)
            {
                return new CinemaRoomListResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error retrieving cinema rooms: {ex.Message}",
                    Rooms = new List<TblCinemaRoom>()
                };
            }
        }

        public async Task<CinemaRoomResponseDto> GetCinemaRoomByIdAsync(int id)
        {
            try
            {
                var room = await _context.TblCinemaRooms
                    .Include(r => r.Cinema)
                    .FirstOrDefaultAsync(r => r.RoomId == id);
                if (room == null)
                {
                    return new CinemaRoomResponseDto
                    {
                        IsSuccess = false,
                        Message = "Cinema room not found"
                    };
                }

                return new CinemaRoomResponseDto
                {
                    IsSuccess = true,
                    Message = "Cinema room retrieved successfully",
                    Room = room
                };
            }
            catch (Exception ex)
            {
                return new CinemaRoomResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error retrieving cinema room: {ex.Message}"
                };
            }
        }

        public async Task<CinemaRoomResponseDto> CreateCinemaRoomAsync(CreateCinemaRoomDto dto)
        {
            try
            {
                var room = new TblCinemaRoom
                {
                    CinemaId = dto.CinemaId,
                    RoomNumber = dto.RoomNumber,
                    RoomName = dto.RoomName,
                    SeatingCapacity = dto.SeatingCapacity
                };

                _context.TblCinemaRooms.Add(room);
                await _context.SaveChangesAsync();

                return new CinemaRoomResponseDto
                {
                    IsSuccess = true,
                    Message = "Cinema room created successfully",
                    Room = room
                };
            }
            catch (Exception ex)
            {
                return new CinemaRoomResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error creating cinema room: {ex.Message}"
                };
            }
        }

        public async Task<CinemaRoomResponseDto> UpdateCinemaRoomAsync(int id, UpdateCinemaRoomDto dto)
        {
            try
            {
                var room = await _context.TblCinemaRooms.FindAsync(id);
                if (room == null)
                {
                    return new CinemaRoomResponseDto
                    {
                        IsSuccess = false,
                        Message = "Cinema room not found"
                    };
                }

                if (dto.CinemaId.HasValue)
                    room.CinemaId = dto.CinemaId.Value;
                if (dto.RoomNumber.HasValue)
                    room.RoomNumber = dto.RoomNumber;
                if (dto.RoomName != null)
                    room.RoomName = dto.RoomName;
                if (dto.SeatingCapacity.HasValue)
                    room.SeatingCapacity = dto.SeatingCapacity;

                await _context.SaveChangesAsync();

                return new CinemaRoomResponseDto
                {
                    IsSuccess = true,
                    Message = "Cinema room updated successfully",
                    Room = room
                };
            }
            catch (Exception ex)
            {
                return new CinemaRoomResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error updating cinema room: {ex.Message}"
                };
            }
        }

        public async Task<BaseResponseDto> DeleteCinemaRoomAsync(int id)
        {
            try
            {
                var room = await _context.TblCinemaRooms.FindAsync(id);
                if (room == null)
                {
                    return new BaseResponseDto
                    {
                        IsSuccess = false,
                        Message = "Cinema room not found"
                    };
                }

                _context.TblCinemaRooms.Remove(room);
                await _context.SaveChangesAsync();

                return new BaseResponseDto
                {
                    IsSuccess = true,
                    Message = "Cinema room deleted successfully"
                };
            }
            catch (Exception ex)
            {
                return new BaseResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error deleting cinema room: {ex.Message}"
                };
            }
        }
        #endregion

        #region Show Date CRUD
        public async Task<ShowDateListResponseDto> GetAllShowDatesAsync(PaginationRequestDto request)
        {
            try
            {
                var query = _context.TblShowDates
                    .Include(sd => sd.Cinema)
                    .Include(sd => sd.Movie)
                    .Include(sd => sd.Room)
                    .AsQueryable();
                var totalCount = await query.CountAsync();

                var showDates = await query
                    .OrderBy(sd => sd.ShowDateId)
                    .Skip((request.PageNo - 1) * request.PageSize)
                    .Take(request.PageSize)
                    .ToListAsync();

                var totalPages = (int)Math.Ceiling(totalCount / (double)request.PageSize);

                return new ShowDateListResponseDto
                {
                    IsSuccess = true,
                    Message = "Show dates retrieved successfully",
                    ShowDates = showDates,
                    TotalCount = totalCount,
                    PageNo = request.PageNo,
                    PageSize = request.PageSize,
                    TotalPages = totalPages
                };
            }
            catch (Exception ex)
            {
                return new ShowDateListResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error retrieving show dates: {ex.Message}",
                    ShowDates = new List<TblShowDate>()
                };
            }
        }

        public async Task<ShowDateResponseDto> GetShowDateByIdAsync(int id)
        {
            try
            {
                var showDate = await _context.TblShowDates
                    .Include(sd => sd.Cinema)
                    .Include(sd => sd.Movie)
                    .Include(sd => sd.Room)
                    .FirstOrDefaultAsync(sd => sd.ShowDateId == id);
                if (showDate == null)
                {
                    return new ShowDateResponseDto
                    {
                        IsSuccess = false,
                        Message = "Show date not found"
                    };
                }

                return new ShowDateResponseDto
                {
                    IsSuccess = true,
                    Message = "Show date retrieved successfully",
                    ShowDate = showDate
                };
            }
            catch (Exception ex)
            {
                return new ShowDateResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error retrieving show date: {ex.Message}"
                };
            }
        }

        public async Task<ShowDateResponseDto> CreateShowDateAsync(CreateShowDateDto dto)
        {
            try
            {
                var showDate = new TblShowDate
                {
                    CinemaId = dto.CinemaId,
                    RoomId = dto.RoomId,
                    MovieId = dto.MovieId
                };

                _context.TblShowDates.Add(showDate);
                await _context.SaveChangesAsync();

                return new ShowDateResponseDto
                {
                    IsSuccess = true,
                    Message = "Show date created successfully",
                    ShowDate = showDate
                };
            }
            catch (Exception ex)
            {
                return new ShowDateResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error creating show date: {ex.Message}"
                };
            }
        }

        public async Task<ShowDateResponseDto> UpdateShowDateAsync(int id, UpdateShowDateDto dto)
        {
            try
            {
                var showDate = await _context.TblShowDates.FindAsync(id);
                if (showDate == null)
                {
                    return new ShowDateResponseDto
                    {
                        IsSuccess = false,
                        Message = "Show date not found"
                    };
                }

                if (dto.CinemaId.HasValue)
                    showDate.CinemaId = dto.CinemaId.Value;
                if (dto.RoomId.HasValue)
                    showDate.RoomId = dto.RoomId.Value;
                if (dto.MovieId.HasValue)
                    showDate.MovieId = dto.MovieId.Value;

                await _context.SaveChangesAsync();

                return new ShowDateResponseDto
                {
                    IsSuccess = true,
                    Message = "Show date updated successfully",
                    ShowDate = showDate
                };
            }
            catch (Exception ex)
            {
                return new ShowDateResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error updating show date: {ex.Message}"
                };
            }
        }

        public async Task<BaseResponseDto> DeleteShowDateAsync(int id)
        {
            try
            {
                var showDate = await _context.TblShowDates.FindAsync(id);
                if (showDate == null)
                {
                    return new BaseResponseDto
                    {
                        IsSuccess = false,
                        Message = "Show date not found"
                    };
                }

                _context.TblShowDates.Remove(showDate);
                await _context.SaveChangesAsync();

                return new BaseResponseDto
                {
                    IsSuccess = true,
                    Message = "Show date deleted successfully"
                };
            }
            catch (Exception ex)
            {
                return new BaseResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error deleting show date: {ex.Message}"
                };
            }
        }
        #endregion

        #region Movie Schedule CRUD
        public async Task<ScheduleResponseDto> GetAllMovieSchedulesAsync(PaginationRequestDto request)
        {
            try
            {
                var query = _context.TblMovieSchedules
                    .Include(s => s.ShowDate)
                        .ThenInclude(sd => sd.Movie)
                    .Include(s => s.ShowDate)
                        .ThenInclude(sd => sd.Cinema)
                    .AsQueryable();
                var totalCount = await query.CountAsync();

                var schedules = await query
                    .OrderBy(s => s.ShowDateTime)
                    .Skip((request.PageNo - 1) * request.PageSize)
                    .Take(request.PageSize)
                    .ToListAsync();

                var totalPages = (int)Math.Ceiling(totalCount / (double)request.PageSize);

                return new ScheduleResponseDto
                {
                    IsSuccess = true,
                    Message = "Movie schedules retrieved successfully",
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
                    Message = $"Error retrieving movie schedules: {ex.Message}",
                    Schedules = new List<TblMovieSchedule>()
                };
            }
        }

        public async Task<MovieScheduleResponseDto> GetMovieScheduleByIdAsync(int id)
        {
            try
            {
                var schedule = await _context.TblMovieSchedules
                    .Include(s => s.ShowDate)
                        .ThenInclude(sd => sd.Movie)
                    .Include(s => s.ShowDate)
                        .ThenInclude(sd => sd.Cinema)
                    .FirstOrDefaultAsync(s => s.ShowId == id);
                if (schedule == null)
                {
                    return new MovieScheduleResponseDto
                    {
                        IsSuccess = false,
                        Message = "Movie schedule not found"
                    };
                }

                return new MovieScheduleResponseDto
                {
                    IsSuccess = true,
                    Message = "Movie schedule retrieved successfully",
                    Schedule = schedule
                };
            }
            catch (Exception ex)
            {
                return new MovieScheduleResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error retrieving movie schedule: {ex.Message}"
                };
            }
        }

        public async Task<MovieScheduleResponseDto> CreateMovieScheduleAsync(CreateMovieScheduleDto dto)
        {
            try
            {
                var schedule = new TblMovieSchedule
                {
                    ShowDateId = dto.ShowDateId,
                    ShowDateTime = dto.ShowDateTime
                };

                _context.TblMovieSchedules.Add(schedule);
                await _context.SaveChangesAsync();

                return new MovieScheduleResponseDto
                {
                    IsSuccess = true,
                    Message = "Movie schedule created successfully",
                    Schedule = schedule
                };
            }
            catch (Exception ex)
            {
                return new MovieScheduleResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error creating movie schedule: {ex.Message}"
                };
            }
        }

        public async Task<MovieScheduleResponseDto> UpdateMovieScheduleAsync(int id, UpdateMovieScheduleDto dto)
        {
            try
            {
                var schedule = await _context.TblMovieSchedules.FindAsync(id);
                if (schedule == null)
                {
                    return new MovieScheduleResponseDto
                    {
                        IsSuccess = false,
                        Message = "Movie schedule not found"
                    };
                }

                if (dto.ShowDateId.HasValue)
                    schedule.ShowDateId = dto.ShowDateId.Value;
                if (dto.ShowDateTime.HasValue)
                    schedule.ShowDateTime = dto.ShowDateTime.Value;

                await _context.SaveChangesAsync();

                return new MovieScheduleResponseDto
                {
                    IsSuccess = true,
                    Message = "Movie schedule updated successfully",
                    Schedule = schedule
                };
            }
            catch (Exception ex)
            {
                return new MovieScheduleResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error updating movie schedule: {ex.Message}"
                };
            }
        }

        public async Task<BaseResponseDto> DeleteMovieScheduleAsync(int id)
        {
            try
            {
                var schedule = await _context.TblMovieSchedules.FindAsync(id);
                if (schedule == null)
                {
                    return new BaseResponseDto
                    {
                        IsSuccess = false,
                        Message = "Movie schedule not found"
                    };
                }

                _context.TblMovieSchedules.Remove(schedule);
                await _context.SaveChangesAsync();

                return new BaseResponseDto
                {
                    IsSuccess = true,
                    Message = "Movie schedule deleted successfully"
                };
            }
            catch (Exception ex)
            {
                return new BaseResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error deleting movie schedule: {ex.Message}"
                };
            }
        }
        #endregion

        #region Room Seat CRUD
        public async Task<SeatResponseDto> GetAllRoomSeatsAsync(PaginationRequestDto request)
        {
            try
            {
                var query = _context.TblRoomSeats
                    .Include(s => s.Room)
                    .AsQueryable();
                var totalCount = await query.CountAsync();

                var seats = await query
                    .OrderBy(s => s.RoomId)
                    .ThenBy(s => s.RowName)
                    .ThenBy(s => s.SeatNo)
                    .Skip((request.PageNo - 1) * request.PageSize)
                    .Take(request.PageSize)
                    .ToListAsync();

                var totalPages = (int)Math.Ceiling(totalCount / (double)request.PageSize);

                return new SeatResponseDto
                {
                    IsSuccess = true,
                    Message = "Room seats retrieved successfully",
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
                    Message = $"Error retrieving room seats: {ex.Message}",
                    Seats = new List<TblRoomSeat>()
                };
            }
        }

        public async Task<SeatResponseDto> GetRoomSeatsByRoomIdAsync(int roomId, PaginationRequestDto request)
        {
            try
            {
                var query = _context.TblRoomSeats
                    .Include(s => s.Room)
                    .Where(s => s.RoomId == roomId)
                    .AsQueryable();
                var totalCount = await query.CountAsync();

                var seats = await query
                    .OrderBy(s => s.RowName)
                    .ThenBy(s => s.SeatNo)
                    .Skip((request.PageNo - 1) * request.PageSize)
                    .Take(request.PageSize)
                    .ToListAsync();

                var totalPages = (int)Math.Ceiling(totalCount / (double)request.PageSize);

                return new SeatResponseDto
                {
                    IsSuccess = true,
                    Message = "Room seats retrieved successfully",
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
                    Message = $"Error retrieving room seats: {ex.Message}",
                    Seats = new List<TblRoomSeat>()
                };
            }
        }

        public async Task<RoomSeatResponseDto> GetRoomSeatByIdAsync(int id)
        {
            try
            {
                var seat = await _context.TblRoomSeats
                    .Include(s => s.Room)
                    .FirstOrDefaultAsync(s => s.SeatId == id);
                if (seat == null)
                {
                    return new RoomSeatResponseDto
                    {
                        IsSuccess = false,
                        Message = "Room seat not found"
                    };
                }

                return new RoomSeatResponseDto
                {
                    IsSuccess = true,
                    Message = "Room seat retrieved successfully",
                    Seat = seat
                };
            }
            catch (Exception ex)
            {
                return new RoomSeatResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error retrieving room seat: {ex.Message}"
                };
            }
        }

        public async Task<RoomSeatResponseDto> CreateRoomSeatAsync(CreateRoomSeatDto dto)
        {
            try
            {
                var seat = new TblRoomSeat
                {
                    RoomId = dto.RoomId,
                    SeatNo = dto.SeatNo,
                    RowName = dto.RowName,
                    SeatType = dto.SeatType
                };

                _context.TblRoomSeats.Add(seat);
                await _context.SaveChangesAsync();

                return new RoomSeatResponseDto
                {
                    IsSuccess = true,
                    Message = "Room seat created successfully",
                    Seat = seat
                };
            }
            catch (Exception ex)
            {
                return new RoomSeatResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error creating room seat: {ex.Message}"
                };
            }
        }

        public async Task<RoomSeatResponseDto> UpdateRoomSeatAsync(int id, UpdateRoomSeatDto dto)
        {
            try
            {
                var seat = await _context.TblRoomSeats.FindAsync(id);
                if (seat == null)
                {
                    return new RoomSeatResponseDto
                    {
                        IsSuccess = false,
                        Message = "Room seat not found"
                    };
                }

                if (dto.RoomId.HasValue)
                    seat.RoomId = dto.RoomId.Value;
                if (dto.SeatNo.HasValue)
                    seat.SeatNo = dto.SeatNo;
                if (dto.RowName != null)
                    seat.RowName = dto.RowName;
                if (dto.SeatType != null)
                    seat.SeatType = dto.SeatType;

                await _context.SaveChangesAsync();

                return new RoomSeatResponseDto
                {
                    IsSuccess = true,
                    Message = "Room seat updated successfully",
                    Seat = seat
                };
            }
            catch (Exception ex)
            {
                return new RoomSeatResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error updating room seat: {ex.Message}"
                };
            }
        }

        public async Task<BaseResponseDto> DeleteRoomSeatAsync(int id)
        {
            try
            {
                var seat = await _context.TblRoomSeats.FindAsync(id);
                if (seat == null)
                {
                    return new BaseResponseDto
                    {
                        IsSuccess = false,
                        Message = "Room seat not found"
                    };
                }

                _context.TblRoomSeats.Remove(seat);
                await _context.SaveChangesAsync();

                return new BaseResponseDto
                {
                    IsSuccess = true,
                    Message = "Room seat deleted successfully"
                };
            }
            catch (Exception ex)
            {
                return new BaseResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error deleting room seat: {ex.Message}"
                };
            }
        }
        #endregion

        #region Seat Price CRUD
        public async Task<SeatPriceListResponseDto> GetAllSeatPricesAsync(PaginationRequestDto request)
        {
            try
            {
                var query = _context.TblSeatPrices
                    .Include(sp => sp.Room)
                    .AsQueryable();
                var totalCount = await query.CountAsync();

                var seatPrices = await query
                    .OrderBy(sp => sp.RoomId)
                    .ThenBy(sp => sp.RowName)
                    .Skip((request.PageNo - 1) * request.PageSize)
                    .Take(request.PageSize)
                    .ToListAsync();

                var totalPages = (int)Math.Ceiling(totalCount / (double)request.PageSize);

                return new SeatPriceListResponseDto
                {
                    IsSuccess = true,
                    Message = "Seat prices retrieved successfully",
                    SeatPrices = seatPrices,
                    TotalCount = totalCount,
                    PageNo = request.PageNo,
                    PageSize = request.PageSize,
                    TotalPages = totalPages
                };
            }
            catch (Exception ex)
            {
                return new SeatPriceListResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error retrieving seat prices: {ex.Message}",
                    SeatPrices = new List<TblSeatPrice>()
                };
            }
        }

        public async Task<SeatPriceListResponseDto> GetSeatPricesByRoomIdAsync(int roomId, PaginationRequestDto request)
        {
            try
            {
                var query = _context.TblSeatPrices
                    .Include(sp => sp.Room)
                    .Where(sp => sp.RoomId == roomId)
                    .AsQueryable();
                var totalCount = await query.CountAsync();

                var seatPrices = await query
                    .OrderBy(sp => sp.RowName)
                    .Skip((request.PageNo - 1) * request.PageSize)
                    .Take(request.PageSize)
                    .ToListAsync();

                var totalPages = (int)Math.Ceiling(totalCount / (double)request.PageSize);

                return new SeatPriceListResponseDto
                {
                    IsSuccess = true,
                    Message = "Seat prices retrieved successfully",
                    SeatPrices = seatPrices,
                    TotalCount = totalCount,
                    PageNo = request.PageNo,
                    PageSize = request.PageSize,
                    TotalPages = totalPages
                };
            }
            catch (Exception ex)
            {
                return new SeatPriceListResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error retrieving seat prices: {ex.Message}",
                    SeatPrices = new List<TblSeatPrice>()
                };
            }
        }

        public async Task<SeatPriceResponseDto> GetSeatPriceByIdAsync(int id)
        {
            try
            {
                var seatPrice = await _context.TblSeatPrices
                    .Include(sp => sp.Room)
                    .FirstOrDefaultAsync(sp => sp.SeatPriceId == id);
                if (seatPrice == null)
                {
                    return new SeatPriceResponseDto
                    {
                        IsSuccess = false,
                        Message = "Seat price not found"
                    };
                }

                return new SeatPriceResponseDto
                {
                    IsSuccess = true,
                    Message = "Seat price retrieved successfully",
                    SeatPrice = seatPrice
                };
            }
            catch (Exception ex)
            {
                return new SeatPriceResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error retrieving seat price: {ex.Message}"
                };
            }
        }

        public async Task<SeatPriceResponseDto> CreateSeatPriceAsync(CreateSeatPriceDto dto)
        {
            try
            {
                var seatPrice = new TblSeatPrice
                {
                    RoomId = dto.RoomId,
                    RowName = dto.RowName,
                    SeatPrice = dto.SeatPrice
                };

                _context.TblSeatPrices.Add(seatPrice);
                await _context.SaveChangesAsync();

                return new SeatPriceResponseDto
                {
                    IsSuccess = true,
                    Message = "Seat price created successfully",
                    SeatPrice = seatPrice
                };
            }
            catch (Exception ex)
            {
                return new SeatPriceResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error creating seat price: {ex.Message}"
                };
            }
        }

        public async Task<SeatPriceResponseDto> UpdateSeatPriceAsync(int id, UpdateSeatPriceDto dto)
        {
            try
            {
                var seatPrice = await _context.TblSeatPrices.FindAsync(id);
                if (seatPrice == null)
                {
                    return new SeatPriceResponseDto
                    {
                        IsSuccess = false,
                        Message = "Seat price not found"
                    };
                }

                if (dto.RoomId.HasValue)
                    seatPrice.RoomId = dto.RoomId.Value;
                if (dto.RowName != null)
                    seatPrice.RowName = dto.RowName;
                if (dto.SeatPrice.HasValue)
                    seatPrice.SeatPrice = dto.SeatPrice;

                await _context.SaveChangesAsync();

                return new SeatPriceResponseDto
                {
                    IsSuccess = true,
                    Message = "Seat price updated successfully",
                    SeatPrice = seatPrice
                };
            }
            catch (Exception ex)
            {
                return new SeatPriceResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error updating seat price: {ex.Message}"
                };
            }
        }

        public async Task<BaseResponseDto> DeleteSeatPriceAsync(int id)
        {
            try
            {
                var seatPrice = await _context.TblSeatPrices.FindAsync(id);
                if (seatPrice == null)
                {
                    return new BaseResponseDto
                    {
                        IsSuccess = false,
                        Message = "Seat price not found"
                    };
                }

                _context.TblSeatPrices.Remove(seatPrice);
                await _context.SaveChangesAsync();

                return new BaseResponseDto
                {
                    IsSuccess = true,
                    Message = "Seat price deleted successfully"
                };
            }
            catch (Exception ex)
            {
                return new BaseResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error deleting seat price: {ex.Message}"
                };
            }
        }
        #endregion

        #region Booking CRUD
        public async Task<BookingListResponseDto> GetAllBookingsAsync(PaginationRequestDto request)
        {
            try
            {
                var query = _context.TblBookings
                    .Include(b => b.Show)
                        .ThenInclude(s => s.ShowDate)
                            .ThenInclude(sd => sd.Movie)
                    .Include(b => b.Show)
                        .ThenInclude(s => s.ShowDate)
                            .ThenInclude(sd => sd.Cinema)
                    .AsQueryable();
                var totalCount = await query.CountAsync();

                var bookings = await query
                    .OrderByDescending(b => b.BookingDate)
                    .Skip((request.PageNo - 1) * request.PageSize)
                    .Take(request.PageSize)
                    .ToListAsync();

                var totalPages = (int)Math.Ceiling(totalCount / (double)request.PageSize);

                return new BookingListResponseDto
                {
                    IsSuccess = true,
                    Message = "Bookings retrieved successfully",
                    Bookings = bookings,
                    TotalCount = totalCount,
                    PageNo = request.PageNo,
                    PageSize = request.PageSize,
                    TotalPages = totalPages
                };
            }
            catch (Exception ex)
            {
                return new BookingListResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error retrieving bookings: {ex.Message}",
                    Bookings = new List<TblBooking>()
                };
            }
        }

        public async Task<BookingResponseDto> GetBookingByIdAsync(int id)
        {
            try
            {
                var booking = await _context.TblBookings
                    .Include(b => b.Show)
                        .ThenInclude(s => s.ShowDate)
                            .ThenInclude(sd => sd.Movie)
                    .Include(b => b.Show)
                        .ThenInclude(s => s.ShowDate)
                            .ThenInclude(sd => sd.Cinema)
                    .Include(b => b.TblBookingDetails)
                        .ThenInclude(bd => bd.Seat)
                    .FirstOrDefaultAsync(b => b.BookingId == id);
                if (booking == null)
                {
                    return new BookingResponseDto
                    {
                        IsSuccess = false,
                        Message = "Booking not found"
                    };
                }

                return new BookingResponseDto
                {
                    IsSuccess = true,
                    Message = "Booking retrieved successfully",
                    BookingId = booking.BookingId,
                    TotalAmount = booking.TotalAmount
                };
            }
            catch (Exception ex)
            {
                return new BookingResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error retrieving booking: {ex.Message}"
                };
            }
        }

        public async Task<BookingResponseDto> UpdateBookingAsync(int id, UpdateBookingDto dto)
        {
            try
            {
                var booking = await _context.TblBookings.FindAsync(id);
                if (booking == null)
                {
                    return new BookingResponseDto
                    {
                        IsSuccess = false,
                        Message = "Booking not found"
                    };
                }

                if (dto.ShowId.HasValue)
                    booking.ShowId = dto.ShowId.Value;
                if (!string.IsNullOrEmpty(dto.CustomerName))
                    booking.CustomerName = dto.CustomerName;
                if (dto.TotalAmount.HasValue)
                    booking.TotalAmount = dto.TotalAmount;

                await _context.SaveChangesAsync();

                return new BookingResponseDto
                {
                    IsSuccess = true,
                    Message = "Booking updated successfully",
                    BookingId = booking.BookingId,
                    TotalAmount = booking.TotalAmount
                };
            }
            catch (Exception ex)
            {
                return new BookingResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error updating booking: {ex.Message}"
                };
            }
        }

        public async Task<BaseResponseDto> DeleteBookingAsync(int id)
        {
            try
            {
                var booking = await _context.TblBookings.FindAsync(id);
                if (booking == null)
                {
                    return new BaseResponseDto
                    {
                        IsSuccess = false,
                        Message = "Booking not found"
                    };
                }

                _context.TblBookings.Remove(booking);
                await _context.SaveChangesAsync();

                return new BaseResponseDto
                {
                    IsSuccess = true,
                    Message = "Booking deleted successfully"
                };
            }
            catch (Exception ex)
            {
                return new BaseResponseDto
                {
                    IsSuccess = false,
                    Message = $"Error deleting booking: {ex.Message}"
                };
            }
        }
        #endregion
    }
}

