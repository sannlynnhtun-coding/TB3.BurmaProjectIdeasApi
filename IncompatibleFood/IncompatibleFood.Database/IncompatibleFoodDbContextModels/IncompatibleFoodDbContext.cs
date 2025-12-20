using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace IncompatibleFood.Database.IncompatibleFoodDbContextModels;

public partial class IncompatibleFoodDbContext : DbContext
{
    public IncompatibleFoodDbContext()
    {
    }

    public IncompatibleFoodDbContext(DbContextOptions<IncompatibleFoodDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<TblIncompatibleFood> TblIncompatibleFoods { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=.;Database=IncompatibleFoodApi;User ID=sa;Password=sasa@123;TrustServerCertificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TblIncompatibleFood>(entity =>
        {
            entity.ToTable("Tbl_IncompatibleFood");

            entity.Property(e => e.Description).HasMaxLength(50);
            entity.Property(e => e.FoodA).HasMaxLength(50);
            entity.Property(e => e.FoodB).HasMaxLength(50);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
