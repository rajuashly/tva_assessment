using BankingAdminApp.Service.Entities;
using BankingAdminApp.Service.Models;

namespace BankingAdminApp.Service.Interfaces
{

        public interface IUserService
        {
            AuthenticateResponse Authenticate(AuthenticateRequest model);
            IEnumerable<User> GetAll();
            User GetById(int id);
        }

}
