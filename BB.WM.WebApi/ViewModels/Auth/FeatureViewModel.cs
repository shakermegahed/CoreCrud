using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using static BB.CRM.Core.Constants;

namespace BB.CRM.WebApi.ViewModels
{
    public class FeatureViewModel
    {
        public Guid FeatureId { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public FeatureStatus Status { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime LastModifiedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public Guid LastModifiedBy { get; set; }
        public bool IsDeleted { get; set; }
    }
}
