using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace dryve.Extensions
{
    public static class EnumConversions
    {
        public static IList<SelectListItem> SelectListFor<TEnum>(this Type enumType)
        {
            if (!enumType.IsEnum)
                return null;

            return Enum.GetValues(enumType).Cast<int>()
            .Select(e => new SelectListItem()
            {
                Value = e.ToString(),
                Text = Enum.GetName(typeof(TEnum), e).Replace("_", " ")
            })
            .ToList();
        }
    }
}