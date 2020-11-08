
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using static BB.CRM.Core.Constants;

namespace BB.CRM.WebApi.ViewModels
{
    public class UpdateWebSiteViewModel
    {
        public Guid? WebSiteId { get; set; }
        public string WebSiteDomain { get; set; }
        public WebSiteStaus Status { get; set; }
        public string WebSiteLogo { get; set; }
        public IList<WebSiteFeatureViewmodel> WebSiteFeatures { get; set; }

    }
}
