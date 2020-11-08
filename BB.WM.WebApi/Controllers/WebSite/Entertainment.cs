﻿﻿using AutoMapper;
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
    public class Entertainment : BaseController
    {
        #region[vars]
        private readonly IMapper _mapper;
        private readonly IEntertainmentManager _EntertainmentManager;
        #endregion

        #region[ctor]
        public Entertainment(IMapper mapper, IEntertainmentManager EntertainmentManager, IHostingEnvironment hostingEnvironment) : base(hostingEnvironment)
        {
            _mapper = mapper;
            _EntertainmentManager = EntertainmentManager;
        }
        #endregion

        #region[action]
        [HttpPost]
        public async Task<CommandResult<Guid>> CreateEntertainment([FromBody] CreateEntertainmentViewModel viewModel)
        {
            var createEntertainmentModel = _mapper.Map<EntertainmentModel>(viewModel);

            var result = await _EntertainmentManager.AssignEntertainment(createEntertainmentModel);
            if (result.IsSucceeded)
                foreach (var image in viewModel.Images)
                {
                    this.ConfirmImageAdded(image);
                    this.ConfirmFileAdded(image);
                }

            return result;
        }

        [HttpPut]
        public async Task<CommandResult<bool>> UpdateEntertainment([FromBody] UpdateEntertainmentViewModel viewModel)
        {
            var updateEntertainmentModel = _mapper.Map<EntertainmentModel>(viewModel);
            var result = await _EntertainmentManager.UpdateEntertainment(updateEntertainmentModel);
            if (result.IsSucceeded)
                foreach (var image in viewModel.Images)
                {
                    this.ConfirmImageAdded(image);
                    this.ConfirmFileAdded(image);
                }

            return result;
        }

        [HttpDelete("{entertainmentId}")]
        public async Task<CommandResult<Boolean>> Delete(Guid entertainmentId)
        {
            return await _EntertainmentManager.DeleteEntertainment(entertainmentId);
        }

        [HttpGet("Restore/{EntertainmentId}")]
        public async Task<CommandResult<Boolean>> Restore(Guid EntertainmentId)
        {
            return await _EntertainmentManager.RestoreEntertainment(EntertainmentId);
        }

        [HttpGet("AllEntertainments")]
        public async Task<QueryMultipleResult<IEnumerable<EntertainmentViewModel>, EntertainmentViewModel>> GetAll()
        {
            var entertainments = await _EntertainmentManager.GetByWebSiteId();
            return _mapper.Map<QueryMultipleResult<IEnumerable<EntertainmentViewModel>, EntertainmentViewModel>>(entertainments);
        }

        [HttpGet("AllEntertainmentsByDomain/{websiteDomain}")]
        [AllowAnonymous]
        public async Task<QueryMultipleResult<IEnumerable<EntertainmentViewModel>, EntertainmentViewModel>> GetByWebSiteDomain(string websiteDomain)
        {
            var entertainments = await _EntertainmentManager.GetByWebSiteDomain(websiteDomain);
            return _mapper.Map<QueryMultipleResult<IEnumerable<EntertainmentViewModel>, EntertainmentViewModel>>(entertainments);
        }

        [HttpGet("{entertainmentId}")]
        [AllowAnonymous]
        public async Task<QuerySingleResult<EntertainmentViewModel>> GetWebSiteById(Guid entertainmentId)
        {
            var entertainment = await _EntertainmentManager.GetById(entertainmentId);
            return _mapper.Map<QuerySingleResult<EntertainmentViewModel>>(entertainment);
        }
        #endregion
    }
}
