using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Implementation.UseCases
{
    public abstract class DbContextBase
    {

        protected DbContextBase(HotelContext context) {

            Context = context;
        }

        protected HotelContext Context { get; }
    }
}
