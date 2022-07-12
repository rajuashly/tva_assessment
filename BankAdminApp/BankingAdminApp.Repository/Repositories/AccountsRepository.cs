using BankingAdminApp.DataLayer.DBContext;
using BankingAdminApp.DataLayer.EntityClasses;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BankingAdminApp.Repository.Repositories
{
    public class AccountsRepository : BaseRepository, IAccountsRepository<Accounts>
    {
        public AccountsRepository(DefaultDBContext context) : base(context)
        { }
        public Accounts Get(int code)
        {
            var result = _context.Accounts.Include(x => x.Person).Include(x => x.Transactions).Where(x => x.code == code).FirstOrDefault();

            if (result == null)
            {
                return null;
            }
            else
            {
                result = _context.Accounts.Where(x => x.code == result.person_code).FirstOrDefault();
            }
            return result;
        }

        public List<Accounts> GetByPersonCode(int person_code)
        {
            var result = _context.Accounts.Where(x => x.person_code == person_code).ToList();
            if (result == null)
            {
                List<Accounts> emptyList = new List<Accounts>();
                return emptyList;
            }
            return result;
        }


        public bool Exists(string account_number, int code)
        {
            if (code == 0)
            {
                return _context.Accounts.Any(e => e.account_number == account_number);
            }
            else
            {
                return _context.Accounts.Any(e => e.account_number == account_number && e.code != code);
            }
        }

        public int Create(Accounts account)
        {
            try
            {
                account.outstanding_balance = 0;
                account.is_active = true;
                _context.Accounts.Add(account);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {

            }
            return account.code;
        }

        public bool Update(Accounts account)
        {
            bool updated = false;
            try
            {
                var obj = _context.Accounts.Find(account.code);
                if (obj != null && obj.code > 0)
                {
                    obj.account_number = account.account_number;
                    _context.SaveChanges();
                    updated = true;
                }
            }
            catch (Exception ex)
            {

            }
            return updated;
        }

        public bool SetActiveStatus(int code, bool isActive)
        {
            bool updated = false;
            try
            {
                var obj = _context.Accounts.Where(x => x.code == code).FirstOrDefault();
                if (obj != null && obj.code > 0)
                {
                    obj.is_active = isActive;
                    _context.SaveChanges();
                    updated = true;
                }
            }
            catch (Exception ex)
            {

            }
            return updated;
        }

    }
}
