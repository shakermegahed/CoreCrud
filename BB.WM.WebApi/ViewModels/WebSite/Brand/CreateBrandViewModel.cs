using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class CreateBrandViewModel
    {
        public string BrandName { get; set; }
        public string ImageFile { get; set; }
        public int BrandOrder { get; set; }
        public string BrandLink { get; set; }
        public string Description { get; set; }
    }
}
