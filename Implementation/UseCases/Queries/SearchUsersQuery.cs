using Application.Logging;
using Application.UseCases;
using Application.UseCases.DTO;
using Application.UseCases.DTO.Read;
using Application.UseCases.Queries;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Implementation.UseCases.Queries
{
    public class SearchUsersQuery : DbContextBase, ISearchUsersQuery
    {
        public SearchUsersQuery(HotelContext context) : base(context)
        {
        }

        public int Id => 1;
        public string Name => "Search Users";
        public string Description => "Query that searches all users in the database.";
        

        public IEnumerable<UserDTO> Execute(KeywordSearchDTO request)
        {
            var query = Context.Users.AsQueryable();

            if (!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(x => x.FirstName.Contains(request.Keyword) || x.LastName.Contains(request.Keyword));
            }

            return query.Select(x => new UserDTO
            {
                FirstName = x.FirstName,
                LastName = x.LastName,
                Email = x.Email,
                Password = x.Password
            }).ToList();


        }


        
    }
}
