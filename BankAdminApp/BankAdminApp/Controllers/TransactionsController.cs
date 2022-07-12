using AutoMapper;
using BankingAdminApp.DataLayer.EntityClasses;
using BankingAdminApp.Repository.Repositories;
using BankingAdminApp.ViewModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BankingAdminApp.Controllers
{
    public class TransactionsController : Controller
    {
        private readonly ITransactionsRepository<Transactions> _transactionRepository;
        private readonly IAccountsRepository<Accounts> _accountsRepository;
        private readonly IPersonsRepository<Persons> _personsRepository;
        private Mapper _mapper;
        public TransactionsController(IAccountsRepository<Accounts> accountsRepository, ITransactionsRepository<Transactions> transactionRepository, IPersonsRepository<Persons> personsRepository)
        {
            _accountsRepository = accountsRepository;
            _transactionRepository = transactionRepository;
            _personsRepository = personsRepository;
            var config = new MapperConfiguration(cfg => cfg.CreateMap<Transactions, TransactionViewModel>());
            _mapper = new Mapper(config);
        }
        [HttpGet]
        public ActionResult Details(int? code)
        {
            if (code == null)
            {
                return NotFound();
            }
            TransactionViewModel vm = new TransactionViewModel();
            var transacation = _transactionRepository.Get(Convert.ToInt32(code));
            if (transacation == null)
            {
                return NotFound();
            }
            else
            {
                vm = _mapper.Map<TransactionViewModel>(transacation);
                if (transacation.Account != null && transacation.Account.code > 0)
                {
                    vm.account_number = transacation.Account.account_number;
                    vm.account_code = transacation.Account.code;
                    vm.transaction_date = transacation.transaction_date.ToString("dd-MMM-yyy");
                    vm.amount = transacation.amount.ToString("0.00").Replace(',','.');
                    var person = _personsRepository.Get(transacation.Account.person_code);
                    if (person != null && person.code > 0)
                    {
                        vm.id_number = person.id_number;
                    }
                }
            }
            return View(vm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Details(int code, TransactionViewModel vm)
        {
            if (code != vm.code)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    Transactions transaction = new Transactions()
                    {
                        transaction_date = Convert.ToDateTime(vm.transaction_date),
                        amount = Convert.ToDecimal(vm.amount.Replace('.', ',')),
                        description = vm.description,
                        code = code,
                        account_code = vm.account_code
                    };

                    var updated = _transactionRepository.Update(transaction);
                    if (updated)
                    {
                        TempData["UpdateTransactionSuccess"] = $"Transaction was successfully updated.";

                    }
                    else
                    {
                        ModelState.AddModelError("", "Failed to update transaction, please try again.");
                    }
                }
                catch (DbUpdateConcurrencyException)
                {
                    ModelState.AddModelError("", "Failed to update transaction, please try again.");
                    throw;
                }
            }

            return View(vm);
        }


        [HttpGet]
        public ActionResult Create(int code)
        {
            TransactionViewModel vm = new TransactionViewModel();
            vm.account_code = code;
            var account = _accountsRepository.Get(Convert.ToInt32(code));
            if (account == null)
            {
                return NotFound();
            }
            else
            {
                if (account != null && account.code > 0)
                {
                    vm.account_number = account.account_number;
                    if (account.Person != null && account.Person.code > 0)
                    {
                        vm.id_number = account.Person.id_number;
                    }
                }
            }

            return View(vm);
        }

        // POST: AccountsController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind("description, amount, transaction_date, account_number, account_code, id_number")] TransactionViewModel vm)
        {
            if (ModelState.IsValid)
            {
                Transactions transaction = new Transactions();
                transaction.description = vm.description;
                transaction.amount = Convert.ToDecimal(vm.amount.Replace('.', ','));
                transaction.account_code = vm.account_code;
                transaction.transaction_date = Convert.ToDateTime(vm.transaction_date);
                var Id = _transactionRepository.Create(transaction);
                if (Id > 0)
                {
                    TempData["TransactionCreateSuccess"] = $"Transaction was successfully added.";
                    return RedirectToAction("Details", "Accounts", new { code = vm.account_code });
                }
                else
                {
                    ModelState.AddModelError("", "Failed to create transaction, please try again.");
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
