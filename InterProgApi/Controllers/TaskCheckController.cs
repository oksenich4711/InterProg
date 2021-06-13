using System.Threading.Tasks;
using InterProgApi.Models;
using Microsoft.AspNetCore.Mvc;

namespace InterProgApi.Controllers
{

    [ApiController]
    [Route("[controller]")]
    public class TaskCheckController:ControllerBase
    {
        public TaskCheckController(){}

        [HttpPost("SendTask")]
        public async Task<IActionResult> SendTask([FromBody] ProblemModel ProblemSolution){

            return Ok("api is working");
        }

    }
}