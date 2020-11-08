using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class UpdateWebSiteHotelViewModel
    {
        public Guid WebSiteHotelId { get; set; }
        public Guid HotelId { get; set; }
        public string[] HotelImages { get; set; }
        public string Description { get; set; }
        public string MapURL { get; set; }
        public string HotelLogo { get; set; }
        public float Stars { get; set; }
        public string WebsiteLink { get; set; }
        public Guid? ParentId { get; set; }

    }
}
