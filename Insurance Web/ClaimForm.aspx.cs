using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Text;
using System.Threading.Tasks;
using Microsoft.Xrm.Tooling.Connector;
using Microsoft.Xrm.Sdk;
using Microsoft.Xrm.Sdk.Client;
using Microsoft.Crm.Sdk.Messages;
using System.Net;
using System.ServiceModel.Description;
using Microsoft.Xrm.Sdk.Query;
using Microsoft.Xrm.Sdk.Discovery;
namespace Insurance_Website
{
	public partial class ClaimForm : System.Web.UI.Page
	{
		public static Int32[] claimInfo { get; set; }
		public static string[] claimDate { get; set; }
		public static Int32 policyNumber { get; set; }
		protected void Page_Load(object sender, EventArgs e)
		{
			
		}
		protected void TextBox1_TextChanged(object sender, EventArgs e)
		{

		}
		protected void Button1_Click(object sender, EventArgs e)
		{
			//Button1.Attributes.Add("class", "next");
			//Button bt1 = sender as Button;
			//bt1.Text = "hey there";
			//this.HelloWorld.InnerHtml = Server.HtmlEncode("Welcome! You accessed this page at: " + DateTime.Now);
		}

		protected void Button1_Click1(object sender, EventArgs e)
		{
			//policyNumber = TextField1;
			//policyNumber = policy_num;
			claimInfo = new Int32[] {
				incident_type.SelectedIndex,
				driver_injuries.SelectedIndex,
				driver_car_damages.SelectedIndex,
				other_driver_injuries.SelectedIndex,
				other_car_damages.SelectedIndex
			};
			claimDate = new string[]
			{
				incidentMonth.ToString(),
				incidentDay.ToString(),
				incidentYear.ToString()
			};
			Response.Redirect("ClaimNumber.aspx");
		}
		protected void createRecord() {
			IOrganizationService organizationService = null;

			try
			{
				ClientCredentials clientCredentials = new ClientCredentials();
				clientCredentials.UserName.UserName = "tam6zd@revaturegp.onmicrosoft.com";
				clientCredentials.UserName.Password = "Revature2019";

				// For Dynamics 365 Customer Engagement V9.X, set Security Protocol as TLS12
				ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
				// Get the URL from CRM, Navigate to Settings -> Customizations -> Developer Resources
				// Copy and Paste Organization Service Endpoint Address URL
				organizationService = (IOrganizationService)new OrganizationServiceProxy(new Uri("https://revaturegp.api.crm7.dynamics.com/XRMServices/2011/Organization.svc"), null, clientCredentials, null);

				if (organizationService != null)
				{
					Guid userid = ((WhoAmIResponse)organizationService.Execute(new WhoAmIRequest())).UserId;

					if (userid != Guid.Empty)
					{
						Console.WriteLine("Connection Established Successfully...");
						Console.WriteLine(userid);
						/*
                        Entity contact = new Entity("contact");
                        contact.Attributes.Add("firstname", "Console");
                        contact.Attributes.Add("lastname", "App");
                        Console.WriteLine(organizationService.Create(contact));
                        
                        QueryExpression qe = new QueryExpression("contact");
                        EntityCollection enColl = organizationService.RetrieveMultiple(qe);
                        Console.WriteLine("Total Contacts in the System=" + enColl.Entities.Count);
                        
                        // Query system users  
                        QueryExpression users = new QueryExpression("systemuser");
                        users.ColumnSet.AddColumn("firstname");
                        users.Criteria.AddCondition("systemuserid", ConditionOperator.Equal, userid);

                        EntityCollection collection = organizationService.RetrieveMultiple(users);
                        foreach (Entity user in collection.Entities) Console.WriteLine("Current user is " + user.Attributes["firstname"].ToString());
                        */

						QueryExpression currencyQuery = new QueryExpression("transactioncurrency");
						currencyQuery.ColumnSet.AllColumns = true;
						currencyQuery.Criteria.AddCondition("statecode", ConditionOperator.Equal, 0);

						EntityCollection currencyCollection = organizationService.RetrieveMultiple(currencyQuery);

						foreach (Entity currency in currencyCollection.Entities) Console.WriteLine("Currencies retrieved are " + currency.Attributes["currencyname"].ToString());


						// Get user's policy number
						Console.WriteLine("Enter your policy number");
						string policyNumber = Console.ReadLine();

						//policyNumber = policy_num;



						// Pull policy number 
						QueryExpression policyQuery = new QueryExpression("new_policy");
						policyQuery.ColumnSet.AllColumns = true;
						EntityCollection policyCollection = organizationService.RetrieveMultiple(policyQuery);


						// Check if user input policy matches any existing polices 
						bool policyExists = false;

						foreach (Entity policy in policyCollection.Entities)
						{
							Console.WriteLine("Existing policies are: " + policy.Attributes["new_policy"].ToString());
							if (policy.Attributes["new_policy"].ToString() == policyNumber)
							{
								// Store the policy that was found
								Entity foundPolicy = policy;

								// Create claim entity
								Entity claim = new Entity("new_claim");

								// Get user input for claim entity 

								// Set claim's policy lookup field to foundPolicy entity reference
								claim.Attributes["new_claimpolicy"] = new EntityReference("new_policy", foundPolicy.Id);

								// Send the newly created claim to the system 
								Console.WriteLine("Your claim was created with a GUID of: " + organizationService.Create(claim));


							}
						}
						// If policy doesn't exists, notify user
						if (!policyExists) Console.WriteLine("The policy number you entered was not found. Please try again");
					}
				}
				else
				{
					Console.WriteLine("Failed to Established Connection!!!");
				}
			}
			catch (Exception ex)
			{
				Console.WriteLine("Exception caught - " + ex.Message);
			}
		}
	}
}