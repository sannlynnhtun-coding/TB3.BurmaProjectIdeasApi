using Microsoft.EntityFrameworkCore;
using MovieTicketOnlineBookingSystem.Database.AppDbContextModels;

namespace MovieTicketOnlineBookingSystem.Api.Services
{
    public class DatabaseSeeder
    {
        private readonly AppDbContext _context;

        public DatabaseSeeder(AppDbContext context)
        {
            _context = context;
        }

        public async Task SeedAsync()
        {
            // Check if data already exists
            if (await _context.TblMovieLists.AnyAsync())
            {
                return; // Data already seeded
            }

            // Seed Movies
            var movies = new List<TblMovieList>
            {
                new TblMovieList { MovieTitle = "The Dark Knight", ReleaseDate = DateTime.Parse("2008-07-18"), Duration = "152 min", MoviePhoto = "https://example.com/dark-knight.jpg" },
                new TblMovieList { MovieTitle = "Inception", ReleaseDate = DateTime.Parse("2010-07-16"), Duration = "148 min", MoviePhoto = "https://example.com/inception.jpg" },
                new TblMovieList { MovieTitle = "Interstellar", ReleaseDate = DateTime.Parse("2014-11-07"), Duration = "169 min", MoviePhoto = "https://example.com/interstellar.jpg" },
                new TblMovieList { MovieTitle = "The Matrix", ReleaseDate = DateTime.Parse("1999-03-31"), Duration = "136 min", MoviePhoto = "https://example.com/matrix.jpg" },
                new TblMovieList { MovieTitle = "Pulp Fiction", ReleaseDate = DateTime.Parse("1994-10-14"), Duration = "154 min", MoviePhoto = "https://example.com/pulp-fiction.jpg" },
                new TblMovieList { MovieTitle = "The Shawshank Redemption", ReleaseDate = DateTime.Parse("1994-09-23"), Duration = "142 min", MoviePhoto = "https://example.com/shawshank.jpg" },
                new TblMovieList { MovieTitle = "Forrest Gump", ReleaseDate = DateTime.Parse("1994-07-06"), Duration = "142 min", MoviePhoto = "https://example.com/forrest-gump.jpg" },
                new TblMovieList { MovieTitle = "The Godfather", ReleaseDate = DateTime.Parse("1972-03-24"), Duration = "175 min", MoviePhoto = "https://example.com/godfather.jpg" }
            };
            _context.TblMovieLists.AddRange(movies);
            await _context.SaveChangesAsync();

            // Seed Cinemas
            var cinemas = new List<TblCinemaList>
            {
                new TblCinemaList { CinemaName = "AMC Times Square", CinemaLocation = "New York, NY" },
                new TblCinemaList { CinemaName = "Regal Cinemas Hollywood", CinemaLocation = "Los Angeles, CA" },
                new TblCinemaList { CinemaName = "Cinemark Century", CinemaLocation = "San Francisco, CA" },
                new TblCinemaList { CinemaName = "Cineplex Odeon", CinemaLocation = "Chicago, IL" },
                new TblCinemaList { CinemaName = "AMC Empire 25", CinemaLocation = "New York, NY" }
            };
            _context.TblCinemaLists.AddRange(cinemas);
            await _context.SaveChangesAsync();

            // Seed Cinema Rooms
            var rooms = new List<TblCinemaRoom>();
            var roomNames = new[] { "Theater 1", "Theater 2", "Theater 3", "IMAX", "VIP Lounge", "Premium Screen" };
            var roomNumbers = new[] { 1, 2, 3, 4, 5, 6 };
            var capacities = new[] { 150, 200, 180, 300, 50, 120 };

            foreach (var cinema in cinemas)
            {
                for (int i = 0; i < 3; i++) // 3 rooms per cinema
                {
                    rooms.Add(new TblCinemaRoom
                    {
                        CinemaId = cinema.CinemaId,
                        RoomNumber = roomNumbers[i],
                        RoomName = roomNames[i],
                        SeatingCapacity = capacities[i]
                    });
                }
            }
            _context.TblCinemaRooms.AddRange(rooms);
            await _context.SaveChangesAsync();

            // Seed Seat Prices (different prices for different rows)
            var seatPrices = new List<TblSeatPrice>();
            var rowNames = new[] { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J" };
            var prices = new[] { 8.00m, 8.50m, 9.00m, 9.50m, 10.00m, 10.50m, 11.00m, 11.50m, 12.00m, 15.00m }; // Premium seats at the back

            foreach (var room in rooms)
            {
                for (int i = 0; i < rowNames.Length; i++)
                {
                    seatPrices.Add(new TblSeatPrice
                    {
                        RoomId = room.RoomId,
                        RowName = rowNames[i],
                        SeatPrice = prices[i]
                    });
                }
            }
            _context.TblSeatPrices.AddRange(seatPrices);
            await _context.SaveChangesAsync();

            // Seed Room Seats
            var seats = new List<TblRoomSeat>();
            var seatTypes = new[] { "Standard", "Premium", "VIP" };

            foreach (var room in rooms)
            {
                int seatNumber = 1;
                foreach (var rowName in rowNames)
                {
                    int seatsPerRow = room.SeatingCapacity.HasValue ? room.SeatingCapacity.Value / rowNames.Length : 15;
                    string seatType = Array.IndexOf(rowNames, rowName) >= 7 ? "Premium" : 
                                     Array.IndexOf(rowNames, rowName) >= 9 ? "VIP" : "Standard";

                    for (int seat = 1; seat <= seatsPerRow; seat++)
                    {
                        seats.Add(new TblRoomSeat
                        {
                            RoomId = room.RoomId,
                            SeatNo = seat,
                            RowName = rowName,
                            SeatType = seatType
                        });
                        seatNumber++;
                    }
                }
            }
            _context.TblRoomSeats.AddRange(seats);
            await _context.SaveChangesAsync();

            // Seed Show Dates (linking movies to cinemas and rooms)
            var showDates = new List<TblShowDate>();
            var random = new Random();
            
            foreach (var movie in movies.Take(5)) // Use first 5 movies
            {
                foreach (var cinema in cinemas.Take(3)) // Use first 3 cinemas
                {
                    var cinemaRooms = rooms.Where(r => r.CinemaId == cinema.CinemaId).Take(2).ToList();
                    foreach (var room in cinemaRooms)
                    {
                        showDates.Add(new TblShowDate
                        {
                            CinemaId = cinema.CinemaId,
                            RoomId = room.RoomId,
                            MovieId = movie.MovieId
                        });
                    }
                }
            }
            _context.TblShowDates.AddRange(showDates);
            await _context.SaveChangesAsync();

            // Seed Movie Schedules (show times for the next 7 days)
            var schedules = new List<TblMovieSchedule>();
            var showTimes = new[] { "10:00", "13:00", "16:00", "19:00", "22:00" };

            foreach (var showDate in showDates)
            {
                for (int day = 0; day < 7; day++) // Next 7 days
                {
                    var date = DateTime.Now.AddDays(day).Date;
                    foreach (var time in showTimes.Take(3)) // 3 shows per day
                    {
                        var showDateTime = date.Add(TimeSpan.Parse(time));
                        schedules.Add(new TblMovieSchedule
                        {
                            ShowDateId = showDate.ShowDateId,
                            ShowDateTime = showDateTime
                        });
                    }
                }
            }
            _context.TblMovieSchedules.AddRange(schedules);
            await _context.SaveChangesAsync();

            // Seed some sample bookings
            var bookings = new List<TblBooking>();
            var customerNames = new[] { "John Doe", "Jane Smith", "Bob Johnson", "Alice Williams", "Charlie Brown" };

            foreach (var schedule in schedules.Take(10)) // Book 10 shows
            {
                var booking = new TblBooking
                {
                    ShowId = schedule.ShowId,
                    CustomerName = customerNames[random.Next(customerNames.Length)],
                    BookingDate = DateTime.Now.AddDays(-random.Next(1, 5)),
                    TotalAmount = 0
                };
                bookings.Add(booking);
            }
            _context.TblBookings.AddRange(bookings);
            await _context.SaveChangesAsync();

            // Seed Booking Details
            var bookingDetails = new List<TblBookingDetail>();
            foreach (var booking in bookings)
            {
                var schedule = schedules.First(s => s.ShowId == booking.ShowId);
                var showDate = showDates.First(sd => sd.ShowDateId == schedule.ShowDateId);
                var roomSeats = seats.Where(s => s.RoomId == showDate.RoomId).Take(random.Next(2, 5)).ToList();

                decimal total = 0;
                foreach (var seat in roomSeats)
                {
                    var price = seatPrices.FirstOrDefault(sp => sp.RoomId == seat.RoomId && sp.RowName == seat.RowName);
                    var seatPrice = price?.SeatPrice ?? 10.00m;
                    total += seatPrice;

                    bookingDetails.Add(new TblBookingDetail
                    {
                        BookingId = booking.BookingId,
                        SeatId = seat.SeatId,
                        Price = seatPrice
                    });
                }
                booking.TotalAmount = total;
            }
            _context.TblBookingDetails.AddRange(bookingDetails);
            await _context.SaveChangesAsync();
        }
    }
}

