using System;
using System.Collections.Generic;

namespace BankingAdminApp.DataLayer.EntityClasses
{
    public partial class Persons
    {
        public Persons()
        {
            Accounts = new HashSet<Accounts>();
        }

        public int code { get; set; }
        public string? name { get; set; }
        public string? surname { get; set; }
        public string id_number { get; set; }
        public bool is_deleted { get; set; }
        public virtual ICollection<Accounts> Accounts { get; set; }
    }
}
