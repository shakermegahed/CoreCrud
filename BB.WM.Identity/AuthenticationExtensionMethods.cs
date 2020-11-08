using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Builder;
using System;
using System.Collections.Generic;
using System.Text;

namespace BB.CRM.Identity
{
    public static class AuthenticationExtensionMethods
    {
        public static IApplicationBuilder UseAuthenticationMiddleware(
        this IApplicationBuilder builder)
        {
            return builder.UseMiddleware<AuthenticationMiddleware>();
        }
    }
}
