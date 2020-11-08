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
    public class Event : BaseController
    {
        #region[vars]
        private readonly IMapper _mapper;
        private readonly IWebSiteEventManager _EventManager;
        #endregion

        #region[ctor]
        public Event(IMapper mapper, IWebSiteEventManager EventManager, IHostingEnvironment hostingEnvironment) : base(hostingEnvironment)
        {
            _mapper = mapper;
            _EventManager = EventManager;
        }
        #endregion

        #region[actions]
        [HttpPost]
        public async Task<CommandResult<Guid>> CreateEvent([FromBody]CreateEventViewModel viewModel)
        {
            var createEventModel = _mapper.Map<WebSiteEventModel>(viewModel);
            var result = await _EventManager.CreateEvent(createEventModel);
            if (result.IsSucceeded)
            {
                foreach (var image in viewModel.Images)
                {
                    this.ConfirmFileAdded(image);
                    this.ConfirmImageAdded(image);
                }
                this.ConfirmFileAdded(viewModel.CoverImage);
                this.ConfirmImageAdded(viewModel.CoverImage);
            }
            return result;
        }

        [HttpPut]
        public async Task<CommandResult<bool>> UpdateEvent([FromBody]UpdateEventViewModel viewModel)
        {
            var updateEventModel = _mapper.Map<WebSiteEventModel>(viewModel);
            var result = await _EventManager.UpdateEvent(updateEventModel);
            if (result.IsSucceeded)
            {
                foreach (var image in viewModel.Images)
                {
                    this.ConfirmFileAdded(image);
                    this.ConfirmImageAdded(image);
                }
                this.ConfirmFileAdded(viewModel.CoverImage);
                this.ConfirmImageAdded(viewModel.CoverImage);
            }
            return result;
        }

        [HttpDelete("{EventId}")]
        public async Task<CommandResult<Boolean>> Delete(Guid EventId)
        {

            return await _EventManager.DeleteEvent(EventId);
        }

        [HttpGet("Restore/{EventId}")]
        public async Task<CommandResult<Boolean>> Restore(Guid EventId)
        {

            return await _EventManager.RestoreEvent(EventId);
        }

        [HttpGet("AllEvents")]
        public async Task<QueryMultipleResult<IEnumerable<WebSiteEventViewModel>, WebSiteEventViewModel>> GetAll()
        {
            var Events = await _EventManager.GetEventsByWebSite();
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSiteEventViewModel>, WebSiteEventViewModel>>(Events);
        }

        [HttpGet("EventsByDoamin/{webSiteDomain}")]
        [AllowAnonymous]
        public async Task<QueryMultipleResult<IEnumerable<WebSiteEventViewModel>, WebSiteEventViewModel>> GetEventByWebSiteDomain(string webSiteDomain)
        {
            var Events = await _EventManager.GetEventsByWebSiteDomain(webSiteDomain);
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSiteEventViewModel>, WebSiteEventViewModel>>(Events);
        }

        [HttpGet("{EventId}")]
        [AllowAnonymous]
        public async Task<QuerySingleResult<WebSiteEventViewModel>> GetEventById(Guid EventId)
        {
            var Event = await _EventManager.GetEventById(EventId);
            return _mapper.Map<QuerySingleResult<WebSiteEventViewModel>>(Event);
        }

        #endregion
    }
}
