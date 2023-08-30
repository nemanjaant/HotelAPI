using Newtonsoft.Json;
using Application.Logging;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Domain;

namespace Implementation.Logging
{
    public class EfUseCaseLogger : IUseCaseLogger
    {
        private readonly HotelContext context;

        public EfUseCaseLogger(HotelContext context)
        {
            this.context = context;
        }

        public void Add(UseCaseLogEntry entry)
        {
            context.LogEntries.Add(new LogEntry
            {
                Actor = entry.Actor,
                ActorId = entry.ActorId,
                UseCaseData = JsonConvert.SerializeObject(entry.Data),
                UseCaseName = entry.UseCaseName
            });

            context.SaveChanges();
        }
    }
}
