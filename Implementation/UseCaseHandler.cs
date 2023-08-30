using Application;
using Application.Logging;
using Application.UseCases;
using Implementation.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory.Database;

namespace Implementation
{
    public class UseCaseHandler
    {
        private EfUseCaseLogger logger;
        private readonly IApplicationActor actor;

        public UseCaseHandler(EfUseCaseLogger logger, IApplicationActor actor)
        {
            this.logger = logger;
            this.actor = actor;
        }

        public void HandleCommand<TRequest>(ICommand<TRequest> command, TRequest data)
        {
            try
            {
                if (!actor.AllowedUseCases.Contains(command.Id))
                {
                    throw new UnauthorizedAccessException();
                }

                logger.Add(new UseCaseLogEntry
                {
                    Actor = actor.Username,
                    ActorId = actor.Id,
                    Data = data,
                    UseCaseName = command.Name
                });
                command.Execute(data);
            }

            catch (Exception ex)
            {

                throw; 
            }
        }

        public TResponse HandleQuery<TRequest, TResponse>(IQuery<TRequest, TResponse> query,  TRequest data) 
        {

            try
            {
                logger.Add(new UseCaseLogEntry
                {
                    Actor = actor.Username,
                    ActorId = actor.Id,
                    Data = data,
                    UseCaseName = query.Name
                });
                var response = query.Execute(data);

                return response;
            }

            catch(Exception ex)
            {

                throw new Exception(ex.Message);
            }
        
        }
    }
}
