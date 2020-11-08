using System;
using System.Collections.Generic;
using System.Text;

namespace dryve.Entities.DatabaseEntities
{
    public class DestinationEntity : BaseEntity
    {
        public Guid DestinationId { get; set; }
        public string Name { get; set; }

    }
}
