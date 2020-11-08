using AutoMapper;
using dryve.Domain.Interfaces;
using dryve.Entities.Common;
using dryve.Entities.DatabaseEntities;
using dryve.Entities.DomainModels;
using dryve.Repository.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace dryve.Domain.Services
{
    public class DestinationManager : IDestinationManager
    {
        #region[vars]
        private readonly IDestinationRepository _destinationRepository;
        private readonly IMapper _mapper;

        #endregion

        #region[ctor]
        public DestinationManager(IDestinationRepository destinationRepository, IMapper mapper)
        {
            _destinationRepository = destinationRepository;
            _mapper = mapper;
        }
        #endregion

        #region[action]
        public async Task<CommandResult<Guid>> CreateDestination(DestinationModel model)
        {
            try
            {
                if (model.DestinationId == null || model.DestinationId == Guid.Empty)
                    model.DestinationId = Guid.NewGuid();

                var destination = _mapper.Map<DestinationModel, DestinationEntity>(model);
                await _destinationRepository.Add(destination);

                return new CommandResult<Guid>(destination.DestinationId);
            }
            catch (Exception exception)
            {
                return new CommandResult<Guid>(exception.Message);
            }
        }


        public async Task<CommandResult<bool>> DeleteDestination(Guid destinationId)
        {
            try
            {
                if (destinationId == Guid.Empty || destinationId == null)
                {
                    return new CommandResult<Boolean>("Invalid destination Id");
                }
                else
                {
                    await _destinationRepository.UpdateIsDeleted(destinationId, isDeleted: true);
                    return new CommandResult<Boolean>(true);
                }
            }
            catch (Exception exception)
            {
                return new CommandResult<Boolean>(exception.Message);
            }
        }

        public async Task<CommandResult<bool>> RestoreDestination(Guid destinationId)
        {
            try
            {
                if (destinationId == Guid.Empty || destinationId == null)
                {
                    return new CommandResult<Boolean>("Invalid destination Id");
                }
                else
                {
                    await _destinationRepository.UpdateIsDeleted(destinationId, isDeleted: false);
                    return new CommandResult<Boolean>(true);
                }
            }
            catch (Exception exception)
            {
                return new CommandResult<Boolean>(exception.Message);
            }
        }

        public async Task<QueryMultipleResult<IEnumerable<DestinationModel>, DestinationModel>> GetAll()
        {
            try
            {
                var destinations = await _destinationRepository.GetAll();
                return new QueryMultipleResult<IEnumerable<DestinationModel>, DestinationModel>(destinations);
            }
            catch (Exception exception)
            {
                return new QueryMultipleResult<IEnumerable<DestinationModel>, DestinationModel>(exception.Message);
            }
        }

        #endregion
    }
}
