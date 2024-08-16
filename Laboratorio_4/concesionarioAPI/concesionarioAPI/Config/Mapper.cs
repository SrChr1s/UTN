using AutoMapper;
using concesionarioAPI.Controllers;
using concesionarioAPI.Models.Auto;
using concesionarioAPI.Models.Auto.Dto;

namespace concesionarioAPI.Config
{
    public class Mapper : Profile
    {
        public Mapper() {
            CreateMap<Auto, AutosDTO>().ReverseMap();
            CreateMap<CreateAutoDTO, Auto>().ReverseMap();
            // ...
            CreateMap<UpdateAutoDTO, Auto>().ForAllMembers(opts => opts.Condition((_, _, srcMember) => srcMember != null));
            
        }
    }
}
