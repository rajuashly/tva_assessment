using BankingAdminApp.DataLayer.EntityClasses;
using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;

namespace BankingAdminApp.ViewModels
{
    public class PersonViewModel
    {
        public int code { get; set; }

        //[Required(ErrorMessage = "{0} is required")]
        [MaxLength(50, ErrorMessage = "{0} cannot be greater than {1} characters")]
        [Display(Name = "First Name(s)")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string? name { get; set; }

        //[Required(ErrorMessage = "{0} is required")]
        [MaxLength(50, ErrorMessage = "{0} cannot be greater than {1} characters")]
        [Display(Name = "Surname")]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string? surname { get; set; }


        [Required(ErrorMessage = "{0} is required")]
        [MaxLength(50, ErrorMessage = "{0} cannot be greater than {1} characters")]
        [Display(Name = "ID Number")]
        [Remote("Exists", "Persons", HttpMethod = "POST", AdditionalFields = "code", ErrorMessage = "Id number already exists")]
        public virtual string id_number { get; set; }

        public List<Accounts>? accounts { get; set; }        

    }
}
