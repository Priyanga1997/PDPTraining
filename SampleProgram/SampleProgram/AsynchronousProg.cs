using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace SampleProgram
{
    public class AsynchronousProg
    {
        public async Task FirstMethod()
        {
            await Task.Run(() =>
            {
                for (int i = 0; i < 5; i++)
                {
                    Task.Delay(10).Wait();
                    Console.WriteLine("First method");
                }
            });
        }
        public async Task SecondMethod()
        {
            await Task.Run(() =>
            {
                for (int j = 0; j < 5; j++)
                {
                    Task.Delay(20).Wait();
                    Console.WriteLine("Second method");
                }
            });
        }
    }
}
