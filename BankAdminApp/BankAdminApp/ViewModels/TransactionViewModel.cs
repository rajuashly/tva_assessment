using System.ComponentModel.DataAnnotations;

namespace BankingAdminApp.ViewModels
{
    public class TransactionViewModel
    {
        public int code { get; set; }

        public int account_code { get; set; }

        [Required(ErrorMessage = "{0} is required")]
        [Display(Name = "Transaction Date")]
        public string transaction_date { get; set; }

        [Display(Name = "Capture Date")]
        public DateTime? capture_date { get; set; }


        [Required(ErrorMessage = "{0} is required")]
        [Display(Name = "Amount")]
        [RegularExpression(@"^-?[0-9]{1,18}(\.[0-9]{1,2})?$", ErrorMessage = "Enter a +ve or -ve value, values of of max 2 decimal places area allowed.")]
        public string amount { get; set; }

        [Required(ErrorMessage = "{0} is required")]
        [MaxLength(100, ErrorMessage = "{0} cannot be greater than {1} characters")]
        [Display(Name = "Description")]
        public string description { get; set; }

        [Display(Name = "Account Number")]
        public string? account_number { get; set; }

        [Display(Name = "Person ID Number")]
        public string? id_number { get; set; }
        public string? amountColor => GetColor();
        public string? formattedAmount => GetColor();
        private string GetColor()
        {
            decimal decimalAmount = Convert.ToDecimal(amount.Replace(".",","));
            if (decimalAmount > 0)
            {
                return "green";
            }
            else if (decimalAmount < 0)
            {
                return "red";
            }
            else
            {
                return "gray";
            }
        }      

    }
}
