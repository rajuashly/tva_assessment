using BankingAdminApp.DataLayer.DBContext;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BankingAdminApp.Repository
{
    public abstract class BaseRepository
    {
        protected readonly DefaultDBContext _context;

        public BaseRepository(DefaultDBContext context)
        {
            _context = context;
        }
    }
}
