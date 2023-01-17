using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SampleProgram
{
    public static class ExtensionMethods
    {
        public static int CountSpaces(this string str)
        {
            return str.ToCharArray().Count(s => s == ' ');
        }
    }
}
