﻿using AutoMapper;
using BankingAdminApp.DataLayer.EntityClasses;
using BankingAdminApp.Helpers.Controllers;
using BankingAdminApp.Repository;
using BankingAdminApp.Repository.Repositories;
using BankingAdminApp.ViewModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BankingAdminApp.Controllers
{
    public class PersonsController : Controller
    {
        private readonly IPersonsRepository<Persons> _personsRepository;
        private readonly IAccountsRepository<Accounts> _accountsRepository;
        private Mapper _mapper;
        public PersonsController(IPersonsRepository<Persons> personsRepository, IAccountsRepository<Accounts> accountsRepository)
        {
            _personsRepository = personsRepository;
            _accountsRepository = accountsRepository;
            var config = new MapperConfiguration(cfg => cfg.CreateMap<Persons, PersonViewModel>());
            _mapper = new Mapper(config);
        }


        [HttpGet]
        public ActionResult Index()
        {
            return View(_personsRepository.GetAll());
        }


        //[Route("Details"), HttpGet]
        //[EncryptedParameters("secret")]
        public ActionResult Details(int? code)
        {
            if (code == null)
            {
                return NotFound();
            }
            PersonViewModel vm = new PersonViewModel();
            var person = _personsRepository.Get(Convert.ToInt32(code));
            if (person == null)
            {
                return NotFound();
            }
            else
            {
                vm = _mapper.Map<PersonViewModel>(person);
                vm.accounts = _accountsRepository.GetByPersonCode(person.code);
            }

            return View(vm);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Details(int code, [Bind("name, surname, id_number, code")] Persons person)
        {
            if (code != person.code)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    var updated = _personsRepository.Update(person);
                    if (updated)
                    {
                        TempData["UpdatePersonSuccess"] = $"Person was successfully updated.";

                    }
                    else
                    {
                        ModelState.AddModelError("", "Failed to update person, please try again.");
                    }
                }
                catch (DbUpdateConcurrencyException)
                {
                    ModelState.AddModelError("", "Failed to update person, please try again.");
                    throw;
                }
            }

            PersonViewModel vm = _mapper.Map<PersonViewModel>(person);
            vm.accounts = _accountsRepository.GetByPersonCode(person.code);
            return View(vm);
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind("name,surname,id_number")] Persons person)
        {
            if (ModelState.IsValid)
            {
                var Id = _personsRepository.Create(person);
                if (Id > 0)
                {
                    TempData["CreatePersonSuccess"] = $"{person.name} was successfully added.";
                    return RedirectToAction(nameof(Index));
                }
                else
                {
                    ModelState.AddModelError("", "Failed to create person, please try again.");
                }
            }
            return View(person);
        }
        public ActionResult Delete(int id)
        {
            var deleted = _personsRepository.Delete(id);
            if (deleted)
            {
                TempData["DeletePersonSuccess"] = $"Person was successfully deleted.";
                return RedirectToAction(nameof(Index));
            }
            else
            {
                TempData["DeletePersonFailure"] = $"Failed to delete person, please try again.";
            }

            return RedirectToAction(nameof(Index));
        }

        [HttpPost]
        public JsonResult Exists(string id_number, int code)
        {
            return Json(!_personsRepository.Exists(id_number, code));
        }


        public ActionResult ReOpenAccount(int account_code, int person_code)
        {
            var updated = _accountsRepository.SetActiveStatus(account_code, true);
            if (updated)
            {
                TempData["ReOpenAccountSuccess"] = $"Account was successfully re-opened.";
            }
            else
            {
                TempData["ReOpenAccountFailure"] = $"Failed to re-open account, please try again.";
            }

            return RedirectToAction("Details", "Persons", new { code = person_code });
        }

        public ActionResult CloseAccount(int account_code, int person_code)
        {
            var updated = _accountsRepository.SetActiveStatus(account_code, false);
            if (updated)
            {
                TempData["CloseAccountSuccess"] = $"Account was successfully closed.";
            }
            else
            {
                TempData["CloseAccountFailure"] = $"Failed to close account, please try again.";
            }

            return RedirectToAction("Details", "Persons", new { code = person_code });
        }
    }
}