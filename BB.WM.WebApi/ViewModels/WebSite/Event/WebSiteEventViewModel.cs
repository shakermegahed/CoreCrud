using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using static BB.CRM.Core.Constants;

namespace BB.CRM.WebApi.ViewModels
{
    public class WebSiteEventViewModel
    {
        public Guid EventId { get; set; }
        public string EventTitle { get; set; }
        public string CoverImage { get; set; }
        public string[] Images { get; set; }
        public DateTime? EventDate { get; set; }
        public string EventTag { get; set; }
        public bool IsMain { get; set; }
        public Guid? WebsiteId { get; set; }
        public string Description { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime LastModifiedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public Guid LastModifiedBy { get; set; }
        public bool IsDeleted { get; set; }
    }
}
