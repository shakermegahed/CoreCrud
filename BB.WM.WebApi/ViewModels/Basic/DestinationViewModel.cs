using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class DestinationViewModel
    {
        public Guid DestinationId { get; set; }
        public Guid CountryId { get; set; }
        public string CountryName { get; set; }
        public string Name { get; set; }
        public bool IsApproved { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime LastModifiedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public Guid LastModifiedBy { get; set; }
        public bool IsDeleted { get; set; }
    }
}
