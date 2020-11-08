using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class CreateWebSiteDestinationViewModel
    {
        public Guid? WebSiteDestinationId { get; set; }
        public Guid DestinationId { get; set; }
        public string[] DestinationImages { get; set; }
        public string Description { get; set; }
        public Guid? ParentId { get; set; }
    }
}
