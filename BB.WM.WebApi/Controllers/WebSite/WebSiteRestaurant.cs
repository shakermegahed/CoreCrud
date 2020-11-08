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
    public class WebSiteRestaurant : BaseController
    {
        #region[vars]
        private readonly IMapper _mapper;
        private readonly IWebSiteRestaurantManager _webSiteRestaurantManager;
        #endregion

        #region[ctor]
        public WebSiteRestaurant(IMapper mapper, IWebSiteRestaurantManager webSiteRestaurantManager, IHostingEnvironment hostingEnvironment) : base(hostingEnvironment)
        {
            _mapper = mapper;
            _webSiteRestaurantManager = webSiteRestaurantManager;
        }
        #endregion

        #region[action]
        [HttpPost]
        public async Task<CommandResult<Guid>> CreateWebSiteRestaurant([FromBody] CreateWebSiteRestaurantViewModel viewModel)
        {
            var createRestaurantModel = _mapper.Map<WebSiteRestaurantModel>(viewModel);

            var result = await _webSiteRestaurantManager.AssignRestaurant(createRestaurantModel);
            if (result.IsSucceeded)
                foreach (var image in viewModel.RestaurantImages)
                {
                    this.ConfirmImageAdded(image);
                    this.ConfirmFileAdded(image);
                }

            return result;
        }

        [HttpPut]
        public async Task<CommandResult<bool>> UpdateWebSiteRestaurant([FromBody] UpdateWebSiteRestaurantViewModel viewModel)
        {
            var updateRestaurantModel = _mapper.Map<WebSiteRestaurantModel>(viewModel);
            var result = await _webSiteRestaurantManager.UpdateRestaurant(updateRestaurantModel);
            if (result.IsSucceeded)
                foreach (var image in viewModel.RestaurantImages)
                {
                    this.ConfirmImageAdded(image);
                    this.ConfirmFileAdded(image);
                }

            return result;
        }

        [HttpDelete("{WebSiteRestaurantId}")]
        public async Task<CommandResult<Boolean>> Delete(Guid WebSiteRestaurantId)
        {

            return await _webSiteRestaurantManager.DeleteRestaurant(WebSiteRestaurantId);
        }

        [HttpGet("Restore/{WebSiteRestaurantId}")]
        public async Task<CommandResult<Boolean>> Restore(Guid WebSiteRestaurantId)
        {

            return await _webSiteRestaurantManager.RestoreRestaurant(WebSiteRestaurantId);
        }

        [HttpGet("AllRestaurants")]
        public async Task<QueryMultipleResult<IEnumerable<WebSiteRestaurantViewModel>, WebSiteRestaurantViewModel>> GetAll()
        {
            var restaurants = await _webSiteRestaurantManager.GetByWebSiteId();
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSiteRestaurantViewModel>, WebSiteRestaurantViewModel>>(restaurants);
        }

        [HttpGet("AllRestaurantByDomain/{websiteDomain}")]
        [AllowAnonymous]
        public async Task<QueryMultipleResult<IEnumerable<WebSiteRestaurantViewModel>, WebSiteRestaurantViewModel>> GetByWebSiteDomain(string websiteDomain)
        {
            var restaurants = await _webSiteRestaurantManager.GetByWebSiteDomain(websiteDomain);
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSiteRestaurantViewModel>, WebSiteRestaurantViewModel>>(restaurants);
        }


        [HttpGet("{webSiteRestaurantId}")]
        [AllowAnonymous]
        public async Task<QuerySingleResult<WebSiteRestaurantViewModel>> GetWebSiteRestaurantById(Guid webSiteRestaurantId)
        {
            var restaurant = await _webSiteRestaurantManager.GetWebSiteRestaurantById(webSiteRestaurantId);
            return _mapper.Map<QuerySingleResult<WebSiteRestaurantViewModel>>(restaurant);
        }
        #endregion
    }
}
