using BankingAdminApp.DataLayer.EntityClasses;

namespace BankingAdminApp.Repository.Repositories
{
    public interface ITransactionsRepository<IEntity> : IRepository<IEntity>
    {
        List<Transactions> GetByAccountCode(int account_code);

    }
}

