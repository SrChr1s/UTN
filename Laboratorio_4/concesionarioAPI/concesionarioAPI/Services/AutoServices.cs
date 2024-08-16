using concesionarioAPI.Models.Auto;
using concesionarioAPI.Models.Auto.Dto;
using System.Net;
using System.Runtime.CompilerServices;
using System.Web.Http;

namespace concesionarioAPI.Services
{
    public class AutoServices
    {
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
            return autos.Select(auto => new AutosDTO
            {
                Id = auto.Id,
                Marca = auto.Marca,
                Modelo = auto.Modelo,
                FechaFabricacion = auto.FechaFabricacion
            }).ToList();
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
            int lastIndex = GetAll().Last().Id;
            Auto auto = new Auto
            {
                Id = lastIndex + 1,
                Marca = createAutoDto.Marca,
                Modelo = createAutoDto.Modelo,
                TipoCombustible = createAutoDto.TipoCombustible,
                Transmision = createAutoDto.Transmision,
                TieneEstereo = createAutoDto.TieneEstereo,
                CantidadPuertas = createAutoDto.CantidadPuertas
            };
            
            autos.Add(auto);
            
            return auto;
        }

        public Auto UpdateOneById(int id, UpdateAutoDTO updateAutoDto)
        {
            var auto = GetOneById(id);

            if (updateAutoDto.TipoCombustible != null)
            {
                auto.TipoCombustible = updateAutoDto.TipoCombustible;
            }
            if (updateAutoDto.TieneEstereo != null)
            {
                auto.TieneEstereo = (bool)updateAutoDto.TieneEstereo;
            }
            if (updateAutoDto.CantidadPuertas != null)
            {
                auto.CantidadPuertas = (int)updateAutoDto.CantidadPuertas;
            }

            return auto;
        }

        public Auto DeleteOneById(int id)
        {

        }
    }
}
