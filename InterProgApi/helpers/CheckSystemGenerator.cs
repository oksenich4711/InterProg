using InterProgApi.Core;
using InterProgApi.Models;
using InterProgApi.Service;

namespace InterProgApi.helpers
{
    public class CheckSystemGenerator
    {
        public static ICheckingService GetCheckingSystem(Language language)
        {
            switch (language)
            {
                case Language.CPP:
                    return new CPPCheckSystem();
                case Language.CSharp:
                    return null;
                    //return new CSCheckSystem();
                default:
                    return null;
            }
        }
    }
}