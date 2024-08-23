using System.ComponentModel.DataAnnotations;

namespace concesionarioAPI.Models.Transmision.Dto
{
    public class CreateTransmisionDTO
    {
        [Required]
        [MaxLength(30)]
        public string Nombre { get; set; } = null!;
    }
}
