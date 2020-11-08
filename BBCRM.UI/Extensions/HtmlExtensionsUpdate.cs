using System.Text.RegularExpressions;
using Microsoft.AspNetCore.Html;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace dryve.Extensions
{
    public static class HtmlExtensionsUpdate
    {
        private static readonly HtmlContentBuilder _emptyBuilder = new HtmlContentBuilder();

        public static IHtmlContent BuildBreadcrumbNavigation(this IHtmlHelper helper)
        {
            if (helper.ViewContext.RouteData.Values["controller"].ToString() == "Home")
            {
                return _emptyBuilder;
            }

            string controllerName = helper.ViewContext.RouteData.Values["controller"].ToString();
            string actionName = helper.ViewContext.RouteData.Values["action"].ToString();

            var controllerAlias = "";


            if (controllerName == "OperationTypes")
            {
                controllerAlias = controllerName.Replace("OperationTypes", "Operation Types");
            }
            else if (controllerName == "LoginLog")
            {
                controllerAlias = "Login Times";
            }
            else
            {
                controllerAlias = controllerName;
            }

            if (!controllerName.Titleize().EndsWith("s"))
            {
                controllerAlias = controllerName + "s";
            }

            var breadcrumb = new HtmlContentBuilder()
                                .AppendHtml("<ol class='breadcrumb'><li class='breadcrumb-item'>")
                                .AppendHtml(helper.ActionLink("Home", "Index", "Home"))
                                .AppendHtml("</li><li class='breadcrumb-item'>")
                                .AppendHtml(helper.ActionLink(controllerAlias.Titleize(),
                                                          "Index", controllerName))
                                .AppendHtml("</li>");


            if (helper.ViewContext.RouteData.Values["action"].ToString() != "Index" && controllerName != "Reports")
            {
                breadcrumb.AppendHtml("<li class='breadcrumb-item'>")
                          .AppendHtml(helper.ActionLink(actionName.Titleize().Replace("Operationsreport", "Operations Report"), actionName, controllerName))
                          .AppendHtml("</li>");
            }

            return breadcrumb.AppendHtml("</ol>");
        }
    }
}