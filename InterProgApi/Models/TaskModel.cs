namespace InterProgApi.Models
{
    public enum Language
    {
        CShart,
        CPP
    }

    public enum CheckResult 
    {
        WA,
        TL,
        WF,
        CE
    }

    public class ProblemModel
    {
        public int ProblemId {get;set;}
        public string ProblemText {get;set;}
        public Language ProblemLanguage {get;set;}
    }
}