using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using Microsoft.EntityFrameworkCore.Query.SqlExpressions;
using Microsoft.Data.SqlClient;

namespace FunctionApp1
{
    public static class Function1
    {
        [FunctionName("Function1")]
        public static async Task<IActionResult> Run(
            [HttpTrigger(AuthorizationLevel.Function, "get", "post", Route = null)] HttpRequest req,
            ILogger log)
        {
            log.LogInformation("C# HTTP trigger function processed a request.");
            string connectionString = "Data Source=CTSDOTNET912;Initial Catalog=DigitalBooks;User ID=sa;Password=pass@word1;TrustServerCertificate=True;";
            string query = "select * from Book";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Create the Command and Parameter objects.
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataReader reader;

                // Open the connection in a try/catch block.
                // Create and execute the DataReader, writing the result
                // set to the console window.
                try
                {
                    connection.Open();
                    reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                       Console.WriteLine("\t{0}\t{1}\t{2}",
                            reader[0], reader[1], reader[2]);
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
                Console.ReadLine();
            }
            return new OkResult();
        }
        //int num1 = int.Parse(req.Query["number1"]);
        //int num2 = int.Parse(req.Query["number2"]);
        //int num3 = int.Parse(req.Query["number3"]);
        //int result = (num1 + num2 + num3) / 3;
        //string name = req.Query["name"];

        //string requestBody = await new StreamReader(req.Body).ReadToEndAsync();
        //dynamic data = JsonConvert.DeserializeObject(requestBody);
        //name = name ?? data?.name;

        //string responseMessage = string.IsNullOrEmpty(name)
        //? "This HTTP triggered function executed successfully. Pass a name in the query string or in the request body for a personalized response."
        //: $"Hello, {name}. This HTTP triggered function executed successfully.";

        //return new OkObjectResult(result.ToString());
    }
    }

