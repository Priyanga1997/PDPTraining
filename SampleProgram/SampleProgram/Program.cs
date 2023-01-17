using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace SampleProgram
{
    public delegate void SampleDelegate();
    public class Program
    {
        static async Task Main(string[] args)
        {
            //Generic collection
            List<string> names = new List<string>();
            names.Add("a");
            names.Add("b");
            names.Add("c");
            foreach (string namelist in names)
            {
                Console.WriteLine(namelist);
            }

            //Non-generic collection
            ArrayList namesList = new ArrayList();
            namesList.Add("a");
            namesList.Add(100);
            namesList.Add("c");
            foreach (var item in namesList)
            {
                Console.WriteLine(item);
            }
            Program program = new Program();
            string[] nameList = { "a", "b", "c" };
            program.GetCollection(nameList);

            //Delegates
            SampleDelegate sampledelegate = new SampleDelegate(Delegates.MethodOne);
            sampledelegate += Delegates.MethodTwo;
            sampledelegate += Delegates.MethodThree;
            sampledelegate();

            //Nullable types
            int? a = null;
            int b = a ?? 9;
            Console.WriteLine(b);

            int? i = 2;
            int j = i ?? 9;
            Console.WriteLine(j);

            string? name = "ab";
            string result = name ?? "cd";
            Console.WriteLine(result);

            //Asynchronous Programming
            AsynchronousProg ap = new AsynchronousProg();
            ap.FirstMethod();
            await ap.SecondMethod();

            //Extension methods
            string str = "count the empty space in the string";
            int em = ExtensionMethods.CountSpaces(str);
            Console.WriteLine(em);

            //Custom Exception
            int num1, num2;
            Console.WriteLine("Enter the value of num1:");
            num1 = int.Parse(Console.ReadLine());
            Console.WriteLine("Enter the value of num2:");
            num2 = int.Parse(Console.ReadLine());
            int result1 = num1 + num2;
            try
            {
                checked
                {
                    if (result1 > 20)
                    {
                        throw new CustomException();
                    }
                }
            }
            catch (CustomException ex)
            {
                string value = ex.Message;
                throw ex;
            }
        }
        public List<T> GetCollection<T>(T[] ts)
        {
            List<T> list = new List<T>();
            foreach (T t in ts)
            {
                list.Add(t);
            }
            return list;
        }
    }
}
