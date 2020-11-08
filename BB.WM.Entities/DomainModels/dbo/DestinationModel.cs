using System;
using System.Collections.Generic;
using System.Text;

namespace dryve.Entities.DomainModels
{
    public class DestinationModel : BaseModel
    {
        public Guid DestinationId { get; set; }
        public string Name { get; set; }
      
        public bool IsDeleted { get; set; }
    }
}
