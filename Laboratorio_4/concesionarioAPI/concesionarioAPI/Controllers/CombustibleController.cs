using concesionarioAPI.Models.Combustible;
using concesionarioAPI.Models.Combustible.Dto;
using concesionarioAPI.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace concesionarioAPI.Controllers
{
    [Route("api/combustibles")]
    [ApiController]
    public class CombustibleController : ControllerBase
    {
        private readonly CombustibleServices _combustibleServices;

        public CombustibleController(CombustibleServices combustibleServices)
        {
            _combustibleServices = combustibleServices;
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public ActionResult<List<Combustible>> Get()
        {
            var combustibles = _combustibleServices.GetAll();
            return Ok(combustibles);
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public ActionResult<Combustible> Get(int id)
        {
            try
            {
                var combustible = _combustibleServices.GetOneById(id);
                return Ok(combustible);

            }
            catch
            {
                return NotFound(new { Message = $"No se econtro el combustible con Id = {id}" });
            }
        }

        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status403Forbidden)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public ActionResult<Combustible> Post([FromBody] CreateCombustibleDTO createCombustibleDto)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }
                var combustible = _combustibleServices.CreateOne(createCombustibleDto);
                return Created(nameof(Post), combustible);

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

        }

        [HttpPut("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status403Forbidden)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public ActionResult<Combustible> Put(int id, [FromBody] UpdateCombustibleDTO updateCombustibleDTO)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest(ModelState);
                }
                var combustible = _combustibleServices.UpdateOneById(id, updateCombustibleDTO);
                return Ok(combustible);

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
                _combustibleServices.DeleteOneById(id);
                return Ok(new { Message = $"El Combustible con el Id = {id} fue eliminado!" });

            }
            catch (Exception ex)
            {
                return NotFound(ex.Message);
            }

        }
    }
}
