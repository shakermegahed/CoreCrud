﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.ViewModels
{
    public class UpdatePlaceViewModel
    {
        public Guid PlaceId { get; set; }
        public Guid DestinationId { get; set; }
        public string Name { get; set; }
        public bool IsApproved { get; set; }
    }
}
