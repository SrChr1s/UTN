namespace concesionarioAPI.Models.Auto.Dto
{
    public class AutosDTO
    {
        public int Id { get; set; }
        public string Marca { get; set; } = null!;
        public string Modelo { get; set; } = null!;
        public DateTime FechaFabricacion { get; set; } = DateTime.Now;
    }
}
