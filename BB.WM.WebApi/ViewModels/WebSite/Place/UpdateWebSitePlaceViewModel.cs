using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class UpdateWebSitePlaceViewModel
    {
        public Guid WebSitePlaceId { get; set; }
        public Guid PlaceId { get; set; }
        public string[] PlaceImages { get; set; }
        public string Description { get; set; }
        public Guid? ParentId { get; set; }
    }
}
