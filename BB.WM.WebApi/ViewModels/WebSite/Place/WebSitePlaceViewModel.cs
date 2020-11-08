using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class WebSitePlaceViewModel
    {
        public Guid WebSitePlaceId { get; set; }
        public Guid WebSiteId { get; set; }
        public string WebSiteDomain { get; set; }
        public Guid PlaceId { get; set; }
        public string PlaceName { get; set; }
        public Guid DestinationId { get; set; }
        public string DestinationName { get; set; }
        public Guid CountryId { get; set; }
        public string CountryName { get; set; }
        public string Description { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime LastModifiedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public Guid LastModifiedBy { get; set; }
        public bool IsDeleted { get; set; }
        public string[] PlaceImages { get; set; }
        public Guid? ParentId { get; set; }

    }
}
