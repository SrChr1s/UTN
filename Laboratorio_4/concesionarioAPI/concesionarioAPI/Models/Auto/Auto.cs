namespace concesionarioAPI.Models.Auto
{
    public class Auto
    {
        public int Id { get; set; }
        public string Marca { get; set; } = null!;
        public string Modelo { get; set; } = null!;
        public string TipoCombustible { get; set; } = null!;
        public string Transmision { get; set; } = null!;
        public bool TieneEstereo { get; set; }
        public int CantidadPuertas { get; set; }

        public DateTime FechaFabricacion { get; set; } = DateTime.Now;
    }
}
