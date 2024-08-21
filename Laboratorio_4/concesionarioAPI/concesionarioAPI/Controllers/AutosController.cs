using concesionarioAPI.Models.Auto;
using concesionarioAPI.Models.Auto.Dto;
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
        public ActionResult<List<AutosDTO>> Get()
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

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public ActionResult<Auto> Post([FromBody] CreateAutoDTO createAutoDto)
        {
            try
            {
                var auto = _autoServices.CreateOne(createAutoDto);
                // EL primer parametro del 'Created' es para decirce donde se creo el recurso.
                // La función nameof() obtiene el punto de entrada de lo que pasemos y devuelve una cadena de texto.
                // Tranquilamente le podemos pasar un texto: Created("Auto created", auto);
                return Created(nameof(Post), auto);

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }

        [HttpPut("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public ActionResult<Auto> Put(int id, [FromBody] UpdateAutoDTO updateAutoDto)
        {
            try
            {
                var auto = _autoServices.UpdateOneById(id, updateAutoDto);
                return Ok(auto);

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public ActionResult Delete(int id)
        {
            try
            {
                _autoServices.DeleteOneById(id);
                return Ok(new {Message = $"El Auto con el Id = {id} fue eliminado!"});
                // tambien se puede devolver un 'no content 204'
                // return NoContent();

            }
            catch (Exception ex)
            {
                return NotFound(ex.Message);
            }

        }
    }
}
