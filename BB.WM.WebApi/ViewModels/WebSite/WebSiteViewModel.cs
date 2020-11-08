
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using static BB.CRM.Core.Constants;

namespace BB.CRM.WebApi.ViewModels
{
    public class WebSiteViewModel
    {
        public Guid WebSiteId { get; set; }
        public string WebSiteDomain { get; set; }
        public string WebSiteLogo { get; set; }
        public string AccountName { get; set; }
        public Guid AccountId { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime LastModifiedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public Guid LastModifiedBy { get; set; }
        public bool IsDeleted { get; set; }
        public string AboutUs { get; set; }
        public WebSiteStaus Status { get; set; }
        public IList<WebSiteSectionsViewModel> WebSiteSlider { get; set; } = new List<WebSiteSectionsViewModel>();
        public IList<WebSiteAboutListViewModel> AboutList { get; set; } = new List<WebSiteAboutListViewModel>();
        public IList<WebSiteSectionsViewModel> WebsiteClients { get; set; } = new List<WebSiteSectionsViewModel>();
        public IList<WebSiteSectionsViewModel> WebsiteTeam { get; set; } = new List<WebSiteSectionsViewModel>();
        public IList<WebSiteSectionsViewModel> WebsiteCareers { get; set; } = new List<WebSiteSectionsViewModel>();
        public IList<WebSiteTopicViewModel> WebSiteServices { get; set; } = new List<WebSiteTopicViewModel>();
        public IList<WebSiteSocialMediaViewModel> WebSiteSocialMedia { get; set; } = new List<WebSiteSocialMediaViewModel>();
        public IList<ContactViewModel> ContactUS { get; set; } = new List<ContactViewModel>();
        public IList<WebSiteFeatureViewmodel> WebSiteFeatures = new List<WebSiteFeatureViewmodel>();

    }
}
