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
    public class WebSitePlace : BaseController
    {
        #region[vars]
        private readonly IMapper _mapper;
        private readonly IWebSitePlaceManager _webSitePlaceManager;
        #endregion

        #region[ctor]
        public WebSitePlace(IMapper mapper, IWebSitePlaceManager webSitePlaceManager, IHostingEnvironment hostingEnvironment) : base(hostingEnvironment)
        {
            _mapper = mapper;
            _webSitePlaceManager = webSitePlaceManager;
        }
        #endregion

        #region[action]
        [HttpPost]
        public async Task<CommandResult<Guid>> CreateWebSitePlace([FromBody] CreateWebSitePlaceViewModel viewModel)
        {
            var createPlaceModel = _mapper.Map<WebSitePlaceModel>(viewModel);

            var result = await _webSitePlaceManager.AssignPlace(createPlaceModel);
            if (result.IsSucceeded)
                foreach (var image in viewModel.PlaceImages)
                {
                    this.ConfirmImageAdded(image);
                    this.ConfirmFileAdded(image);
                }

            return result;
        }

        [HttpPut]
        public async Task<CommandResult<bool>> UpdateWebSitePlace([FromBody] UpdateWebSitePlaceViewModel viewModel)
        {
            var updatePlaceModel = _mapper.Map<WebSitePlaceModel>(viewModel);
            var result = await _webSitePlaceManager.UpdatePlace(updatePlaceModel);
            if (result.IsSucceeded)
                foreach (var image in viewModel.PlaceImages)
                {
                    this.ConfirmImageAdded(image);
                    this.ConfirmFileAdded(image);
                }

            return result;
        }

        [HttpDelete("{WebSitePlaceId}")]
        public async Task<CommandResult<Boolean>> Delete(Guid WebSitePlaceId)
        {

            return await _webSitePlaceManager.DeletePlace(WebSitePlaceId);
        }

        [HttpGet("Restore/{WebSitePlaceId}")]
        public async Task<CommandResult<Boolean>> Restore(Guid WebSitePlaceId)
        {

            return await _webSitePlaceManager.RestorePlace(WebSitePlaceId);
        }

        [HttpGet("AllPlaces")]
        public async Task<QueryMultipleResult<IEnumerable<WebSitePlaceViewModel>, WebSitePlaceViewModel>> GetAll()
        {
            var places = await _webSitePlaceManager.GetByWebSiteId();
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSitePlaceViewModel>, WebSitePlaceViewModel>>(places);
        }

        [HttpGet("AllPlacesByDomain/{websiteDomain}")]
        [AllowAnonymous]
        public async Task<QueryMultipleResult<IEnumerable<WebSitePlaceViewModel>, WebSitePlaceViewModel>> GetByWebSiteDomain(string websiteDomain)
        {
            var places = await _webSitePlaceManager.GetByWebSiteDomain(websiteDomain);
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSitePlaceViewModel>, WebSitePlaceViewModel>>(places);
        }


        [HttpGet("{webSitePlaceId}")]
        [AllowAnonymous]
        public async Task<QuerySingleResult<WebSitePlaceViewModel>> GetWebSitePlaceById(Guid webSitePlaceId)
        {
            var place = await _webSitePlaceManager.GetWebSitePlaceById(webSitePlaceId);
            return _mapper.Map<QuerySingleResult<WebSitePlaceViewModel>>(place);
        }
        #endregion
    }
}
