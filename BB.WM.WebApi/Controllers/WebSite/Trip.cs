using AutoMapper;
using BB.CRM.Domain.Interfaces;
using BB.CRM.Entities.Common;
using BB.CRM.Entities.DomainModels;
using BB.CRM.Identity;
using BB.CRM.WebApi.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BB.CRM.WebApi.Controllers.Trip
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    [Authorize]
    public class Trip : BaseController
    {
        private readonly ITripManager _tripManager;
        private readonly IMapper _mapper;
        private readonly IAccountInfo _accountInfo;

        public Trip(IHostingEnvironment hostingEnvironment, ITripManager tripManager, IMapper mapper, IAccountInfo accountInfo) : base(hostingEnvironment)
        {

            _tripManager = tripManager;
            _mapper = mapper;
            _accountInfo = accountInfo;
        }

        [HttpPost]
        public async Task<CommandResult<Guid>> CreateTrip([FromBody] CreateTripViewModel viewModel)
        {
            var createTripModel = _mapper.Map<WebSiteTripModel>(viewModel);
            var result = await _tripManager.CreateTrip(createTripModel);
            if (result.IsSucceeded)
            {
                foreach (var image in viewModel.Images)
                {
                    this.ConfirmImageAdded(image);
                    this.ConfirmFileAdded(image);
                }
                if (!string.IsNullOrEmpty(viewModel.PdfName))
                    this.ConfirmFileAdded(viewModel.PdfName);
            }
            return result;
        }

        [HttpPut]
        public async Task<CommandResult<Boolean>> UpdateTrip([FromBody] UpdateTripViewModel viewModel)
        {
            var updateModel = _mapper.Map<WebSiteTripModel>(viewModel);

            var result = await _tripManager.UpdateTrip(updateModel);
            if (result.IsSucceeded)
            {
                foreach (var image in viewModel.Images)
                {
                    this.ConfirmImageAdded(image);
                    this.ConfirmFileAdded(image);
                }
                if (!string.IsNullOrEmpty(viewModel.PdfName))
                    this.ConfirmFileAdded(viewModel.PdfName);
            }
            return result;
        }

        [HttpDelete("delete/{tripId}")]
        public async Task<CommandResult<Boolean>> Delete(Guid tripId)
        {

            return await _tripManager.DeleteTrip(tripId);
        }

        [HttpGet("restore/{tripId}")]
        public async Task<CommandResult<Boolean>> Restore(Guid tripId)
        {

            return await _tripManager.RestoreTrip(tripId);
        }

        [HttpGet("GetByWebsiteDomain/{pageSize}/{pageNumber}")]
        [AllowAnonymous]
        public async Task<QueryMultipleResult<IEnumerable<WebSiteTripViewModel>, WebSiteTripViewModel>> GetAllByDomain([FromQuery] string webSiteDomian, [FromRoute] int pageSize, [FromRoute] int pageNumber, [FromQuery] string keyword)
        {
            var webSiteModels = await _tripManager.GetTripsByWebSiteDoamin(webSiteDomian, new PagedQueryParameters(pageSize, pageNumber, keyword));
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSiteTripViewModel>, WebSiteTripViewModel>>(webSiteModels);
        }

        [HttpGet("GetByWebsiteId/{pageSize}/{pageNumber}")]
        public async Task<QueryMultipleResult<IEnumerable<WebSiteTripViewModel>, WebSiteTripViewModel>> GetAllByWebSite([FromRoute] int pageSize, [FromRoute] int pageNumber, [FromQuery] string keyword)
        {
            var webSiteModels = await _tripManager.GetTripsByWebSiteId(new PagedQueryParameters(pageSize, pageNumber, keyword));
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSiteTripViewModel>, WebSiteTripViewModel>>(webSiteModels);
        }

        [HttpGet("{tripId}")]
        [AllowAnonymous]
        public async Task<QuerySingleResult<WebSiteTripViewModel>> GetTripById(Guid tripId)
        {
            var trip = await _tripManager.GetById(tripId);
            return _mapper.Map<QuerySingleResult<WebSiteTripViewModel>>(trip);
        }
    }
}
