﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class WebSiteTopicViewModel
    {
        public Guid TopicId { get; set; }
        public Guid WebSiteId { get; set; }
        public string TopicTitle { get; set; }
        public string TopicContent { get; set; }
        public string ImageFile { get; set; }
        public string TopicTag { get; set; }
        public DateTime? TopicDate { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime LastModifiedOn { get; set; }
        public Guid CreatedBy { get; set; }
        public Guid LastModifiedBy { get; set; }
        public bool IsDeleted { get; set; }
    }
}
