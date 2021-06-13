using System.Threading.Tasks;

namespace InterProgApi.Core
{
    public interface ICheckingService
    {
         Task CheckProblem(int TaskId, string ProblemSolution);
    }
}