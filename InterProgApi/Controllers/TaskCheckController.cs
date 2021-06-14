using System.Collections.Generic;
using System.Threading.Tasks;
using InterProgApi.Core;
using InterProgApi.helpers;
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
        public async Task<IActionResult> SendTask([FromBody] ProblemModel problemSolution)
        {
            ICheckingService checkService = CheckSystemGenerator.GetCheckingSystem(problemSolution.ProblemLanguage);
            if(checkService == null)
                return BadRequest("The language is unsupported");

            List<CheckResultOutput> checkResult = await checkService.CheckProblem(problemSolution.ProblemId,problemSolution.ProblemText);
            //update db?
            return Ok(checkResult);
        }

    }
}