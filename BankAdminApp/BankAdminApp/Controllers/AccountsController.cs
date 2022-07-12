using BankingAdminApp.DataLayer.EntityClasses;
using BankingAdminApp.Repository.Repositories;
using BankingAdminApp.ViewModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BankingAdminApp.Controllers
{
    public class AccountsController : Controller
    {
        private readonly IPersonsRepository<Persons> _personsRepository;
        private readonly IAccountsRepository<Accounts> _accountsRepository;
        private readonly ITransactionsRepository<Transactions> _transactionRepository;
        public AccountsController(IAccountsRepository<Accounts> accountsRepository, IPersonsRepository<Persons> personsRepository, ITransactionsRepository<Transactions> transactionRepository)
        {
            _accountsRepository = accountsRepository;
            _personsRepository = personsRepository;
            _transactionRepository = transactionRepository;
        }
        [HttpGet]
        public ActionResult Details(int? code)
        {
            if (code == null)
            {
                return NotFound();
            }
            AccountViewModel vm = new AccountViewModel();
            var account = _accountsRepository.Get(Convert.ToInt32(code));
            if (account == null)
            {
                return NotFound();
            }
            else
            {
                vm.code = account.code;
                vm.account_number = account.account_number;
                vm.is_active = account.is_active;
                if (account.Person != null && account.Person.code > 0)
                {
                    vm.id_number = account.Person.id_number;
                    vm.person_code = account.Person.code;
                }
                vm.transactions = account.Transactions.ToList();

            }

            return View(vm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Details(int code, [Bind("account_number, code, id_number, person_code")] AccountViewModel vm)
        {
            if (code != vm.code)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    Accounts account = new Accounts()
                    {
                        account_number = vm.account_number,
                        code = vm.code
                    };
                    var updated = _accountsRepository.Update(account);
                    if (updated)
                    {
                        TempData["UpdateAccountSuccess"] = $"Account was successfully updated.";

                    }
                    else
                    {
                        ModelState.AddModelError("", "Failed to update account, please try again.");
                    }
                }
                catch (DbUpdateConcurrencyException)
                {
                    ModelState.AddModelError("", "Failed to update account, please try again.");
                    throw;
                }
            }
            vm.transactions = _transactionRepository.GetByAccountCode(vm.code);
            return View(vm);
        }

        // GET: AccountsController/Create
        public ActionResult Create(int person_code, string id_number)
        {
            AccountViewModel vm = new AccountViewModel();
            vm.person_code = person_code;
            vm.id_number = id_number;
            return View(vm);
        }

        // POST: AccountsController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind("person_code, account_number")] AccountViewModel vm)
        {
            if (ModelState.IsValid)
            {
                var Id = _accountsRepository.Create(new Accounts { account_number = vm.account_number, person_code = vm.person_code });
                if (Id > 0)
                {
                    TempData["AccountCreateSuccess"] = $"Account Number {vm.account_number} was successfully added.";
                    return RedirectToAction("Details", "Persons", new { code = vm.person_code });
                }
                else
                {
                    ModelState.AddModelError("", "Failed to create account, please try again.");
                }
            }
            return View(vm);
        }

        [HttpPost]
        public JsonResult Exists(string account_number, int code)
        {
            return Json(!_accountsRepository.Exists(account_number, code));
        }


    }
}
