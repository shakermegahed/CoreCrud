using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class UpdateWebSiteTopicViewModel
    {
        public Guid TopicId { get; set; }
        public Guid WebSiteId { get; set; }
        public string TopicTitle { get; set; }
        public string TopicContent { get; set; }
        public string ImageFile { get; set; }
        public string TopicTag { get; set; }
        public DateTime? TopicDate { get; set; }
    }
}
