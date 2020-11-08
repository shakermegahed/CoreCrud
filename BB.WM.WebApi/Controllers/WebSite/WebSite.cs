using AutoMapper;
using BB.CRM.Domain.Interfaces;
using BB.CRM.Entities.Common;
using BB.CRM.Entities.DatabaseEntities;
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

namespace BB.CRM.WebApi.Controllers.WebSite
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    [Authorize]
    public class WebSite : BaseController
    {
        private readonly IWebSiteManager _webSiteManager;
        private readonly IMapper _mapper;
        private readonly IAccountInfo _accountInfo;

        public WebSite(IHostingEnvironment hostingEnvironment, IWebSiteManager webSiteManager, IMapper mapper, IAccountInfo accountInfo) : base(hostingEnvironment)
        {
            _webSiteManager = webSiteManager;
            _mapper = mapper;
            _accountInfo = accountInfo;
        }


        [HttpPost]
        [Authorize(Roles = AdministratorRoles.Admin_Role)]
        public async Task<CommandResult<Guid>> CreateWebSite([FromBody] CreateWebSiteViewModel viewModel)
        {
            var createWebSiteModel = _mapper.Map<WebSiteModel>(viewModel);
            var result = await _webSiteManager.CreateWebSite(createWebSiteModel);
            if (result.IsSucceeded && !string.IsNullOrEmpty(viewModel.WebSiteLogo))
            {
                ConfirmFileAdded(viewModel.WebSiteLogo);
            }
            return result;
        }

        [HttpPut]
        [Authorize(Roles = AdministratorRoles.Admin_Role)]
        public async Task<CommandResult<Boolean>> UpdateWebSite([FromBody] UpdateWebSiteViewModel viewModel)
        {
            var updateWebSiteModel = _mapper.Map<WebSiteModel>(viewModel);

            var result = await _webSiteManager.UpdateWebSite(updateWebSiteModel);
            if (result.IsSucceeded && !string.IsNullOrEmpty(viewModel.WebSiteLogo))
            {
                ConfirmFileAdded(viewModel.WebSiteLogo);
            }
            return result;
        }

        [HttpPut("UpdateWebSiteSlider")]
        public async Task<CommandResult<Boolean>> UpdateWebSiteSlider([FromBody] IList<WebSiteSectionsViewModel> commands)
        {
            try
            {
                var sliders = _mapper.Map<IList<WebSiteSections>>(commands);

                foreach (var item in sliders.Where(q => q.Saved == false))
                {
                    if (!string.IsNullOrEmpty(item.ImageFile))
                    {
                        ConfirmFileAdded(item.ImageFile);
                        item.Saved = true;
                    }
                }
                return await _webSiteManager.UpdateSliders(sliders);
            }
            catch (Exception ex)
            {
                return new CommandResult<Boolean>(ex.Message);
            }
        }

        [HttpPut("UpdateWebSiteTeam")]
        public async Task<CommandResult<Boolean>> UpdateWebSiteTeam([FromBody] IList<WebSiteSectionsViewModel> commands)
        {
            try
            {
                var team = _mapper.Map<IList<WebSiteSections>>(commands);

                foreach (var item in team.Where(s => !s.Saved))
                {
                    if (!string.IsNullOrEmpty(item.ImageFile))
                    {
                        ConfirmFileAdded(item.ImageFile);
                        item.Saved = true;
                    }
                }
                return await _webSiteManager.UpdateTeam(team);
            }
            catch (Exception ex)
            {
                return new CommandResult<Boolean>(ex.Message);
            }
        }

        [HttpPut("UpdateWebSiteCareers")]
        public async Task<CommandResult<Boolean>> UpdateWebSiteCareers([FromBody] IList<WebSiteSectionsViewModel> commands)
        {
            try
            {
                var careers = _mapper.Map<IList<WebSiteSections>>(commands);

                foreach (var item in careers.Where(q => q.Saved == false))
                {
                    if (!string.IsNullOrEmpty(item.ImageFile))
                    {
                        ConfirmFileAdded(item.ImageFile);
                        item.Saved = true;
                    }
                }
                return await _webSiteManager.UpdateCareers(careers);
            }
            catch (Exception ex)
            {
                return new CommandResult<Boolean>(ex.Message);
            }
        }

        [HttpPut("UpdateWebSiteSocialMedia")]
        public async Task<CommandResult<Boolean>> UpdateWebSiteSocialMedia([FromBody] IList<WebSiteSocialMediaViewModel> commands)
        {
            try
            {
                var socialMedia = _mapper.Map<IList<WebSiteSocialMedia>>(commands);

                return await _webSiteManager.UpdateSocialMedia(socialMedia);
            }
            catch (Exception ex)
            {
                return new CommandResult<Boolean>(ex.Message);
            }
        }

        [HttpPut("UpdateWebSiteContacts")]
        public async Task<CommandResult<Boolean>> UpdateWebSiteContacts([FromBody] IList<ContactViewModel> commands)
        {
            try
            {
                var contacts = _mapper.Map<IList<Contact>>(commands);
                contacts.Where(c => c.ContactId == null).ToList().ForEach(c => c.ContactId = Guid.NewGuid());

                return await _webSiteManager.UpdateContacts(contacts);
            }
            catch (Exception ex)
            {
                return new CommandResult<Boolean>(ex.Message);
            }
        }

        [HttpPut("UpdateWebSiteClients")]
        public async Task<CommandResult<Boolean>> UpdateWebSiteClients([FromBody] IList<WebSiteSectionsViewModel> commands)
        {
            try
            {
                var clients = _mapper.Map<IList<WebSiteSections>>(commands);

                foreach (var item in clients.Where(q => q.Saved == false))
                {
                    if (!string.IsNullOrEmpty(item.ImageFile))
                    {
                        ConfirmFileAdded(item.ImageFile);
                        item.Saved = true;
                    }
                }

                return await _webSiteManager.UpdateClients(clients);
            }
            catch (Exception ex)
            {
                return new CommandResult<Boolean>(ex.Message);
            }
        }

        [HttpPut("UpdateWebSiteAboutList")]
        public async Task<CommandResult<Boolean>> UpdateWebSiteAboutList([FromBody] IList<WebSiteAboutListViewModel> commands)
        {
            try
            {
                var aboutList = _mapper.Map<IList<WebSiteAboutList>>(commands);

                foreach (var item in aboutList.Where(q => q.Saved == false))
                {
                    if (!string.IsNullOrEmpty(item.ImageFile))
                    {
                        ConfirmFileAdded(item.ImageFile);
                        item.Saved = true;
                    }
                }

                return await _webSiteManager.UpdateAboutList(aboutList);
            }
            catch (Exception ex)
            {
                return new CommandResult<Boolean>(ex.Message);
            }
        }


        [HttpPut("UpdateWebSiteAbout")]
        public async Task<CommandResult<Boolean>> UpdateWebSiteAbout([FromBody] WebSiteAboutViewModel viewModel)
        {
            try
            {
                return await _webSiteManager.UpdateAbout(viewModel.AboutUs);
            }
            catch (Exception ex)
            {
                return new CommandResult<Boolean>(ex.Message);
            }
        }

        [HttpDelete("{webSiteId}")]
        [Authorize(Roles = AdministratorRoles.Admin_Role)]
        public async Task<CommandResult<Boolean>> Delete(Guid webSiteId)
        {

            return await _webSiteManager.DeleteWebSite(webSiteId);
        }

        [HttpGet("Restore/{webSiteId}")]
        [Authorize(Roles = AdministratorRoles.Admin_Role)]
        public async Task<CommandResult<Boolean>> Restore(Guid webSiteId)
        {
            return await _webSiteManager.RestoreWebSite(webSiteId
);
        }

        [HttpGet("AllWebSites/{pageSize}/{pageNumber}")]
        [Authorize(Roles = AdministratorRoles.Admin_Role)]
        public async Task<QueryMultipleResult<IEnumerable<WebSiteViewModel>, WebSiteViewModel>> GetAll([FromQuery] string webSiteDomian, [FromRoute] int pageSize, [FromRoute] int pageNumber)
        {
            var webSiteModels = await _webSiteManager.GetAll(webSiteDomian, new PagedQueryParameters(pageSize, pageNumber));
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSiteViewModel>, WebSiteViewModel>>(webSiteModels);
        }

        [HttpGet("GetByOwner")]
        public async Task<QueryMultipleResult<IEnumerable<WebSiteViewModel>, WebSiteViewModel>> GetByOwnerId()
        {
            var webSiteModels = await _webSiteManager.GetMyWebSites();
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSiteViewModel>, WebSiteViewModel>>(webSiteModels);
        }

        [HttpGet("{webSiteId}")]
        [Authorize]
        public async Task<QuerySingleResult<WebSiteViewModel>> GetWebSiteById(Guid webSiteId)
        {
            var webSiteModel = await _webSiteManager.GetById(webSiteId);
            return _mapper.Map<QuerySingleResult<WebSiteViewModel>>(webSiteModel);
        }

        [HttpGet("GetMyWebsite")]
        [Authorize]
        public async Task<QuerySingleResult<WebSiteViewModel>> GetMyWebsite()
        {
            var webSiteModel = await _webSiteManager.GetById(_accountInfo.WebsiteId);
            return _mapper.Map<QuerySingleResult<WebSiteViewModel>>(webSiteModel);
        }

        [HttpGet("GetByDomain/{webSiteDomain}")]
        [AllowAnonymous]
        public async Task<QuerySingleResult<WebSiteViewModel>> GetWebSiteByDomain(string webSiteDomain)
        {
            var webSiteModel = await _webSiteManager.GetWebSiteByDomain(webSiteDomain);
            return _mapper.Map<QuerySingleResult<WebSiteViewModel>>(webSiteModel);
        }
    }
}
