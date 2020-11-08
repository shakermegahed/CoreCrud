using System;
using System.Collections.Generic;
using System.Text;

namespace dryve.Entities.Common
{
    public class CommandModel
    {
        public CommandModel()
        {
        }

        public Guid EntityId { get; set; }
        public Guid LastModifiedBy { get; set; }
    }
}
