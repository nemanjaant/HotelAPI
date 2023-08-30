using Domain;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Configurations
{
    public class PriceConfiguration : EntityConfiguration<Price>
    {
        protected override void ConfigureEntity(EntityTypeBuilder<Price> builder)
        {
            builder.HasOne(x => x.RoomType)
                .WithMany(x => x.Prices)
                .HasForeignKey(x => x.RoomTypeId)
                .OnDelete(Microsoft.EntityFrameworkCore.DeleteBehavior.Restrict);

            builder.Property(x => x.ValidFrom)
                .IsRequired();

            builder.Property(x=>x.PriceValue)
                .IsRequired();
        }
    }
}
