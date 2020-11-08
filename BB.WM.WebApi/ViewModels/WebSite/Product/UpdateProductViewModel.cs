using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class UpdateProductViewModel
    {
        public Guid ProductId { get; set; }
        public string ProductTitle { get; set; }
        public string Description { get; set; }
        public Guid CategoryId { get; set; }
        public string[] Images { get; set; }
    }
}
