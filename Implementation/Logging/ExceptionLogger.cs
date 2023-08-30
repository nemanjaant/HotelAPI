using Application.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Implementation.Logging
{
    public class ExceptionLogger : IExceptionLogger
    {

        public void Log(Exception exception)
        {
            Console.WriteLine(exception.ToString());
        }
    }
}
