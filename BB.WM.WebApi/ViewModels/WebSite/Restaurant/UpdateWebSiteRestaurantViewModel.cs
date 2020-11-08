using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class UpdateWebSiteRestaurantViewModel
    {
        public Guid WebSiteRestaurantId { get; set; }
        public Guid RestaurantId { get; set; }
        public string[] RestaurantImages { get; set; }
        public string Description { get; set; }
        public string RestaurantLogo { get; set; }
        public string PriceRange { get; set; }
        public float Rate { get; set; }
        public string WebsiteLink { get; set; }
        public Guid? ParentId { get; set; }
    }
}
