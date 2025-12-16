using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Bird.Database.BirdDbContextModels;

public partial class BirdDbContext : DbContext
{
    public BirdDbContext()
    {
    }

    public BirdDbContext(DbContextOptions<BirdDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<TblBird> TblBirds { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=.;Database=Bird;User ID=sa;Password=sasa@123;TrustServerCertificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TblBird>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Tbl_Bird__3214EC071F3ED2CC");

            entity.ToTable("Tbl_Bird");

            entity.Property(e => e.BirdEnglishName).HasMaxLength(100);
            entity.Property(e => e.BirdMyanmarName).HasMaxLength(100);
            entity.Property(e => e.ImagePath).HasMaxLength(100);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
