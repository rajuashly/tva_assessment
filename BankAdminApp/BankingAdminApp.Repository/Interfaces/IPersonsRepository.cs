using BankingAdminApp.DataLayer.EntityClasses;

namespace BankingAdminApp.Repository.Repositories
{
    public interface IPersonsRepository<IEntity> : IRepository<IEntity>
    {
        List<Persons> GetAll();
        bool Exists(string id_number, int code);
        bool Delete(int code);
    }
}

