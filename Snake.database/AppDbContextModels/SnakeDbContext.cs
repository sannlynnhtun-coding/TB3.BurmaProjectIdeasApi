using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Snake.database.AppDbContextModels;

public partial class SnakeDbContext : DbContext
{
    public SnakeDbContext()
    {
    }

    public SnakeDbContext(DbContextOptions<SnakeDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<TblSnake> TblSnakes { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TblSnake>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__Tbl_snak__3214EC07F6B9649C");

            entity.ToTable("Tbl_snake");

            entity.Property(e => e.EngName).HasMaxLength(50);
            entity.Property(e => e.IsDanger).HasMaxLength(5);
            entity.Property(e => e.IsPoison).HasMaxLength(5);
            entity.Property(e => e.Mmname)
                .HasMaxLength(50)
                .HasColumnName("MMName");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
