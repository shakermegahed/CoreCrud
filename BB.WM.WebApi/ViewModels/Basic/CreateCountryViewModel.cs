using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class CreateCountryViewModel
    {
        public Guid? CountryId { get; set; }
        public string Name { get; set; }
        public string Flag { get; set; }
    }
}
