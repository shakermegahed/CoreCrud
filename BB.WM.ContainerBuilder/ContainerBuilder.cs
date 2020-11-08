using dryve.Domain;
using dryve.Domain.Interfaces;
using dryve.Domain.Services;
using dryve.Entities.DatabaseEntities;
using dryve.Entities.DomainModels;
using dryve.Repository;
using dryve.Repository.Interfaces;
using dryve.Repository.Services;
using dryve.Repository.TypeHandler;
using Dapper;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;

namespace dryve.ContainerBuilder
{
    public class Builder
    {
        public Builder(IServiceCollection services)
        {
           
            SqlMapper.AddTypeHandler(typeof(string[]), new SqlMapperTypeHandler());

            services.AddScoped<IUnitOfWork, UnitOfWork>();

           
            services.AddTransient<IDestinationRepository, DestinationRepository>();
            services.AddTransient<IDestinationManager, DestinationManager>();

          
        }
    }
}
