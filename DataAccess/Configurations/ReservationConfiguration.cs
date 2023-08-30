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
    public class ReservationConfiguration : EntityConfiguration<Reservation>
    {
        protected override void ConfigureEntity(EntityTypeBuilder<Reservation> builder)
        {
            builder.Property(x => x.CheckIn).IsRequired();
            builder.Property(x => x.CheckOut).IsRequired();
            builder.Property(x => x.IsActive).HasDefaultValue(true).IsRequired();

            builder.HasOne(x => x.Guest)
                .WithMany(x => x.Reservations);

            builder.HasMany(x => x.Rooms)
                .WithMany(x => x.Reservations);
               
                
                
                
        }
    }
}
