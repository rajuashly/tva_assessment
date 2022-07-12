using BankingAdminApp.DataLayer.EntityClasses;

namespace BankingAdminApp.Repository.Repositories
{
    public interface IAccountsRepository<IEntity> : IRepository<IEntity>
    {
        List<Accounts> GetByPersonCode(int person_code);
        bool Exists(string account_number, int code);
        bool SetActiveStatus(int code, bool isActive);
    }
}

