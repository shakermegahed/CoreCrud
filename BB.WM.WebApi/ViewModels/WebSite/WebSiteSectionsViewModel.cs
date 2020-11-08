using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class WebSiteSectionsViewModel
    {
        public string Title { get; set; }
        public string ImageFile { get; set; }
        public string Description { get; set; }
        public int Order { get; set; }
        public string Link { get; set; }
        public Boolean Saved { get; set; }
    }
}
