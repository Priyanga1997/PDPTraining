using System;
using System.Collections.Generic;
using System.Linq;

namespace Linq
{
    public class Program
    {
        static void Main(string[] args)
        {
            List<Patient> patientsList = new List<Patient>{ new Patient { PatientId = 1, Name = "abc", City = "Chennai" },
             new Patient { PatientId = 2, Name = "sdf", City = "Trichy" },
             new Patient { PatientId = 3, Name = "zxc", City = "Coimbatore" } };

            var result = (from patient in patientsList where (patient.PatientId) > 2 select patient).ToList();
            foreach (var p in result)
            {
                Console.WriteLine("Id: " + p.PatientId + "Name: " + p.Name + "City: " + p.City);
            }
            Console.ReadLine();
        }
    }
}
