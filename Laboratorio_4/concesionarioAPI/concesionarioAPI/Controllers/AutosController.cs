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
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public ActionResult<Auto> Post([FromBody] CreateAutoDTO createAutoDto)
        {
            try
            {
                var auto = _autoServices.CreateOne(createAutoDto);
                return Created("Auto created", auto);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [HttpPut("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
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
    }
}
