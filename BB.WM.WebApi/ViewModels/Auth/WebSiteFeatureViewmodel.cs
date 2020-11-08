using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class WebSiteFeatureViewmodel
    {
        public Guid? WebSiteFeatureId { get; set; }
        public Guid WebSiteId { get; set; }
        public Guid FeatureId { get; set; }
        public string FeatureName { get; set; }
        public string FeatureCode { get; set; }

    }
}
