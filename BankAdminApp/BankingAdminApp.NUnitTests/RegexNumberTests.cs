using BankingAdminApp.Helpers;

namespace BankingAdminApp.UnitTests
{
    [TestFixture]
    public class RegexNumberTests
    {
        [SetUp]
        public void Setup()
        {
        }

        [Test()]
        public void CheckIfRealNumberMaxLengthFiftyTest_CheckValid()
        {
            RegexChecker regexChecker = new RegexChecker();
            var expected = regexChecker.IsRealNumberMaxLengthFifty("12345678945612345687945612021458641235478");
            Assert.AreEqual(expected, true);
        }

        [Ignore("Ignore")]
        public void CheckIfRealNumberMaxLengthFiftyTest_CheckNotValid()
        {
            RegexChecker regexChecker = new RegexChecker();
            var expected = regexChecker.IsRealNumberMaxLengthFifty("12.00");
            Assert.AreEqual(expected, false);
        }

        [Test()]
        public void CheckPositiveNegativeDecimalNumberTest_CheckValid()
        {
            RegexChecker regexChecker = new RegexChecker();
            var expected = regexChecker.IsPositiveNegativeDecimalNumber("-12.2");
            Assert.AreEqual(expected, true);
        }

        [Ignore("Ignore")]
        public void CheckPositiveNegativeDecimalNumberTest_CheckNotValid()
        {
            RegexChecker regexChecker = new RegexChecker();
            var expected = regexChecker.IsPositiveNegativeDecimalNumber("12");
            Assert.AreEqual(expected, false);
        }
    }
}