namespace BankingAdminApp.Repository
{
    public interface IRepository<TEntity>
    {
        int Create(TEntity entity);
        TEntity Get(int id);
        bool Update(TEntity entity);
    }
}