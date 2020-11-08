using AutoMapper;
using BB.CRM.Domain.Interfaces;
using BB.CRM.Entities.Common;
using BB.CRM.Entities.DomainModels;
using BB.CRM.WebApi.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
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
    public class Service : BaseController
    {
        #region[vars]
        private readonly IMapper _mapper;
        private readonly IWebSiteServiceManager _serviceManager;
        #endregion

        #region[ctor]
        public Service(IMapper mapper, IWebSiteServiceManager serviceManager, IHostingEnvironment hostingEnvironment) : base(hostingEnvironment)
        {
            _mapper = mapper;
            _serviceManager = serviceManager;
        }
        #endregion

        #region[actions]
        [HttpPost]
        public async Task<CommandResult<Guid>> CreateService([FromBody]CreateWebSiteServiceViewModel viewModel)
        {
            var createServiceModel = _mapper.Map<WebSiteServiceModel>(viewModel);
            var result = await _serviceManager.CreateService(createServiceModel);
            if (result.IsSucceeded)
            {
                this.ConfirmFileAdded(createServiceModel.ImageFile);
            }
            return result;
        }

        [HttpPut]
        public async Task<CommandResult<bool>> UpdateService([FromBody]UpdateWebSiteServiceViewModel viewModel)
        {
            var updateServiceModel = _mapper.Map<WebSiteServiceModel>(viewModel);
            var result = await _serviceManager.UpdateService(updateServiceModel);
            if (result.IsSucceeded)
            {
                this.ConfirmFileAdded(updateServiceModel.ImageFile);
            }
            return result;
        }

        [HttpDelete("{serviceId}")]
        public async Task<CommandResult<Boolean>> Delete(Guid serviceId)
        {

            return await _serviceManager.DeleteService(serviceId);
        }

        [HttpGet("Restore/{serviceId}")]
        public async Task<CommandResult<Boolean>> Restore(Guid serviceId)
        {

            return await _serviceManager.RestoreService(serviceId);
        }

        [HttpGet("AllServices")]
        public async Task<QueryMultipleResult<IEnumerable<WebSiteServiceViewModel>, WebSiteServiceViewModel>> GetAll()
        {
            var services = await _serviceManager.GetServicesByWebSite();
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSiteServiceViewModel>, WebSiteServiceViewModel>>(services);
        }

        [HttpGet("ServicesByDoamin/{webSiteDomain}")]
        [AllowAnonymous]
        public async Task<QueryMultipleResult<IEnumerable<WebSiteServiceViewModel>, WebSiteServiceViewModel>> GetServiceByWebSiteDomain(string webSiteDomain)
        {
            var services = await _serviceManager.GetServicesByWebSiteDomain(webSiteDomain);
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSiteServiceViewModel>, WebSiteServiceViewModel>>(services);
        }

        [HttpGet("GetAllByParent/{parentId}")]
        [AllowAnonymous]
        public async Task<QueryMultipleResult<IEnumerable<WebSiteServiceViewModel>, WebSiteServiceViewModel>> GetAllByParentId(Guid parentId)
        {
            var services = await _serviceManager.GetServicesByParentId(parentId);
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSiteServiceViewModel>, WebSiteServiceViewModel>>(services);
        }

        [HttpGet("{serviceId}")]
        [AllowAnonymous]
        public async Task<QuerySingleResult<WebSiteServiceViewModel>> GetServiceById(Guid serviceId)
        {
            var service = await _serviceManager.GetServiceById(serviceId);
            return _mapper.Map<QuerySingleResult<WebSiteServiceViewModel>>(service);
        }

        #endregion
    }
}
