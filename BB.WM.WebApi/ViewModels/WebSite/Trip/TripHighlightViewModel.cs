using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class TripPlaceViewModel
    {
        public Guid? WebSitePlaceId { get; set; }
        public Guid? PlaceId { get; set; }
        public string PlaceName { get; set; }
    }
}
