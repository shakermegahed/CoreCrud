using AutoMapper;
using BB.CRM.Domain.Interfaces;
using BB.CRM.Entities.Common;
using BB.CRM.Entities.DomainModels;
using BB.CRM.Identity;
using BB.CRM.WebApi.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.Controllers
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    [Authorize]
    public class Feature : Controller
    {
        #region[vars]
        private readonly IFeatureManager _featureManager;
        private readonly IMapper _mapper;
        #endregion

        #region[ctor]
        public Feature(IFeatureManager featureManager, IMapper mapper)
        {
            _featureManager = featureManager;
            _mapper = mapper;
        }
        #endregion

        #region[actions]
        [HttpPost]
        [Authorize(Roles = AdministratorRoles.Admin_Role)]
        public async Task<CommandResult<Guid>> CreateFeature([FromBody] CreateFeatureViewModel viewModel)
        {
            var createfeatureModel = _mapper.Map<FeatureModel>(viewModel);
            return await _featureManager.CreateFeature(createfeatureModel);
        }

        [HttpPut]
        [Authorize(Roles = AdministratorRoles.Admin_Role)]
        public async Task<CommandResult<Boolean>> UpdateFeature([FromBody] UpdateFeatureViewModel viewModel)
        {
            var updatefeatureModel = _mapper.Map<FeatureModel>(viewModel);
            return await _featureManager.UpdateFeature(updatefeatureModel);
        }


        [HttpDelete("{featureId}")]
        [Authorize(Roles = AdministratorRoles.Admin_Role)]
        public async Task<CommandResult<Boolean>> Delete(Guid featureId)
        {

            return await _featureManager.DeleteFeature(featureId);
        }

        [HttpGet("Restore/{featureId}")]
        [Authorize(Roles = AdministratorRoles.Admin_Role)]
        public async Task<CommandResult<Boolean>> Restore(Guid featureId)
        {
            return await _featureManager.RestoreFeature(featureId);
        }

        [HttpGet("Allfeatures")]
        [Authorize(Roles = AdministratorRoles.Admin_Role)]
        public async Task<QueryMultipleResult<IEnumerable<FeatureViewModel>, FeatureViewModel>> GetAll()
        {
            var featureModels = await _featureManager.GetAll();
            return _mapper.Map<QueryMultipleResult<IEnumerable<FeatureViewModel>, FeatureViewModel>>(featureModels);
        }

        [HttpGet("{featureId}")]
        [Authorize(Roles = AdministratorRoles.Admin_Role)]
        public async Task<QuerySingleResult<FeatureViewModel>> GetfeatureById(Guid featureId)
        {
            var featureModel = await _featureManager.GetById(featureId);
            return _mapper.Map<QuerySingleResult<FeatureViewModel>>(featureModel);
        }


        #endregion
    }
}
