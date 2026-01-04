using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace MissingHistoricalRecords.Database.AppDbContextModels;

public partial class MissingHistoricalRecordsDbContext : DbContext
{
    public MissingHistoricalRecordsDbContext()
    {
    }

    public MissingHistoricalRecordsDbContext(DbContextOptions<MissingHistoricalRecordsDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<TblBook> TblBooks { get; set; }

    public virtual DbSet<TblContent> TblContents { get; set; }

//    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
//#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
//        => optionsBuilder.UseSqlServer("Server=.;Database=MissingHistoricalRecordsApi;User ID=sa;Password=sasa@123;TrustServerCertificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TblBook>(entity =>
        {
            entity.HasKey(e => e.BookId).HasName("PK_Books");

            entity.ToTable("Tbl_Books");

            entity.Property(e => e.BookAuthor).HasMaxLength(155);
            entity.Property(e => e.BookCategory).HasMaxLength(200);
            entity.Property(e => e.BookCover).HasMaxLength(200);
            entity.Property(e => e.BookTitle).HasMaxLength(255);
            entity.Property(e => e.CreatedDateTime).HasColumnType("datetime");
            entity.Property(e => e.ModifiedDateTime).HasColumnType("datetime");
        });

        modelBuilder.Entity<TblContent>(entity =>
        {
            entity.HasKey(e => new { e.BookId, e.PageNo });

            entity.ToTable("Tbl_Contents");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
