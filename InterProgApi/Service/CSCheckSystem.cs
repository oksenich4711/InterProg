using System.Collections.Generic;
using System.Threading.Tasks;
using InterProgApi.Core;
using InterProgApi.Models;

namespace InterProgApi.Service
{
    public class CSCheckSystem : ICheckingService
    {
        public async Task<List<CheckResultOutput>> CheckProblem(int TaskId, string ProblemSolution)
        {
            throw new System.NotImplementedException();
        }
    }
}