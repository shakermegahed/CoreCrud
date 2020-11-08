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
    public class Topic : BaseController
    {
        #region[vars]
        private readonly IMapper _mapper;
        private readonly IWebSiteTopicManager _TopicManager;
        #endregion

        #region[ctor]
        public Topic(IMapper mapper, IWebSiteTopicManager TopicManager, IHostingEnvironment hostingEnvironment) : base(hostingEnvironment)
        {
            _mapper = mapper;
            _TopicManager = TopicManager;
        }
        #endregion

        #region[actions]
        [HttpPost]
        public async Task<CommandResult<Guid>> CreateTopic([FromBody]CreateWebSiteTopicViewModel viewModel)
        {
            var createTopicModel = _mapper.Map<WebSiteTopicModel>(viewModel);
            var result = await _TopicManager.CreateTopic(createTopicModel);
            if (result.IsSucceeded)
            {
                this.ConfirmFileAdded(createTopicModel.ImageFile);
                this.ConfirmImageAdded(createTopicModel.ImageFile);
            }
            return result;
        }

        [HttpPut]
        public async Task<CommandResult<bool>> UpdateTopic([FromBody]UpdateWebSiteTopicViewModel viewModel)
        {
            var updateTopicModel = _mapper.Map<WebSiteTopicModel>(viewModel);
            var result = await _TopicManager.UpdateTopic(updateTopicModel);
            if (result.IsSucceeded)
            {
                this.ConfirmFileAdded(updateTopicModel.ImageFile);
                this.ConfirmImageAdded(updateTopicModel.ImageFile);

            }
            return result;
        }

        [HttpDelete("{TopicId}")]
        public async Task<CommandResult<Boolean>> Delete(Guid TopicId)
        {

            return await _TopicManager.DeleteTopic(TopicId);
        }

        [HttpGet("Restore/{TopicId}")]
        public async Task<CommandResult<Boolean>> Restore(Guid TopicId)
        {

            return await _TopicManager.RestoreTopic(TopicId);
        }

        [HttpGet("AllTopics")]
        public async Task<QueryMultipleResult<IEnumerable<WebSiteTopicViewModel>, WebSiteTopicViewModel>> GetAll()
        {
            var Topics = await _TopicManager.GetTopicsByWebSite();
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSiteTopicViewModel>, WebSiteTopicViewModel>>(Topics);
        }

        [HttpGet("TopicsByDoamin/{webSiteDomain}")]
        [AllowAnonymous]
        public async Task<QueryMultipleResult<IEnumerable<WebSiteTopicViewModel>, WebSiteTopicViewModel>> GetTopicByWebSiteDomain(string webSiteDomain)
        {
            var Topics = await _TopicManager.GetTopicsByWebSiteDomain(webSiteDomain);
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSiteTopicViewModel>, WebSiteTopicViewModel>>(Topics);
        }

        [HttpGet("{TopicId}")]
        [AllowAnonymous]
        public async Task<QuerySingleResult<WebSiteTopicViewModel>> GetTopicById(Guid TopicId)
        {
            var Topic = await _TopicManager.GetTopicById(TopicId);
            return _mapper.Map<QuerySingleResult<WebSiteTopicViewModel>>(Topic);
        }

        #endregion
    }
}
