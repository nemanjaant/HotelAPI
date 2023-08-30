using Application.UseCases.Commands;
using Application.UseCases.DTO;
using Application.UseCases.Queries;
using DataAccess;
using Domain;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Implementation.UseCases.Commands
{
    public class RegisterUserCommand : DbContextBase, IRegisterUserCommand
    {

        private readonly RegistrationValidator validator;
        public RegisterUserCommand(HotelContext context, RegistrationValidator validator) : base(context)
        {
            this.validator = validator;
        }

        public int Id => 2;

        public string Name => "User registration";

        public string Description => "Registering a new user";

        public void Execute(UserDTO user)
        {
            
            validator.ValidateAndThrow(user);

            Role defaultRole = Context.UserTypes.FirstOrDefault(x => x.IsDefault);
            string passwordHash = BCrypt.Net.BCrypt.HashPassword(user.Password);

            var userToAdd = new User
            {
                Role = defaultRole,
                Email = user.Email,
                Username = user.Username,
                FirstName = user.FirstName,
                LastName = user.LastName,
                Password = passwordHash
            };

            Context.Users.Add(userToAdd);


            Context.SaveChanges();
        }
    }
}
