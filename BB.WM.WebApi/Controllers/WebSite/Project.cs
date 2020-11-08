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
    public class Project : BaseController
    {
        #region[vars]
        private readonly IMapper _mapper;
        private readonly IWebSiteProjectManager _ProjectManager;
        #endregion

        #region[ctor]
        public Project(IMapper mapper, IWebSiteProjectManager ProjectManager, IHostingEnvironment hostingEnvironment) : base(hostingEnvironment)
        {
            _mapper = mapper;
            _ProjectManager = ProjectManager;
        }
        #endregion

        #region[actions]
        [HttpPost]
        public async Task<CommandResult<Guid>> CreateProject([FromBody]CreateProjectViewModel viewModel)
        {
            var createProjectModel = _mapper.Map<WebSiteProjectModel>(viewModel);
            var result = await _ProjectManager.CreateProject(createProjectModel);
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
        public async Task<CommandResult<bool>> UpdateProject([FromBody]UpdateProjectViewModel viewModel)
        {
            var updateProjectModel = _mapper.Map<WebSiteProjectModel>(viewModel);
            var result = await _ProjectManager.UpdateProject(updateProjectModel);
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

        [HttpDelete("{ProjectId}")]
        public async Task<CommandResult<Boolean>> Delete(Guid ProjectId)
        {

            return await _ProjectManager.DeleteProject(ProjectId);
        }

        [HttpGet("Restore/{ProjectId}")]
        public async Task<CommandResult<Boolean>> Restore(Guid ProjectId)
        {

            return await _ProjectManager.RestoreProject(ProjectId);
        }

        [HttpGet("AllProjects")]
        public async Task<QueryMultipleResult<IEnumerable<WebSiteProjectViewModel>, WebSiteProjectViewModel>> GetAll()
        {
            var Projects = await _ProjectManager.GetProjectsByWebSite();
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSiteProjectViewModel>, WebSiteProjectViewModel>>(Projects);
        }

        [HttpGet("ProjectsByDoamin/{webSiteDomain}")]
        [AllowAnonymous]
        public async Task<QueryMultipleResult<IEnumerable<WebSiteProjectViewModel>, WebSiteProjectViewModel>> GetProjectByWebSiteDomain(string webSiteDomain)
        {
            var Projects = await _ProjectManager.GetProjectsByWebSiteDomain(webSiteDomain);
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSiteProjectViewModel>, WebSiteProjectViewModel>>(Projects);
        }

        [HttpGet("{ProjectId}")]
        [AllowAnonymous]
        public async Task<QuerySingleResult<WebSiteProjectViewModel>> GetProjectById(Guid ProjectId)
        {
            var Project = await _ProjectManager.GetProjectById(ProjectId);
            return _mapper.Map<QuerySingleResult<WebSiteProjectViewModel>>(Project);
        }

        #endregion
    }
}
