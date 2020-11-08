using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class UpdateDestinationViewModel
    {
        public Guid DestinationId { get; set; }
        public Guid CountryId { get; set; }
        public string Name { get; set; }
        public bool IsApproved { get; set; }
    }
}
