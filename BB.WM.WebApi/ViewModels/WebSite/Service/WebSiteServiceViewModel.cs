using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class WebSiteServiceViewModel
    {
        public Guid ServiceId { get; set; }
        public Guid WebSiteId { get; set; }
        public Guid? ParentId { get; set; }
        public string ParentName { get; set; }
        public string Title { get; set; }
        public string ImageFile { get; set; }
        public int ServiceOrder { get; set; }
        public string Description { get; set; }
        public int ServiceLevel { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime LastModifiedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public Guid LastModifiedBy { get; set; }
        public bool IsDeleted { get; set; }
        public IList<WebSiteServiceViewModel> SubServices { get; set; } = new List<WebSiteServiceViewModel>();
    }
}
