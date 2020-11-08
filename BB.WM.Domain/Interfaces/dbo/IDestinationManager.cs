using dryve.Entities.Common;
using dryve.Entities.DomainModels;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace dryve.Domain.Interfaces
{
    public interface IDestinationManager
    {
        Task<CommandResult<Guid>> CreateDestination(DestinationModel model);
        Task<QueryMultipleResult<IEnumerable<DestinationModel>, DestinationModel>> GetAll();
        Task<CommandResult<Boolean>> DeleteDestination(Guid DestinationId);
        Task<CommandResult<Boolean>> RestoreDestination(Guid DestinationId);
    }
}
