using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class FormViewModel
    {
        public Guid FormId { get; set; }
        public string WebSiteDomain { get; set; }
        public string FormType { get; set; }
        public string FormContent { get; set; }
        public DateTime CreationDate { get; set; }
    }
}
