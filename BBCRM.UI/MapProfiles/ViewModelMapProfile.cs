using AutoMapper;
using dryve.Entities.Common;
using dryve.Entities.DatabaseEntities;
using dryve.Entities.DomainModels;

namespace dryve.MapProfiles
{
    public class ViewModelMapProfile : Profile
    {
        public ViewModelMapProfile()
        {
            // This is required to mam from QuerySingleResult<ModelClass> to QuerySingleResult<ViewModelClass>
            CreateMap(typeof(QuerySingleResult<>), typeof(QuerySingleResult<>));
            CreateMap(typeof(QueryMultipleResult<,>), typeof(QueryMultipleResult<,>));
            CreateMap(typeof(CommandResult<>), typeof(CommandResult<>));
            CreateMap(typeof(CommandResult<>), typeof(CommandResult<>));


                  

            CreateMap<DestinationEntity, DestinationModel>().ReverseMap();
        }
    }
}
