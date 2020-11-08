using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using static BB.CRM.Core.Constants;

namespace BB.CRM.WebApi.ViewModels
{
    public class CreateFileUploadViewModel
    {
        public Guid? FileId { get; set; }
        public string FileTitle { get; set; }
        public string FileName { get; set; }
        public float FileSize { get; set; }
        public EntityType EntityType { get; set; }
        public Guid EntityId { get; set; }
    }
}
