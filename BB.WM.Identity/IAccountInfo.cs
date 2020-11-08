using System;
using System.Collections.Generic;
using System.Text;

namespace BB.CRM.Identity
{
    public interface IAccountInfo
    {
        bool IsAuthenticated();
        Guid Id { get; }
        string Email { get; }
        string Name { get; }
        bool IsInRole(string role);
        string Role { get; }
        Guid WebsiteId { get; }
    }
}
