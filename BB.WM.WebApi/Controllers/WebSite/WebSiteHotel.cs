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
    public class WebSiteHotel : BaseController
    {
        #region[vars]
        private readonly IMapper _mapper;
        private readonly IWebSiteHotelManager _webSiteHotelManager;
        #endregion

        #region[ctor]
        public WebSiteHotel(IMapper mapper, IWebSiteHotelManager webSiteHotelManager, IHostingEnvironment hostingEnvironment) : base(hostingEnvironment)
        {
            _mapper = mapper;
            _webSiteHotelManager = webSiteHotelManager;
        }
        #endregion

        #region[action]
        [HttpPost]
        public async Task<CommandResult<Guid>> CreateWebSiteHotel([FromBody] CreateWebSiteHotelViewModel viewModel)
        {
            var createHotelModel = _mapper.Map<WebSiteHotelModel>(viewModel);
            var result = await _webSiteHotelManager.AssignHotel(createHotelModel);
            if (result.IsSucceeded)
                foreach (var image in createHotelModel.HotelImages)
                {
                    this.ConfirmImageAdded(image);
                    this.ConfirmFileAdded(image);
                }

            return result;
        }

        [HttpPut]
        public async Task<CommandResult<bool>> UpdateWebSiteHotel([FromBody] UpdateWebSiteHotelViewModel viewModel)
        {
            var updateHotelModel = _mapper.Map<WebSiteHotelModel>(viewModel);
            var result = await _webSiteHotelManager.UpdateHotel(updateHotelModel);
            if (result.IsSucceeded)
                foreach (var image in updateHotelModel.HotelImages)
                {
                    this.ConfirmImageAdded(image);
                    this.ConfirmFileAdded(image);
                }
            return result;
        }

        [HttpDelete("{WebSiteHotelId}")]
        public async Task<CommandResult<Boolean>> Delete(Guid WebSiteHotelId)
        {
            return await _webSiteHotelManager.DeleteHotel(WebSiteHotelId);
        }

        [HttpGet("Restore/{WebSiteHotelId}")]
        public async Task<CommandResult<Boolean>> Restore(Guid WebSiteHotelId)
        {
            return await _webSiteHotelManager.RestoreHotel(WebSiteHotelId);
        }

        [HttpGet("AllHotels")]
        public async Task<QueryMultipleResult<IEnumerable<WebSiteHotelViewModel>, WebSiteHotelViewModel>> GetAll()
        {
            var hotels = await _webSiteHotelManager.GetByWebSiteId();
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSiteHotelViewModel>, WebSiteHotelViewModel>>(hotels);
        }

        [HttpGet("AllHotelsByDomain/{websiteDomain}")]
        [AllowAnonymous]
        public async Task<QueryMultipleResult<IEnumerable<WebSiteHotelViewModel>, WebSiteHotelViewModel>> GetByWebSiteDomain(string websiteDomain)
        {
            var hotels = await _webSiteHotelManager.GetByWebSiteDomain(websiteDomain);
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSiteHotelViewModel>, WebSiteHotelViewModel>>(hotels);
        }

        [HttpGet("{webSiteHotelId}")]
        [AllowAnonymous]
        public async Task<QuerySingleResult<WebSiteHotelViewModel>> GetWebSiteHotelById(Guid webSiteHotelId)
        {
            var hotel = await _webSiteHotelManager.GetWebSiteHotelById(webSiteHotelId);
            return _mapper.Map<QuerySingleResult<WebSiteHotelViewModel>>(hotel);
        }
        #endregion
    }
}
