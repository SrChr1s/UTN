using AutoMapper;
using concesionarioAPI.Models.Auto;
using concesionarioAPI.Models.Auto.Dto;
using System.Net;
using System.Web.Http;

namespace concesionarioAPI.Services
{
    public class AutoServices
    {
        private readonly IMapper _mapper;

        public AutoServices(IMapper mapper)
        {
            _mapper = mapper;
        }

        public static List<Auto> autos = new List<Auto>
        {
            new Auto
            {
                Id = 1,
                Marca = "Toyota",
                Modelo = "Corolla",
                TipoCombustible = "Gasolina",
                Transmision = "Automática",
                TieneEstereo = true,
                CantidadPuertas = 4,
                FechaFabricacion = new DateTime(2020, 5, 14)
            },
            new Auto
            {
                Id = 2,
                Marca = "Honda",
                Modelo = "Civic",
                TipoCombustible = "Gasolina",
                Transmision = "Manual",
                TieneEstereo = true,
                CantidadPuertas = 4,
                FechaFabricacion = new DateTime(2019, 7, 21)
            },
            new Auto
            {
                Id = 3,
                Marca = "Ford",
                Modelo = "Focus",
                TipoCombustible = "Diesel",
                Transmision = "Automática",
                TieneEstereo = false,
                CantidadPuertas = 4,
                FechaFabricacion = new DateTime(2021, 3, 10)
            },
            new Auto
            {
                Id = 4,
                Marca = "Chevrolet",
                Modelo = "Cruze",
                TipoCombustible = "Gasolina",
                Transmision = "Automática",
                TieneEstereo = true,
                CantidadPuertas = 4,
                FechaFabricacion = new DateTime(2022, 11, 5)
            },
            new Auto
            {
                Id = 5,
                Marca = "Volkswagen",
                Modelo = "Golf",
                TipoCombustible = "Gasolina",
                Transmision = "Manual",
                TieneEstereo = false,
                CantidadPuertas = 4,
                FechaFabricacion = new DateTime(2018, 2, 28)
            }
        };

        public List<AutosDTO> GetAll()
        {
            return _mapper.Map<List<AutosDTO>>(autos);
        }

        public Auto GetOneById(int id)
        {
            var auto = autos.FirstOrDefault(auto => auto.Id == id);
            if (auto == null)
            {
                throw new HttpResponseException(HttpStatusCode.NotFound);
            }
            return auto;
        }

        public Auto CreateOne(CreateAutoDTO createAutoDto)
        {
            int LastIndex = GetAll().Last().Id;
            var auto = _mapper.Map<Auto>(createAutoDto);
            auto.Id = LastIndex + 1;

            autos.Add(auto);
            return auto;
        }

        public Auto UpdateOneById(int id, UpdateAutoDTO updateAutoDto)
        {
            var auto = GetOneById(id);

            var autoMapped = _mapper.Map(updateAutoDto, auto);

            return autoMapped;
        }

        public void DeleteOneById(int id)
        {
            Auto auto = GetOneById(id);
            autos.Remove(auto);
        }
    }
}
