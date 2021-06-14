using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using InterProgApi.Core;
using InterProgApi.Models;
using Newtonsoft.Json;

namespace InterProgApi.Service
{
    public class CPPCheckSystem : ICheckingService
    {
        public async Task<List<CheckResultOutput>> CheckProblem(int TaskId, string ProblemSolutionText)
        {

            List<CheckResultOutput> results = new List<CheckResultOutput>();

            var task = Task.Run<List<CheckResultOutput>>(() =>
            {
               // Console.WriteLine(ProblemSolutionText);

                bool isTerminatedByRuntimeError = false;
                CheckResultOutput terminatedRes = null;

                //here we should read json from db
                TestInput test = JsonConvert.DeserializeObject<TestInput>(File.ReadAllText($@"TaskTests\Task{TaskId}.json"));

                string filename = Path.GetRandomFileName();
                string extension = Path.GetExtension(filename);
                filename = filename.Replace(extension, ".cpp");

                string path = @"TaskBuilds\" + filename;

                if (File.Exists(path))
                {
                    File.Delete(path);
                }

                using (FileStream fs = File.Create(path))
                {
                    Byte[] title = new UTF8Encoding(true).GetBytes(ProblemSolutionText);
                    fs.Write(title, 0, title.Length);
                }

                Process process = new Process();
                extension = Path.GetExtension(filename);
                string initFileName = filename.Replace(extension, "");
                process.StartInfo.RedirectStandardOutput = true;
                process.StartInfo.RedirectStandardError = true;
                process.StartInfo.UseShellExecute = false;
                process.StartInfo.CreateNoWindow = true;
                process.StartInfo.FileName = "CppCompiler\\bin\\g++";
                process.StartInfo.Arguments = $"-o TaskBuildsExe\\{initFileName} {path}";

                process.Start();

                process.WaitForExit();

                string buildOutput = process.StandardError.ReadToEnd();

                if (File.Exists($"TaskBuildsExe\\{initFileName}.exe"))
                {

                    for (int t = 0; t < test.Tests.Count; t++)
                    {
                        Process processExec = new Process();
                        processExec.StartInfo.FileName = $"TaskBuildsExe\\{initFileName}.exe";
                        processExec.StartInfo.Arguments = "";


                        processExec.StartInfo.RedirectStandardOutput = true;
                        processExec.StartInfo.RedirectStandardInput = true;
                        processExec.StartInfo.RedirectStandardError = true;
                        processExec.StartInfo.UseShellExecute = false;
                        processExec.StartInfo.CreateNoWindow = true;

                        processExec.ErrorDataReceived += new DataReceivedEventHandler((object sendingProcess, DataReceivedEventArgs errLine) =>
                        {
                            terminatedRes = new CheckResultOutput()
                            {
                                Result = CheckResult.RE,
                                Message = errLine.Data,
                                Content = buildOutput
                            };
                            isTerminatedByRuntimeError = true;

                        });

                        processExec.Start();

                        StreamWriter processInput = processExec.StandardInput;


                        //write input tests

                        foreach (var testInputVal in test.Tests[t].Input)
                        {
                            string input = testInputVal.ToString();
                            processInput.WriteLine(input);
                        }

                        string result = processExec.StandardOutput.ReadToEnd();
                        System.Console.WriteLine(result);
                        //chcek for output                
                        string pattern = test.Format;
                        RegexOptions options = RegexOptions.Multiline;
                        MatchCollection matchCollection = Regex.Matches(result, pattern, options);

                        bool isFormatCorrect = true;

                        if (matchCollection.Count == 0)
                        {
                            File.Delete($"{path}");
                            results.Add(new CheckResultOutput()
                            {
                                Result = CheckResult.WF,
                                Message = $"Wrong output format",
                                Content = buildOutput
                            });
                            isFormatCorrect = false;
                        }
                        else
                        {
                            int allOutputsCount = matchCollection.Count * matchCollection[0].Captures.Count;


                            if (allOutputsCount != test.Tests[t].Output.Count)
                            {
                                File.Delete($"{path}");
                                results.Add(new CheckResultOutput()
                                {
                                    Result = CheckResult.WF,
                                    Message = "Wrong output format",
                                    Content = buildOutput
                                });
                                isFormatCorrect = false;
                            }
                        }

                        for (int i = 0; i < matchCollection.Count && isFormatCorrect; i++)
                        {
                            if (isTerminatedByRuntimeError)
                            {
                                results.Add(terminatedRes);
                            }

                            bool isAnswearCorrect = true;

                            for (int j = 1; j <= test.Tests[t].Output.Count; j++)
                            {

                                string output = matchCollection[i].Groups[$"{j}"].Value;
                                string expected = test.Tests[t].Output[j - 1].ToString();


                                if (!output.Equals(expected))
                                {
                                    isAnswearCorrect = false;
                                    File.Delete($"{path}");
                                    results.Add(new CheckResultOutput()
                                    {
                                        Result = CheckResult.WA,
                                        Message = "Wrong Answear, " + test.Tests[t].Name,
                                        Content = buildOutput
                                    });
                                    break;
                                }
                                else
                                {
                                    results.Add(new CheckResultOutput()
                                    {
                                        Result = CheckResult.OK,
                                        Message = "Answear is correct " + test.Tests[t].Name,
                                        Content = buildOutput
                                    });
                                }
                            }
                            if (!isAnswearCorrect)
                                break;
                        }

                        processExec.WaitForExit();
                    }
                    File.Delete($"TaskBuildsExe\\{initFileName}.exe");
                }
                else
                {
                    File.Delete($"{path}");
                    results.Add(new CheckResultOutput()
                    {
                        Message = "Failur",
                        Result = CheckResult.CE,
                        Content = buildOutput
                    });
                }

                File.Delete($"{path}");

                return results;
            });

            return await task;
        }
    }
}