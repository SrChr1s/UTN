using concesionarioAPI.Models;
using concesionarioAPI.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace concesionarioAPI.Controllers
{
    [Route("api/autos")]
    [ApiController]
    public class AutosController : ControllerBase
    {
        private readonly AutoServices _autoServices;
        public AutosController()
        {
            _autoServices = new AutoServices();
        }


        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<List<Auto>> Get()
        { 
            var autos = _autoServices.GetAll();
            return Ok(autos);
        }

        /*
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public ActionResult<Auto> GetOne()
        {
            bool result = false;
            var auto = new Auto
            {
                Marca = "Ford",
                Modelo = "Ka",
                CantPuertas = 1,
                Transmision = "Manual",
                TipoCombustible = "Diesel",
                TieneEstereo = false
            };
            if (result)
            {
                return Ok(auto);
            }
            else
            {
                return NotFound(new { Message = "El Auto no se encontró!" });
            }
        }
        */

    }
}
