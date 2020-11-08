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


namespace BB.CRM.WebApi.Controllers
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    public class Account : Controller
    {
        #region[vars]
        private readonly IAccountManager _accountManager;
        private readonly IHostingEnvironment _hostingEnvironment;
        private readonly IMapper _mapper;
        #endregion

        #region[ctor]
        public Account(IAccountManager accountManager,
                       IHostingEnvironment hostingEnvironment,
                        IMapper mapper)
        {
            _accountManager = accountManager;
            _hostingEnvironment = hostingEnvironment;
            _mapper = mapper;
        }
        #endregion

        #region[actions]
        [HttpGet("AllClients/{pageSize}/{pageNumber}")]
        [Authorize(Roles = AdministratorRoles.Admin_Role)]
        public async Task<QueryMultipleResult<IEnumerable<AccountViewModel>, AccountViewModel>> GetAllClients([FromQuery]string clientName, [FromRoute] int pageSize, [FromRoute] int pageNumber)
        {
            var clients = await _accountManager.GetAll(clientName, AdministratorRoles.Client_Role, new PagedQueryParameters(pageSize, pageNumber));
            return _mapper.Map<QueryMultipleResult<IEnumerable<AccountViewModel>, AccountViewModel>>(clients);
        }

        [HttpGet("AllAdmins/{pageSize}/{pageNumber}")]
        [Authorize(Roles = AdministratorRoles.Admin_Role)]
        public async Task<QueryMultipleResult<IEnumerable<AccountViewModel>, AccountViewModel>> GetAllAdmins([FromQuery]string adminName, [FromRoute] int pageSize, [FromRoute] int pageNumber)
        {
            var admins = await _accountManager.GetAll(adminName, AdministratorRoles.Admin_Role, new PagedQueryParameters(pageSize, pageNumber));
            return _mapper.Map<QueryMultipleResult<IEnumerable<AccountViewModel>, AccountViewModel>>(admins);
        }

        [HttpPost("CreateClient")]
        [Authorize(Roles = AdministratorRoles.Admin_Role)]
        public async Task<CommandResult<Guid>> CreateClient([FromBody] CreateAccountViewModel accountViewModel)
        {
            var createAccountCommandModel = _mapper.Map<AccountModel>(accountViewModel);
            createAccountCommandModel.AccountRole = AdministratorRoles.Client_Role;
            return await _accountManager.CreateAccount(createAccountCommandModel);
        }

        [HttpPost("CreateAdmin")]
        [Authorize(Roles = AdministratorRoles.Admin_Role)]
        public async Task<CommandResult<Guid>> CreateAdmin([FromBody] CreateAccountViewModel accountViewModel)
        {
            var createAccountCommandModel = _mapper.Map<AccountModel>(accountViewModel);
            createAccountCommandModel.AccountRole = AdministratorRoles.Admin_Role;
            return await _accountManager.CreateAccount(createAccountCommandModel);
        }

        [HttpPost("Client/login")]
        public async Task<QuerySingleResult<string>> ClientLogin([FromBody] LoginViewModel loginViewModel)
        {
            try
            {
                return await _accountManager.PublicLogin(_mapper.Map<LoginModel>(loginViewModel));
            }
            catch (Exception ex)
            {
                return new QuerySingleResult<string>(ex.Message);
            }
        }

        [HttpPost("Admin/login")]
        public async Task<QuerySingleResult<string>> AdminLogin([FromBody] LoginViewModel loginViewModel)
        {
            try
            {
                return await _accountManager.AdminLogin(_mapper.Map<LoginModel>(loginViewModel));
            }
            catch (Exception ex)
            {
                return new QuerySingleResult<string>(ex.Message);
            }
        }

        [HttpPut]
        public async Task<CommandResult<bool>> UpdateAccount([FromBody] UpdateAccountViewModel accountViewModel)
        {
            var createAccountCommandModel = _mapper.Map<AccountModel>(accountViewModel);
            return await _accountManager.UpdateAccount(createAccountCommandModel);
        }


        [HttpGet("select-website/{websiteId}")]
        [Authorize]
        public async Task<QuerySingleResult<string>> SelectWebsite([FromRoute] Guid websiteId)
        {
            try
            {
                return await _accountManager.SelectWebsite(websiteId);
            }
            catch (Exception ex)
            {
                return new QuerySingleResult<string>(ex.Message);
            }
        }

        [Authorize]
        [HttpPost("change-password")]
        public async Task<CommandResult<bool>> ChangePassword([FromBody]ChangePasswordModel changePassword)
        {
            try
            {
                return await _accountManager.ChangePassword(changePassword.CurrentPassword, changePassword.NewPassword);
            }
            catch (Exception ex)
            {
                return new CommandResult<bool>(ex.Message);
            }
        }
        #endregion
    }
}
