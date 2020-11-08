using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class UpdateWebSiteServiceViewModel
    {
        public Guid ServiceId { get; set; }
        public Guid? ParentId { get; set; }
        public string Title { get; set; }
        public string ImageFile { get; set; }
        public int ServiceOrder { get; set; }

        public string Description { get; set; }
        public int ServiceLevel { get; set; }

    }
}
