using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace MovieTicketOnlineBookingSystem.Database.AppDbContextModels;

public partial class AppDbContext : DbContext
{
    public AppDbContext()
    {
    }

    public AppDbContext(DbContextOptions<AppDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<TblBooking> TblBookings { get; set; }

    public virtual DbSet<TblBookingDetail> TblBookingDetails { get; set; }

    public virtual DbSet<TblCinemaList> TblCinemaLists { get; set; }

    public virtual DbSet<TblCinemaRoom> TblCinemaRooms { get; set; }

    public virtual DbSet<TblMovieList> TblMovieLists { get; set; }

    public virtual DbSet<TblMovieSchedule> TblMovieSchedules { get; set; }

    public virtual DbSet<TblRoomSeat> TblRoomSeats { get; set; }

    public virtual DbSet<TblSeatPrice> TblSeatPrices { get; set; }

    public virtual DbSet<TblShowDate> TblShowDates { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TblBooking>(entity =>
        {
            entity.HasKey(e => e.BookingId).HasName("PK__Tbl_Book__73951AED3D56DFEE");

            entity.ToTable("Tbl_Booking");

            entity.Property(e => e.BookingDate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime");
            entity.Property(e => e.CustomerName).HasMaxLength(100);
            entity.Property(e => e.TotalAmount).HasColumnType("decimal(18, 2)");

            entity.HasOne(d => d.Show).WithMany(p => p.TblBookings)
                .HasForeignKey(d => d.ShowId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Tbl_Booki__ShowI__4CA06362");
        });

        modelBuilder.Entity<TblBookingDetail>(entity =>
        {
            entity.HasKey(e => e.BookingDetailId).HasName("PK__Tbl_Book__8136D45ADCD5B52A");

            entity.ToTable("Tbl_BookingDetail");

            entity.Property(e => e.Price).HasColumnType("decimal(18, 2)");

            entity.HasOne(d => d.Booking).WithMany(p => p.TblBookingDetails)
                .HasForeignKey(d => d.BookingId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Tbl_Booki__Booki__4F7CD00D");

            entity.HasOne(d => d.Seat).WithMany(p => p.TblBookingDetails)
                .HasForeignKey(d => d.SeatId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Tbl_Booki__SeatI__5070F446");
        });

        modelBuilder.Entity<TblCinemaList>(entity =>
        {
            entity.HasKey(e => e.CinemaId).HasName("PK__Tbl_Cine__59C926463B53BD9B");

            entity.ToTable("Tbl_CinemaList");

            entity.Property(e => e.CinemaName).HasMaxLength(100);
        });

        modelBuilder.Entity<TblCinemaRoom>(entity =>
        {
            entity.HasKey(e => e.RoomId).HasName("PK__Tbl_Cine__328639396694B120");

            entity.ToTable("Tbl_CinemaRoom");

            entity.Property(e => e.RoomName).HasMaxLength(50);

            entity.HasOne(d => d.Cinema).WithMany(p => p.TblCinemaRooms)
                .HasForeignKey(d => d.CinemaId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Tbl_Cinem__Cinem__398D8EEE");
        });

        modelBuilder.Entity<TblMovieList>(entity =>
        {
            entity.HasKey(e => e.MovieId).HasName("PK__Tbl_Movi__4BD2941A7730E607");

            entity.ToTable("Tbl_MovieList");

            entity.Property(e => e.Duration).HasMaxLength(50);
            entity.Property(e => e.MovieTitle).HasMaxLength(200);
            entity.Property(e => e.ReleaseDate).HasColumnType("datetime");
        });

        modelBuilder.Entity<TblMovieSchedule>(entity =>
        {
            entity.HasKey(e => e.ShowId).HasName("PK__Tbl_Movi__6DE3E0B252D59B4A");

            entity.ToTable("Tbl_MovieSchedule");

            entity.Property(e => e.ShowDateTime).HasColumnType("datetime");

            entity.HasOne(d => d.ShowDate).WithMany(p => p.TblMovieSchedules)
                .HasForeignKey(d => d.ShowDateId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Tbl_Movie__ShowD__48CFD27E");
        });

        modelBuilder.Entity<TblRoomSeat>(entity =>
        {
            entity.HasKey(e => e.SeatId).HasName("PK__Tbl_Room__311713F3966A7EA0");

            entity.ToTable("Tbl_RoomSeat");

            entity.Property(e => e.RowName).HasMaxLength(10);
            entity.Property(e => e.SeatType).HasMaxLength(50);

            entity.HasOne(d => d.Room).WithMany(p => p.TblRoomSeats)
                .HasForeignKey(d => d.RoomId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Tbl_RoomS__RoomI__3E52440B");
        });

        modelBuilder.Entity<TblSeatPrice>(entity =>
        {
            entity.HasKey(e => e.SeatPriceId).HasName("PK__Tbl_Seat__DB5F5438CEF74A29");

            entity.ToTable("Tbl_SeatPrice");

            entity.Property(e => e.RowName).HasMaxLength(10);
            entity.Property(e => e.SeatPrice).HasColumnType("decimal(18, 2)");

            entity.HasOne(d => d.Room).WithMany(p => p.TblSeatPrices)
                .HasForeignKey(d => d.RoomId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Tbl_SeatP__RoomI__412EB0B6");
        });

        modelBuilder.Entity<TblShowDate>(entity =>
        {
            entity.HasKey(e => e.ShowDateId).HasName("PK__Tbl_Show__DAD78F74BEF02779");

            entity.ToTable("Tbl_ShowDate");

            entity.HasOne(d => d.Cinema).WithMany(p => p.TblShowDates)
                .HasForeignKey(d => d.CinemaId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Tbl_ShowD__Cinem__440B1D61");

            entity.HasOne(d => d.Movie).WithMany(p => p.TblShowDates)
                .HasForeignKey(d => d.MovieId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Tbl_ShowD__Movie__45F365D3");

            entity.HasOne(d => d.Room).WithMany(p => p.TblShowDates)
                .HasForeignKey(d => d.RoomId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__Tbl_ShowD__RoomI__44FF419A");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
