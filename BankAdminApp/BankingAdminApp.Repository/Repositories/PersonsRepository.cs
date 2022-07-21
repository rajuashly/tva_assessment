using BankingAdminApp.DataLayer;
using BankingAdminApp.DataLayer.DBContext;
using BankingAdminApp.DataLayer.EntityClasses;
using BankingAdminApp.Repository.Repositories;
using Microsoft.EntityFrameworkCore;

namespace BankingAdminApp.Repository
{
    public class PersonsRepository : BaseRepository, IPersonsRepository<Persons>
    {
        public PersonsRepository(DefaultDBContext context) : base(context)
        { }

        public Persons Get(int code)
        {
            SingletonDBContext singleton = SingletonDBContext.GetInstance;
            var dbContext = singleton.GetDBContext();
            var dbContext1 = singleton.GetDBContext();

            var result = _context.Persons.Find(code);
            if (result == null)
            {
                return null;
            }
            return result;
        }
        public List<Persons> GetAll()
        {
            return _context.Persons.Include(x => x.Accounts).Where(x => x.is_deleted == false).ToList();
        }

        public int Create(Persons person)
        {
            try
            {
                person.name = person.name.Trim().ToUpper();
                person.name = person.surname.Trim().ToUpper();
                person.is_deleted = false;
                _context.Persons.Add(person);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {

            }
            return person.code;
        }
        public bool Update(Persons person)
        {
            bool updated = false;
            try
            {
                var obj = _context.Persons.Find(person.code);
                if (obj != null && obj.code > 0)
                {
                    //release entity so it can be updated
                    _context.Entry(obj).State = EntityState.Detached;
                    _context.Persons.Update(person);
                    _context.SaveChanges();
                    updated = true;
                }
            }
            catch (Exception ex)
            {

            }
            return updated;
        }
        public bool Delete(int id)
        {
            bool deleted = false;
            try
            {
                var obj = _context.Persons.Find(id);

                if (obj != null)
                {
                    obj.is_deleted = true;
                    _context.SaveChanges();
                    deleted = true;
                }
            }
            catch (Exception ex)
            {

            }
            return deleted;
        }

        public bool Exists(string id_number, int code)
        {
            if (code == 0)
            {
                return _context.Persons.Any(e => e.id_number == id_number);
            }
            else
            {
                return _context.Persons.Any(e => e.id_number == id_number && e.code != code);
            }
        }
    }
}
