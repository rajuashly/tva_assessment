using AutoMapper;
using BankingAdminApp.DataLayer.EntityClasses;
using BankingAdminApp.Helpers;
using BankingAdminApp.Helpers.Controllers;
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
        Microsoft.Extensions.Options.IOptions<CryptoEngine.Secrets> _options;
        private Mapper _mapper;
        public TransactionsController(IAccountsRepository<Accounts> accountsRepository, ITransactionsRepository<Transactions> transactionRepository, IPersonsRepository<Persons> personsRepository, Microsoft.Extensions.Options.IOptions<CryptoEngine.Secrets> options)
        {
            _accountsRepository = accountsRepository;
            _transactionRepository = transactionRepository;
            _personsRepository = personsRepository;
            var config = new MapperConfiguration(cfg => cfg.CreateMap<Transactions, TransactionViewModel>());
            _options = options;
            _mapper = new Mapper(config);
        }
        [HttpGet]
        [EncryptedParameters("secret")]
        public ActionResult Details(int? code)
        {
            if (code != null)
            {
                var transacation = _transactionRepository.Get(Convert.ToInt32(code));
                if (transacation != null && transacation.code > 0)
                {
                    TransactionViewModel vm = new TransactionViewModel();
                    vm = _mapper.Map<TransactionViewModel>(transacation);
                    if (transacation.Account != null && transacation.Account.code > 0)
                    {
                        vm.account_number = transacation.Account.account_number;
                        vm.account_code = transacation.Account.code;
                        vm.transaction_date = transacation.transaction_date.ToString("dd-MMM-yyy");
                        vm.amount = transacation.amount.ToString("0.00").Replace(',', '.');
                        var person = _personsRepository.Get(transacation.Account.person_code);
                        if (person != null && person.code > 0)
                        {
                            vm.id_number = person.id_number;
                        }
                        return View(vm);
                    }
                }
            }
            return NotFound();
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
        [EncryptedParameters("secret")]
        public ActionResult Create(int? code)
        {
            if (code != null)
            {
                TransactionViewModel vm = new TransactionViewModel();
                vm.account_code = Convert.ToInt32(code);
                var account = _accountsRepository.Get(vm.account_code);

                if (account != null && account.code > 0)
                {
                    vm.account_number = account.account_number;
                    if (account.Person != null && account.Person.code > 0)
                    {
                        vm.id_number = account.Person.id_number;
                    }
                }
                return View(vm);
            }
            return NotFound();
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
                    var values = $"account_code={vm.account_code}";
                    var secret = CryptoEngine.Encrypt(values, _options.Value.Key);
                    return RedirectToAction("Details", "Accounts", new { secret = secret });
                }
                else
                {
                    ModelState.AddModelError("", "Failed to create transaction, please try again.");
                }
            }

            return View(vm);
        }


    }
}
