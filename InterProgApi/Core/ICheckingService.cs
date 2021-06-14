using System.Collections.Generic;
using System.Threading.Tasks;
using InterProgApi.Models;

namespace InterProgApi.Core
{
    public interface ICheckingService
    {
         Task<List<CheckResultOutput>> CheckProblem(int TaskId, string ProblemSolution);
    }
}