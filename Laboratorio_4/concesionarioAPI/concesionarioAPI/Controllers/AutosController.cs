using concesionarioAPI.Models.Auto;
using concesionarioAPI.Models.Auto.Dto;
using concesionarioAPI.Services;
using concesionarioAPI.Utils.Exceptions;
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
        [ProducesResponseType(typeof(CustomMessage), StatusCodes.Status404NotFound)]
        [ProducesResponseType(typeof(CustomMessage), StatusCodes.Status500InternalServerError)]
        public ActionResult<AutoDTO> Get(int id)
        {
            try
            {
                var auto = _autoServices.GetOneById(id);
                return Ok(auto);

            }
            catch (CustomHttpException ex)
            {
                return StatusCode((int)ex.StatusCode, new CustomMessage(ex.Message));
            }
            catch (Exception ex) { 
                return StatusCode(StatusCodes.Status500InternalServerError, new CustomMessage(ex.Message));
            }
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public ActionResult<Auto> Post([FromBody] CreateAutoDTO createAutoDto)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }
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
        [ProducesResponseType(StatusCodes.Status403Forbidden)]
        [ProducesResponseType(typeof(CustomMessage), StatusCodes.Status404NotFound)]
        public ActionResult<Auto> Put(int id, [FromBody] UpdateAutoDTO updateAutoDto)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }
                var auto = _autoServices.UpdateOneById(id, updateAutoDto);
                return Ok(auto);

            }
            catch (CustomHttpException ex)
            {
                return StatusCode((int)ex.StatusCode, new CustomMessage(ex.Message));
            }
        }

        [HttpDelete("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(CustomMessage), StatusCodes.Status404NotFound)]
        public ActionResult Delete(int id)
        {
            try
            {
                _autoServices.DeleteOneById(id);
                return Ok(new {Message = $"El Auto con el Id = {id} fue eliminado!"});
                // tambien se puede devolver un 'no content 204'
                // return NoContent();

            }
            catch (CustomHttpException ex)
            {
                return StatusCode((int)ex.StatusCode, new CustomMessage(ex.Message));
            }

        }
    }
}
