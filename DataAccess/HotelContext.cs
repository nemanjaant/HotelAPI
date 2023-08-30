using Microsoft.EntityFrameworkCore;
using System;
using Domain;
using ASPNedelja3Vezbe.Domain;
using SocialNetwork.Domain.Entities;

namespace DataAccess
{
    public class HotelContext : DbContext
    {
        public HotelContext() { }
        public HotelContext(DbContextOptions options) : base(options)
        {
            Database.EnsureCreated();
        }

        

        public IApplicationUser User { get; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

            modelBuilder.ApplyConfigurationsFromAssembly(this.GetType().Assembly);
            modelBuilder.Entity<ReservedRoom>().HasKey(x => new { x.ReservationId, x.RoomId });
            modelBuilder.Entity<RoleUseCase>().HasKey(x => new { x.RoleId, x.UseCaseId });

            base.OnModelCreating(modelBuilder);

        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=.\SQLEXPRESS;Initial Catalog=HotelApp;Integrated Security=True");
        }

        public override int SaveChanges()
        {
            foreach (var entry in this.ChangeTracker.Entries())
            {
                if (entry.Entity is Entity e)
                {
                    switch (entry.State)
                    {
                        case EntityState.Added:
                            e.IsActive = true;
                            e.CreatedAt = DateTime.UtcNow;
                            break;
                        case EntityState.Modified:
                            e.ModifiedAt = DateTime.UtcNow;
                            e.ModifiedBy = User?.Identity;
                            break;
                    }
                }
            }

            return base.SaveChanges();
        }



        public DbSet<User> Users { get; set; }
        public DbSet<Role> UserTypes { get; set; }
        public DbSet<Room> Rooms { get; set; }
        public DbSet<RoomType> RoomTypes { get; set; }  
        public DbSet<Reservation> Reservations { get; set; }    
        public DbSet<ReservedRoom> ReservedRooms { get; set; }
        public DbSet<Price> Prices { get; set; }
        public DbSet<Image> Images { get; set; }
        public DbSet<LogEntry> LogEntries { get; set; }


        
    }
}
