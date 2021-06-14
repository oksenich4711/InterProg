namespace InterProgApi.Models
{
    public enum Language
    {
        CSharp,
        CPP
    }

    public enum CheckResult 
    {
        WA,
        TL,
        WF,
        CE,
        RE,
        OK
    }

    public class ProblemModel
    {
        public int ProblemId {get;set;}
        public string ProblemText {get;set;}
        public Language ProblemLanguage {get;set;}
    }
}