using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using static BB.CRM.Core.Constants;

namespace BB.CRM.WebApi.ViewModels
{
    public class WebSiteProjectViewModel
    {
        public Guid ProjectId { get; set; }
        public string ProjectTitle { get; set; }
        public string CoverImage { get; set; }
        public string[] Images { get; set; }
        public string ProjectTag { get; set; }
        public int ProjectOrder { get; set; }
        public string ProjectLink { get; set; }
        public Guid? WebsiteId { get; set; }
        public string Description { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime LastModifiedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public Guid LastModifiedBy { get; set; }
        public bool IsDeleted { get; set; }
    }
}
