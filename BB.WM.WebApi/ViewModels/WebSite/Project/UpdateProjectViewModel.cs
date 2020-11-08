using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using static BB.CRM.Core.Constants;

namespace BB.CRM.WebApi.ViewModels
{
    public class UpdateProjectViewModel
    {
        public Guid ProjectId { get; set; }
        public string ProjectTitle { get; set; }
        public string[] Images { get; set; }
        public string CoverImage { get; set; }
        public int ProjectOrder { get; set; }
        public string ProjectLink { get; set; }
        public string ProjectTag { get; set; }
        public string Description { get; set; }
    }
}
