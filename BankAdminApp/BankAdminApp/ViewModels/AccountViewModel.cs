using BankingAdminApp.DataLayer.EntityClasses;
using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;

namespace BankingAdminApp.ViewModels
{
    public class AccountViewModel
    {
        public int code { get; set; }
        public int person_code { get; set; }

        [Display(Name = "Person ID Number")]
        public string? id_number { get; set; }

        [Required(ErrorMessage = "{0} is required")]
        [MaxLength(50, ErrorMessage = "{0} cannot be greater than {1} characters")]
        [Display(Name = "Account Number")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        [Remote("Exists", "Accounts", HttpMethod = "POST", AdditionalFields = "code", ErrorMessage = "{0} number already exists")]
        public string account_number { get; set; }

        public List<Transactions>? transactions { get; set; }

        public bool? is_active { get; set; }

        //[Display(Name = "Outstanding Balance")]
        //public decimal? outstanding_balance { get; set; }

    }
}
