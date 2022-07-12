using BankingAdminApp.DataLayer.DBContext;
using BankingAdminApp.DataLayer.EntityClasses;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BankingAdminApp.Repository.Repositories
{
    public class TransactionsRepository : BaseRepository, ITransactionsRepository<Transactions>
    {
        public TransactionsRepository(DefaultDBContext context) : base(context)
        { }
        public Transactions Get(int code)
        {
            var result = _context.Transactions.Include(x=>x.Account).Where(x=>x.code==code).FirstOrDefault();
            if (result == null)
            {
                return null;
            }
            return result;


        }
        public List<Transactions> GetByAccountCode(int account_code)
        {
            var result = _context.Transactions.Where(x=>x.account_code == account_code).ToList();
            if (result == null)
            {
                return null;
            }
            return result;
        }

        public int Create(Transactions transaction)
        {
            try
            {                    
                //**SQL TRIGGER [dbo].[trg_update_transaction_change] used to update account outstanding balance
                transaction.capture_date = DateTime.Now;
                _context.Transactions.Add(transaction);
                _context.SaveChanges();
            }
            catch (Exception ex)
            {

            }
            return transaction.code;
        }

        public bool Update(Transactions transactions)
        {
            bool updated = false;

            try
            {
                transactions.capture_date = DateTime.Now;

                var obj = _context.Transactions.Find(transactions.code);
                if (obj != null && obj.code > 0)
                {
                    //**SQL TRIGGER [dbo].[trg_update_transaction_change] used to update account outstanding balance
                    _context.Entry(obj).State = EntityState.Detached;
                    _context.Transactions.Update(transactions);
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
                var obj = _context.Transactions.Find(id);

                if (obj != null)
                {
                    _context.Transactions.Remove(obj);
                    _context.SaveChanges();
                    deleted = true;
                }
            }
            catch (Exception ex)
            {

            }
            return deleted;
        }


 


    }
}
