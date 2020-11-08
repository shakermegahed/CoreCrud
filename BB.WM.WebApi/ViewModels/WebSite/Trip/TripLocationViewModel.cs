using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class TripDestinationViewModel
    {
        public Guid? WebSiteDestinationId { get; set; }
        public Guid? DestinationId { get; set; }
        public string DestinationName { get; set; }
    }
}
