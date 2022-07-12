using System;
using System.Collections.Generic;

namespace BankingAdminApp.DataLayer.EntityClasses
{
    public partial class Transactions
    {
        public int code { get; set; }
        public int account_code { get; set; }
        public DateTime transaction_date { get; set; }
        public DateTime capture_date { get; set; }
        public decimal amount { get; set; }
        public string description { get; set; }

        public virtual Accounts? Account { get; set; }
    }
}
