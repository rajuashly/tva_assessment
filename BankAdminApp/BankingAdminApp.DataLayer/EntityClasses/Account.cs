using System;
using System.Collections.Generic;

namespace BankingAdminApp.DataLayer.EntityClasses
{
    public partial class Accounts
    {
        public Accounts()
        {
            Transactions = new HashSet<Transactions>();
        }

        public int code { get; set; }
        public int person_code { get; set; }
        public string account_number { get; set; }
        public decimal outstanding_balance { get; set; }
        public bool is_active { get; set; }
        public int? Personscode { get; set; }

        public virtual Persons Person { get; set; }
        public virtual ICollection<Transactions>? Transactions { get; set; }
    }
}
