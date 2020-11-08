using System;
using AutoMapper;
using Microsoft.Extensions.DependencyInjection;

namespace dryve.Extensions
{
    public static class AutoMapperSetup
    {
        public static void AddAutoMapperSetup(this IServiceCollection services)
        {
            if (services == null) throw new ArgumentNullException(nameof(services));

           // services.AddAutoMapper();

            // Registering Mappings automatically only works if the 
            // Automapper Profile classes are in ASP.NET project
            AutoMapperConfig.RegisterMappings();
        }

        public class AutoMapperConfig
        {
            public static MapperConfiguration RegisterMappings()
            {
                return new MapperConfiguration(cfg =>
                {
                    //cfg.AddProfile(new DomainToViewModelMappingProfile());
                   // cfg.AddProfile(new ViewModelToDomainMappingProfile());
                });
            }
        }
    }
}