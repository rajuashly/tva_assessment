using BankingAdminApp.DataLayer.EntityClasses;
using BankingAdminApp.Helpers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using System.ComponentModel.DataAnnotations;
using System.Configuration;

namespace BankingAdminApp.ViewModels
{
    public class AccountViewModel
    {
        //private readonly IOptions<CryptoEngine.Secrets> _options;
        //private readonly IConfiguration Configuration;

        //public AccountViewModel(IConfiguration configuration)
        //{
        //    Configuration = configuration;
        //}
        public int code { get; set; }
        public int person_code { get; set; }

        [Display(Name = "Person ID Number")]
        public string? id_number { get; set; }

        [Required(ErrorMessage = "{0} is required")]
        [MaxLength(50, ErrorMessage = "{0} cannot be greater than {1} characters")]
        [Display(Name = "Account Number")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        [RegularExpression(@"^[0-9]{1,50}$", ErrorMessage = "Only numbers are allowed")]
        [Remote("Exists", "Accounts", HttpMethod = "POST", AdditionalFields = "code", ErrorMessage = "{0} number already exists")]
        public string account_number { get; set; }
        public List<TransactionViewModel>? transactions { get; set; }

        [Display(Name = "Status")]
        public bool? is_active { get; set; }

        [Display(Name = "Balance")]
        public decimal? outstanding_balance { get; set; }

        public string? balanceColor => GetBalanceColor();
        public string? status => GetStatus();
        public string? statusColor => GetStatusColor();
        public string? balance => GetAccountOutstandingBalanceString();
        private string GetBalanceColor()
        {
            if (outstanding_balance > 0)
            {
                return "green";
            }
            else if (outstanding_balance < 0)
            {
                return "red";
            }
            else
            {
                return "gray";
            }
        }
        private string GetStatusColor()
        {
            if (is_active == true)
            {
                return "green";
            }
            else
            {
                return "red";
            }
        }
        private string GetStatus()
        {
            if (is_active == true)
            {
                return "Open";
            }
            else
            {
                return "Closed";
            }
        }
        private string GetAccountOutstandingBalanceString()
        {
            return Convert.ToDecimal(outstanding_balance).ToString("0.00").Replace(',', '.');
        }
    }
}
