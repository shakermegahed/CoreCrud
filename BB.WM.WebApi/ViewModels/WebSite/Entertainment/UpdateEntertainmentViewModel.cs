using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class UpdateEntertainmentViewModel
    {
        public Guid EntertainmentId { get; set; }
        public string Name { get; set; }
        public string Location { get; set; }
        public string Description { get; set; }
        public Guid WebSiteDestinationId { get; set; }
        public string[] Images { get; set; }
    }
}
