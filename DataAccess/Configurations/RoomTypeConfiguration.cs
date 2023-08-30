using Domain;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Configurations
{
    public class RoomTypeConfiguration : EntityConfiguration<RoomType>
    {
        protected override void ConfigureEntity(EntityTypeBuilder<RoomType> builder)
        {
            

            builder.HasMany(x => x.Images)
                .WithOne(x => x.RoomType)
                .HasForeignKey(x => x.RoomTypeId)
                .OnDelete(Microsoft.EntityFrameworkCore.DeleteBehavior.Restrict);

            builder.HasMany(x => x.Prices)
                .WithOne(x => x.RoomType)
                .HasForeignKey(x => x.RoomTypeId);

            builder.Property(x => x.MaxCapacity).IsRequired();

        }
    }
}
