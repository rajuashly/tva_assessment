using System.Text.RegularExpressions;

namespace BankingAdminApp.Helpers
{
    public class RegexChecker
    {
        public bool IsRealNumberMaxLengthFifty(string number)
        {
            Regex regex = new Regex(@"[0-9]{1,50}$");
            if (regex.IsMatch(number))
            {
                return true;
            }
            else return false;
        }

        public bool IsPositiveNegativeDecimalNumber(string value)
        {
            Regex regex = new Regex(@"^-?[0-9]{1,18}(\.[0-9]{1,2})?$");
            if (regex.IsMatch(value))
            {
                return true;
            }
            else return false;
        }
    }
}
