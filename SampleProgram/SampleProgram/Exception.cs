using System;
using System.Collections.Generic;
using System.Text;

namespace SampleProgram
{
    class CustomException:Exception
    {
        public override string Message => checkMsg(base.Message);
        public string checkMsg(string message)
        {
            return "result should not be greater than 20" + message;
        }
    }
}
