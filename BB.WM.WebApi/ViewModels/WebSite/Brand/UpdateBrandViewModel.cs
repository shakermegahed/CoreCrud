using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class UpdateBrandViewModel
    {
        public Guid BrandId { get; set; }
        public string BrandName { get; set; }
        public string ImageFile { get; set; }
        public int BrandOrder { get; set; }
        public string BrandLink { get; set; }
        public Guid WebsiteId { get; set; }
        public string Description { get; set; }
    }
}
