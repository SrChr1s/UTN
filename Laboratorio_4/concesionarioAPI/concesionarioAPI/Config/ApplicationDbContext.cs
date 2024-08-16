using concesionarioAPI.Models.Auto;
using Microsoft.EntityFrameworkCore;

namespace concesionarioAPI.Config
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options) { }
        public DbSet<Auto> Autos {  get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Auto>().HasData(
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
            );
        }
    }
}
