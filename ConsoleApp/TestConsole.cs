using System;
using Microsoft.Xrm.Sdk;
using Microsoft.Xrm.Tooling.Connector;

namespace ConsoleApp
{
    class TestConsole
    {
        static void Main(string[] args)
        {
			string crmConnectionString = "AuthType=Office365;Url=https://revaturegp.crm7.dynamics.com;UserName=system.robot@revaturegp.onmicrosoft.com;Password=robotPassword1";

			CrmServiceClient service = new CrmServiceClient(crmConnectionString);

            Entity contact = new Entity("contact");
            contact.Attributes.Add("lastname", "Console App");

            Console.WriteLine(service.Create(contact));
            Console.ReadLine();

        }
    }
}