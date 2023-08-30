using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Configurations
{
    public class RoomConfiguration : EntityConfiguration<Room>
    {
        protected override void ConfigureEntity(EntityTypeBuilder<Room> builder)
        {
            builder.HasOne(x => x.TypeOfRoom)
                .WithMany(x => x.Rooms)
                .OnDelete(Microsoft.EntityFrameworkCore.DeleteBehavior.Restrict);

            builder.Property(x => x.RoomNumber)
                .IsRequired();

            builder.Property(x => x.IsAvailable)
                .IsRequired()
                .HasDefaultValue(true);

            builder.HasMany(x => x.Reservations)
                .WithMany(x => x.Rooms);
                    
        }

        
    }
}
