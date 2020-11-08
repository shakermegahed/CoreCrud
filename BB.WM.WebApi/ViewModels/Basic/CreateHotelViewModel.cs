using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class CreateHotelViewModel
    {
        public Guid? HotelId { get; set; }
        public string Name { get; set; }
        public Guid DestinationId { get; set; }
        public bool IsApproved { get; set; }
    }
}
