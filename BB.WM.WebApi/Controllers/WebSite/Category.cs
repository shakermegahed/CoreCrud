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
    public class Category : BaseController
    {
        #region[vars]
        private readonly IMapper _mapper;
        private readonly IWebSiteCategoryManager _CategoryManager;
        #endregion

        #region[ctor]
        public Category(IMapper mapper, IWebSiteCategoryManager CategoryManager, IHostingEnvironment hostingEnvironment) : base(hostingEnvironment)
        {
            _mapper = mapper;
            _CategoryManager = CategoryManager;
        }
        #endregion

        #region[actions]
        [HttpPost]
        public async Task<CommandResult<Guid>> CreateCategory([FromBody]CreateWebSiteCategoryViewModel viewModel)
        {
            var createCategoryModel = _mapper.Map<WebSiteCategoryModel>(viewModel);
            var result = await _CategoryManager.CreateCategory(createCategoryModel);
            if (result.IsSucceeded)
            {
                this.ConfirmFileAdded(createCategoryModel.ImageFile);
            }
            return result;
        }

        [HttpPut]
        public async Task<CommandResult<bool>> UpdateCategory([FromBody]UpdateWebSiteCategoryViewModel viewModel)
        {
            var updateCategoryModel = _mapper.Map<WebSiteCategoryModel>(viewModel);
            var result = await _CategoryManager.UpdateCategory(updateCategoryModel);
            if (result.IsSucceeded)
            {
                this.ConfirmFileAdded(updateCategoryModel.ImageFile);
            }
            return result;
        }

        [HttpDelete("{CategoryId}")]
        public async Task<CommandResult<Boolean>> Delete(Guid CategoryId)
        {

            return await _CategoryManager.DeleteCategory(CategoryId);
        }

        [HttpGet("Restore/{CategoryId}")]
        public async Task<CommandResult<Boolean>> Restore(Guid CategoryId)
        {

            return await _CategoryManager.RestoreCategory(CategoryId);
        }

        [HttpGet("AllCategories")]
        public async Task<QueryMultipleResult<IEnumerable<WebSiteCategoryViewModel>, WebSiteCategoryViewModel>> GetAll()
        {
            var Categorys = await _CategoryManager.GetCategoriesByWebSite();
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSiteCategoryViewModel>, WebSiteCategoryViewModel>>(Categorys);
        }

        [HttpGet("CategoriesByDoamin/{webSiteDomain}")]
        [AllowAnonymous]
        public async Task<QueryMultipleResult<IEnumerable<WebSiteCategoryViewModel>, WebSiteCategoryViewModel>> GetCategoryByWebSiteDomain(string webSiteDomain)
        {
            var Categorys = await _CategoryManager.GetCategoriesByWebSiteDomain(webSiteDomain);
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSiteCategoryViewModel>, WebSiteCategoryViewModel>>(Categorys);
        }

        [HttpGet("GetAllByParent/{parentId}")]
        [AllowAnonymous]
        public async Task<QueryMultipleResult<IEnumerable<WebSiteCategoryViewModel>, WebSiteCategoryViewModel>> GetAllByParentId(Guid parentId)
        {
            var Categorys = await _CategoryManager.GetCategoriesByParentId(parentId);
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSiteCategoryViewModel>, WebSiteCategoryViewModel>>(Categorys);
        }

        [HttpGet("{CategoryId}")]
        [AllowAnonymous]
        public async Task<QuerySingleResult<WebSiteCategoryViewModel>> GetCategoryById(Guid CategoryId)
        {
            var Category = await _CategoryManager.GetCategoryById(CategoryId);
            return _mapper.Map<QuerySingleResult<WebSiteCategoryViewModel>>(Category);
        }

        #endregion
    }
}
