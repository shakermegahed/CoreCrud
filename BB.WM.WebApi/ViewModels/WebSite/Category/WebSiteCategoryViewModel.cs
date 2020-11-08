using BB.CRM.WebApi.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class WebSiteCategoryViewModel
    {
        public Guid CategoryId { get; set; }
        public Guid WebSiteId { get; set; }
        public Guid? ParentId { get; set; }
        public string ParentName { get; set; }
        public string Title { get; set; }
        public string ImageFile { get; set; }
        public int CategoryOrder { get; set; }

        public string Description { get; set; }
        public int CategoryLevel { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime LastModifiedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public Guid LastModifiedBy { get; set; }
        public bool IsDeleted { get; set; }
        public IList<WebSiteCategoryViewModel> SubCategories { get; set; } = new List<WebSiteCategoryViewModel>();
        public IList<FileUploadViewModel> Files { get; set; } = new List<FileUploadViewModel>();
    }
}
