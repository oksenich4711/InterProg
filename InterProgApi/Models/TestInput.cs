using System.Collections.Generic;

namespace InterProgApi.Models
{
    public class SingleTestInput
    {
        public string Name { get; set; }
        public List<object> Input { get; set; }
        public List<object> Output { get; set; }
    }

    public class TestInput
    {
        public List<SingleTestInput> Tests { get; set; }
        public string Format { get; set; }
        public int Time { get; set; }
    }
}