using AutoMapper;
using BB.CRM.Entities.Common;
using BB.CRM.Entities.DatabaseEntities;
using BB.CRM.Entities.DomainModels;
using BB.CRM.WebApi.ViewModels;

namespace BB.CRM.WebApi.MapProfiles
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
            CreateMap<DestinationModel, DestinationViewModel>().ReverseMap();
            CreateMap<DestinationModel, CreateDestinationViewModel>().ReverseMap();
            CreateMap<DestinationModel, UpdateDestinationViewModel>().ReverseMap();

          

        }
    }
}
