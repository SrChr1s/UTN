using System.ComponentModel.DataAnnotations;

namespace concesionarioAPI.Models.Transmision.Dto
{
    public class UpdateTransmisionDTO
    {
        [MaxLength(30)]
        public string? Nombre { get; set; }
    }
}
