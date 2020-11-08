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
    public class Brand : BaseController
    {
        #region[vars]
        private readonly IMapper _mapper;
        private readonly IWebSiteBrandManager _brandManager;
        #endregion

        #region[ctor]
        public Brand(IMapper mapper, IWebSiteBrandManager brandManager, IHostingEnvironment hostingEnvironment) : base(hostingEnvironment)
        {
            _mapper = mapper;
            _brandManager = brandManager;
        }
        #endregion

        #region[actions]
        [HttpPost]
        public async Task<CommandResult<Guid>> CreateBrand([FromBody]CreateBrandViewModel viewModel)
        {
            var createBrandModel = _mapper.Map<WebSiteBrandModel>(viewModel);
            var result = await _brandManager.CreateBrand(createBrandModel);
            if (result.IsSucceeded)
            {
                this.ConfirmFileAdded(createBrandModel.ImageFile);
            }
            return result;
        }

        [HttpPut]
        public async Task<CommandResult<bool>> UpdateBrand([FromBody]UpdateBrandViewModel viewModel)
        {
            var updateBrandModel = _mapper.Map<WebSiteBrandModel>(viewModel);
            var result = await _brandManager.UpdateBrand(updateBrandModel);
            if (result.IsSucceeded)
            {
                this.ConfirmFileAdded(updateBrandModel.ImageFile);
            }
            return result;
        }

        [HttpDelete("{BrandId}")]
        public async Task<CommandResult<Boolean>> Delete(Guid BrandId)
        {

            return await _brandManager.DeleteBrand(BrandId);
        }

        [HttpGet("Restore/{BrandId}")]
        public async Task<CommandResult<Boolean>> Restore(Guid BrandId)
        {

            return await _brandManager.RestoreBrand(BrandId);
        }

        [HttpGet("AllBrands")]
        public async Task<QueryMultipleResult<IEnumerable<WebSiteBrandViewModel>, WebSiteBrandViewModel>> GetAll()
        {
            var Brands = await _brandManager.GetBrandsByWebSite();
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSiteBrandViewModel>, WebSiteBrandViewModel>>(Brands);
        }

        [HttpGet("BrandsByDoamin/{webSiteDomain}")]
        [AllowAnonymous]
        public async Task<QueryMultipleResult<IEnumerable<WebSiteBrandViewModel>, WebSiteBrandViewModel>> GetBrandByWebSiteDomain(string webSiteDomain)
        {
            var Brands = await _brandManager.GetBrandsByWebSiteDomain(webSiteDomain);
            return _mapper.Map<QueryMultipleResult<IEnumerable<WebSiteBrandViewModel>, WebSiteBrandViewModel>>(Brands);
        }

        [HttpGet("{BrandId}")]
        [AllowAnonymous]
        public async Task<QuerySingleResult<WebSiteBrandViewModel>> GetBrandById(Guid BrandId)
        {
            var Brand = await _brandManager.GetBrandById(BrandId);
            return _mapper.Map<QuerySingleResult<WebSiteBrandViewModel>>(Brand);
        }

        #endregion
    }
}
