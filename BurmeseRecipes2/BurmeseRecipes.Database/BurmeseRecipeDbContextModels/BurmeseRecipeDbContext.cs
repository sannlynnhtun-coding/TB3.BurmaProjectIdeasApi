using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace BurmeseRecipes.Database.BurmeseRecipeDbContextModels;

public partial class BurmeseRecipeDbContext : DbContext
{
    public BurmeseRecipeDbContext()
    {
    }

    public BurmeseRecipeDbContext(DbContextOptions<BurmeseRecipeDbContext> options)
        : base(options)
    {
    }

    public virtual DbSet<TblBurmeseRecipe> TblBurmeseRecipes { get; set; }

    public virtual DbSet<TblUserType> TblUserTypes { get; set; }

    

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TblBurmeseRecipe>(entity =>
        {
            entity.HasKey(e => e.RecipeId);

            entity.ToTable("Tbl_BurmeseRecipes");

            entity.Property(e => e.CreatedDateTime).HasColumnType("datetime");
            entity.Property(e => e.ModifiedDateTime).HasColumnType("datetime");
            entity.Property(e => e.UserType)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<TblUserType>(entity =>
        {
            entity.HasKey(e => e.UserId);

            entity.ToTable("Tbl_UserTypes");

            entity.Property(e => e.UserCode)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.UserEngType)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.UserMmtype)
                .HasMaxLength(50)
                .HasColumnName("UserMMType");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
