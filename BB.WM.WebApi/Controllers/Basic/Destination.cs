using AutoMapper;
using BB.CRM.Domain.Interfaces;
using BB.CRM.Entities.Common;
using BB.CRM.Entities.DomainModels;
using BB.CRM.WebApi.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.Controllers.Basic
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    [Authorize]
    public class Destination : Controller
    {
        #region[vars]
        private readonly IMapper _mapper;
        private readonly IDestinationManager _destinationManager;
        #endregion

        #region[ctor]
        public Destination(IMapper mapper, IDestinationManager destinationManager)
        {
            _mapper = mapper;
            _destinationManager = destinationManager;
        }
        #endregion

        #region[action]

        [HttpPost]
        public async Task<CommandResult<Guid>> CreateDestination([FromBody] CreateDestinationViewModel viewModel)
        {
            var createDestinationModel = _mapper.Map<DestinationModel>(viewModel);
            var result = await _destinationManager.CreateDestination(createDestinationModel);
            return result;
        }



        [HttpDelete("delete/{DestinationId}")]
        public async Task<CommandResult<Boolean>> Delete(Guid DestinationId)
        {

            return await _destinationManager.DeleteDestination(DestinationId);
        }

        [HttpGet("restore/{DestinationId}")]
        public async Task<CommandResult<Boolean>> Restore(Guid DestinationId)
        {

            return await _destinationManager.RestoreDestination(DestinationId);
        }


        [HttpGet]
        public async Task<QueryMultipleResult<IEnumerable<DestinationViewModel>, DestinationViewModel>> GetAll()
        {
            var cities = await _destinationManager.GetAll();
            return _mapper.Map<QueryMultipleResult<IEnumerable<DestinationViewModel>, DestinationViewModel>>(cities);
        }


        #endregion
    }
}
