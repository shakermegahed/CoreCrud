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

namespace BB.CRM.WebApi.Controllers.WebSite
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    [Authorize]
    public class Product : BaseController
    {
        private readonly IProductManager _productManager;
        private readonly IMapper _mapper;
        private readonly IAccountInfo _accountInfo;

        public Product(IHostingEnvironment hostingEnvironment, IProductManager productManager, IMapper mapper, IAccountInfo accountInfo) : base(hostingEnvironment)
        {
            _productManager = productManager;
            _mapper = mapper;
            _accountInfo = accountInfo;
        }

        #region[actions]
        [HttpPost]
        public async Task<CommandResult<Guid>> CreateProduct([FromBody] CreateProductViewModel viewModel)
        {
            var createProductModel = _mapper.Map<ProductModel>(viewModel);
            var result = await _productManager.CreateProduct(createProductModel);
            if (result.IsSucceeded)
                foreach (var img in viewModel.Images)
                    this.ConfirmImageAdded(img);

            return result;
        }

        [HttpPut]
        public async Task<CommandResult<Boolean>> UpdateProduct([FromBody] UpdateProductViewModel viewModel)
        {
            var updateModel = _mapper.Map<ProductModel>(viewModel);

            var result = await _productManager.UpdateProduct(updateModel);
            if (result.IsSucceeded)
                foreach (var img in viewModel.Images)
                    this.ConfirmImageAdded(img);

            return result;
        }

        [HttpDelete("delete/{productId}")]
        public async Task<CommandResult<Boolean>> Delete(Guid productId)
        {

            return await _productManager.DeleteProduct(productId);
        }

        [HttpGet("restore/{productId}")]
        public async Task<CommandResult<Boolean>> Restore(Guid productId)
        {

            return await _productManager.RestoreProduct(productId);
        }

        [HttpGet("GetByWebsiteDomain/{pageSize}/{pageNumber}")]
        [AllowAnonymous]
        public async Task<QueryMultipleResult<IEnumerable<ProductViewModel>, ProductViewModel>> GetAllByDomain([FromQuery] string webSiteDomian, [FromRoute] int pageSize, [FromRoute] int pageNumber)
        {
            var products = await _productManager.GetProductByWebSiteDoamin(webSiteDomian, new PagedQueryParameters(pageSize, pageNumber));
            return _mapper.Map<QueryMultipleResult<IEnumerable<ProductViewModel>, ProductViewModel>>(products);
        }

        [HttpGet("GetByWebsiteId/{pageSize}/{pageNumber}")]
        public async Task<QueryMultipleResult<IEnumerable<ProductViewModel>, ProductViewModel>> GetAllByWebSite([FromRoute] int pageSize, [FromRoute] int pageNumber)
        {
            var products = await _productManager.GetProductByWebSiteId(new PagedQueryParameters(pageSize, pageNumber));
            return _mapper.Map<QueryMultipleResult<IEnumerable<ProductViewModel>, ProductViewModel>>(products);
        }

        [HttpGet("AdminGetByCategoryId/{categoryId}")]
        public async Task<QueryMultipleResult<IEnumerable<ProductViewModel>, ProductViewModel>> GetProductByCategory(Guid categoryId)
        {
            var products = await _productManager.GetProductByCategoryId(categoryId,isDeleted: null);
            return _mapper.Map<QueryMultipleResult<IEnumerable<ProductViewModel>, ProductViewModel>>(products);
        }

        [HttpGet("PublicGetByCategoryId/{categoryId}")]
        [AllowAnonymous]
        public async Task<QueryMultipleResult<IEnumerable<ProductViewModel>, ProductViewModel>> PublicGetProductByCategory(Guid categoryId)
        {
            var products = await _productManager.GetProductByCategoryId(categoryId, isDeleted: false);
            return _mapper.Map<QueryMultipleResult<IEnumerable<ProductViewModel>, ProductViewModel>>(products);
        }

        [HttpGet("{productId}")]
        public async Task<QuerySingleResult<ProductViewModel>> GetById(Guid productId)
        {
            var product = await _productManager.GetById(productId);
            return _mapper.Map<QuerySingleResult<ProductViewModel>>(product);
        }
        #endregion
    }
}
