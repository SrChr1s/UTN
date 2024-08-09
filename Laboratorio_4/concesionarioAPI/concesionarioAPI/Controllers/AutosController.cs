using concesionarioAPI.Models;
using concesionarioAPI.Services;
using Microsoft.AspNetCore.Mvc;

namespace concesionarioAPI.Controllers
{
    [Route("api/autos")]
    [ApiController]
    public class AutosController : ControllerBase
    {
        private readonly AutoServices _autoServices;
        public AutosController(AutoServices autoServices) {
            _autoServices = autoServices;
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<List<Auto>> Get()
        {
            var autos = _autoServices.GetAll();
            return Ok(autos);
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public ActionResult<Auto> Get(int id)
        {
            try
            {
                var auto = _autoServices.GetOneById(id);
                return Ok(auto);

            }
            catch
            {
                return NotFound(new { Message = $"No se econtro el auto con Id = {id}" });
            }

        }
    }
}
