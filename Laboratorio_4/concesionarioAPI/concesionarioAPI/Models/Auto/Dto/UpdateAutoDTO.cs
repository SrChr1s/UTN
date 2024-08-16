namespace concesionarioAPI.Models.Auto.Dto
{
    // Este DTO se utilzará para actualizar los datos. Con el signo de pregunta (?) indicamos que el campo puede ser opcional o nulo.
    public class UpdateAutoDTO
    {
        public string? Marca { get; set; }
        public string? Modelo { get; set; }
        public string? TipoCombustible { get; set; }
        public string? Transmision { get; set; }
        public bool? TieneEstereo { get; set; }
        public int? CantidadPuertas { get; set; }
    }
}
