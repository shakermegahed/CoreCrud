using BB.CRM.Entities.Identity;
using BB.CRM.Repository;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace BB.CRM.Identity
{
    public class RoleStore : IRoleStore<Entities.Identity.ApplicationRole>
    {
        private readonly IRoleRepository _roleRepository;

        public RoleStore(IRoleRepository roleRepository)
        {
            _roleRepository = roleRepository;
        }

        #region [IRoleStore]
        public async Task<IdentityResult> CreateAsync(Entities.Identity.ApplicationRole role, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            role.RoleId = Guid.NewGuid();

            await _roleRepository.Add(role);

            return IdentityResult.Success;
        }

        public async Task<IdentityResult> DeleteAsync(Entities.Identity.ApplicationRole role, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            await _roleRepository.Delete(role.RoleId);

            return IdentityResult.Success;
        }

        public void Dispose()
        {
            // Nothing to Dispose
        }

        public Task<Entities.Identity.ApplicationRole> FindByIdAsync(string roleId, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            if (String.IsNullOrEmpty(roleId))
            {
                return null;
            }

            return _roleRepository.GetById(Guid.Parse(roleId));
        }

        public Task<Entities.Identity.ApplicationRole> FindByNameAsync(string normalizedRoleName, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            if (String.IsNullOrEmpty(normalizedRoleName))
            {
                return null;
            }

            return _roleRepository.GetByRoleName(normalizedRoleName);
        }

        public Task<string> GetNormalizedRoleNameAsync(Entities.Identity.ApplicationRole role, CancellationToken cancellationToken)
        {
            return Task.FromResult(role.NormalizedRoleName);
        }

        public Task<string> GetRoleIdAsync(Entities.Identity.ApplicationRole role, CancellationToken cancellationToken)
        {
            return Task.FromResult(role.RoleId.ToString());
        }

        public Task<string> GetRoleNameAsync(Entities.Identity.ApplicationRole role, CancellationToken cancellationToken)
        {
            return Task.FromResult(role.RoleName);
        }

        public Task SetNormalizedRoleNameAsync(Entities.Identity.ApplicationRole role, string normalizedName, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            role.NormalizedRoleName = normalizedName;

            return Task.FromResult(0);
        }

        public Task SetRoleNameAsync(Entities.Identity.ApplicationRole role, string roleName, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            role.RoleName = roleName;

            return Task.FromResult(0);
        }

        public async Task<IdentityResult> UpdateAsync(Entities.Identity.ApplicationRole role, CancellationToken cancellationToken)
        {
            cancellationToken.ThrowIfCancellationRequested();

            await _roleRepository.Update(role);

            return IdentityResult.Success;
        }
        #endregion       
    }
}
