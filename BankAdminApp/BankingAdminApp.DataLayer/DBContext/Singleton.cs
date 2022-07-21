using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;

namespace BankingAdminApp.DataLayer.DBContext
{
    public sealed class SingletonDBContext
    {
        private static int counter = 0;
        private static SingletonDBContext instance = null;
        private static DefaultDBContext dbContext = null;

        private SingletonDBContext()
        {
            counter++;
            Debug.WriteLine("Counter Value " + counter.ToString());
        }

        public static SingletonDBContext GetInstance
        {
            get
            {
                if (instance == null)
                {
                    return instance = new SingletonDBContext();
                }
                else
                {
                    return instance;
                }
            }
        }

        public DefaultDBContext GetDBContext()
        {
            if (dbContext == null)
            {
                DbContextOptions<DefaultDBContext> _contextOptions = new DbContextOptionsBuilder<DefaultDBContext>().UseSqlServer(@"Server=DESKTOP-L6CDFKH;Database=BankingAdminDB;Trusted_Connection=True;MultipleActiveResultSets=true").Options;
                dbContext = new DefaultDBContext(_contextOptions);
                return dbContext;
            }
            else
            {
                return dbContext;
            }
        }
    }
}
