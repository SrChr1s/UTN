using concesionarioAPI.Models;

namespace concesionarioAPI.Services
{
    public class AutoServices
    {
        public static List<Auto> autos = new List<Auto>
        {
            new Auto
            {
                Marca = "Ford",
                Modelo = "Ka",
                CantPuertas = 4,
                TieneEstereo = true,
                TipoCombustible = "Diesel",
                Transmision = "Manual"
            },
            new Auto
            {
                Marca = "Toyota",
                Modelo = "Corolla",
                CantPuertas = 4,
                TieneEstereo = true,
                TipoCombustible = "Diesel",
                Transmision = "Manual"
            }
        };

        public List<Auto> GetAll()
        {
            return autos;
        }
    }
}
