using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class WebSiteDestinationDetailsViewModel
    {
        public Guid WebSiteDestinationId { get; set; }
        public Guid WebSiteId { get; set; }
        public string WebSiteDomain { get; set; }
        public Guid DestinationId { get; set; }
        public string DestinationName { get; set; }
        public Guid CountryId { get; set; }
        public string CountryName { get; set; }
        public string[] DestinationImages { get; set; }
        public string Description { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime LastModifiedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public Guid LastModifiedBy { get; set; }
        public bool IsDeleted { get; set; }
        public Guid? ParentId { get; set; }
        public int DestinationLevel { get; set; }
        public string ParentName { get; set; }
        public IList<WebSitePlaceViewModel> WebSitePlaces { get; set; } = new List<WebSitePlaceViewModel>();
        public IList<WebSiteRestaurantViewModel> WebSiteRestaurants { get; set; } = new List<WebSiteRestaurantViewModel>();
        public IList<WebSiteHotelViewModel> WebSiteHotels { get; set; } = new List<WebSiteHotelViewModel>();
        public IList<EntertainmentViewModel> Entertainments { get; set; } = new List<EntertainmentViewModel>();
        public IList<WebSiteDestinationsDetailsViewModel> WebSiteDestinations { get; set; } = new List<WebSiteDestinationsDetailsViewModel>();
    }
}
