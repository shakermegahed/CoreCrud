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
    public class WebSiteFeature : Controller
    {
        private readonly IWebSiteFeatureManager _webSiteFeatureManager;
        private readonly IMapper _mapper;

        public WebSiteFeature(IWebSiteFeatureManager webSiteFeatureManager,IMapper mapper)
        {
            _webSiteFeatureManager = webSiteFeatureManager;
            _mapper = mapper;
        }

        #region[actions]
        [HttpPost]
        [Authorize(Roles = AdministratorRoles.Admin_Role)]
        public async Task<CommandResult<Guid>> CreateFeature([FromBody] WebSiteFeatureViewmodel viewModel)
        {
            var AssignFeatureModel = _mapper.Map<WebSiteFeatureModel>(viewModel);
            return await _webSiteFeatureManager.AssignFeature(AssignFeatureModel);
        }

        [HttpDelete("{WebSiteFeatureId}")]
        [Authorize(Roles = AdministratorRoles.Admin_Role)]
        public async Task<CommandResult<Boolean>> Delete(Guid WebSiteFeatureId)
        {
            return await _webSiteFeatureManager.DeleteFeature(WebSiteFeatureId);
        }

        #endregion
    }
}
