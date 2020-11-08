using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using static BB.CRM.Core.Constants;

namespace BB.CRM.WebApi.ViewModels
{
    public class CreateEventViewModel
    {
        public string EventTitle { get; set; }
        public string[] Images { get; set; }
        public string CoverImage { get; set; }
        public DateTime? EventDate { get; set; }
        public string EventTag { get; set; }
        public bool IsMain { get; set; }
        public string Description { get; set; }
    }
}
