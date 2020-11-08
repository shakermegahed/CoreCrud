using dryve.Entities.DatabaseEntities;
using dryve.Entities.DomainModels;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace dryve.Repository.Interfaces
{
    public interface IDestinationRepository
    {
        Task<Boolean> Add(DestinationEntity entity);
        Task<bool> UpdateIsDeleted(Guid DestinationId, Boolean isDeleted);
        Task<IEnumerable<DestinationModel>> GetAll();
    }
}
