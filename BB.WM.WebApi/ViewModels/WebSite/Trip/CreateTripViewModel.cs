using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class CreateTripViewModel
    {
        public Guid? TripId { get; set; }
        public string TripTitle { get; set; }
        public TripDurationViewModel Duration { get; set; }
        public string Overview { get; set; }
        public IList<TripPlaceViewModel> TripPlaces { get; set; }
        public IList<TripDestinationViewModel> TripDestinations { get; set; }
        public IList<TripItineraryViewModel> Itinerary { get; set; }
        public decimal? Price { get; set; }
        public string[] Images { get; set; }
        public string PdfName { get; set; }
    }
}
