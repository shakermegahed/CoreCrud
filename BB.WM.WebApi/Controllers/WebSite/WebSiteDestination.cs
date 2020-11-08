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
    public class WebSiteDestination : BaseController
    {
        #region[vars]
        private readonly IMapper _mapper;
        private readonly IWebSiteDestinationManager _webSiteDestinationManager;
        #endregion

        #region[ctor]
        public WebSiteDestination(IMapper mapper, IWebSiteDestinationManager webSiteDestinationManager, IHostingEnvironment hostingEnvironment) : base(hostingEnvironment)
        {
            _mapper = mapper;
            _webSiteDestinationManager = webSiteDestinationManager;
        }
        #endregion

        #region[action]
        [HttpPost]
        public async Task<CommandResult<Guid>> CreateWebSiteDestination([FromBody] CreateWebSiteDestinationViewModel viewModel)
        {
            var createDestinationModel = _mapper.Map<WebSiteDestinationModel>(viewModel);

            var result = await _webSiteDestinationManager.AssignDestination(createDestinationModel);
            if (result.IsSucceeded)
                foreach (var image in viewModel.DestinationImages)
                {
                    this.ConfirmImageAdded(image);
                    this.ConfirmFileAdded(image);
                }

            return result;
        }

        [HttpPut]
        public async Task<CommandResult<bool>> UpdateWebSiteDestination([FromBody] UpdateWebSiteDestinationViewModel viewModel)
        {
            var updateDestinationModel = _mapper.Map<WebSiteDestinationModel>(viewModel);
            var result = await _webSiteDestinationManager.UpdateDestination(updateDestinationModel);
            if (result.IsSucceeded)
                foreach (var image in viewModel.DestinationImages)
                {
                    this.ConfirmImageAdded(image);
                    this.ConfirmFileAdded(image);
                }

            return result;
        }

        [HttpDelete("{WebSiteDestinationId}")]
        public async Task<CommandResult<Boolean>> Delete(Guid WebSiteDestinationId)
        {

            return await _webSiteDestinationManager.DeleteDestination(WebSiteDestinationId);
        }

        [HttpGet("Restore/{WebSiteDestinationId}")]
        public async Task<CommandResult<Boolean>> Restore(Guid WebSiteDestinationId)
        {

            return await _webSiteDestinationManager.RestoreDestination(WebSiteDestinationId);
        }

        [HttpGet("AllDestinations")]
        public async Task<QueryMultipleResult<IEnumerable<WebSiteDestinationViewModel>, WebSiteDestinationViewModel>> GetAll()
        {
            var Destinations = await _webSiteDestinationManager.GetByWebSiteId();
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSiteDestinationViewModel>, WebSiteDestinationViewModel>>(Destinations);
        }

        [HttpGet("AllDestinationsByDomain/{websiteDomain}")]
        [AllowAnonymous]
        public async Task<QueryMultipleResult<IEnumerable<WebSiteDestinationViewModel>, WebSiteDestinationViewModel>> GetByWebSiteDomain(string websiteDomain)
        {
            var Destinations = await _webSiteDestinationManager.GetByWebSiteDomain(websiteDomain);
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSiteDestinationViewModel>, WebSiteDestinationViewModel>>(Destinations);
        }

        [HttpGet("{websiteDestinationId}")]
        [AllowAnonymous]
        public async Task<QuerySingleResult<WebSiteDestinationDetailsViewModel>> GetDestinationById(Guid websiteDestinationId)
        {
            var destination = await _webSiteDestinationManager.GetDestinationById(websiteDestinationId);
            return _mapper.Map<QuerySingleResult<WebSiteDestinationDetailsViewModel>>(destination);
        }
        #endregion
    }
}
