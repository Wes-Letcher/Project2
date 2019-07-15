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

namespace Insurance_Web
{
    public partial class ClaimPage : Page
    {
		protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                if (Request.QueryString != null)
                {
                    var obj = Request.Form;

                    var input = Request.Form["test"];


                }
            }
        }

//		protected void Button2_Click(object sender, EventArgs e)
//		{
//			System.Windows.Forms.MessageBox.Show("My message here");
//		}

		protected void TextField1_TextChanged(object sender, EventArgs e)
		{

		}
		protected void Button2_Click(object sender, EventArgs e)
		{
			//policyNumber = TextField1;
			//policyNumber = policy_num;
			
			
			createClaim();
			// Response.Redirect("ClaimNumber.aspx");
		}
		protected void createClaim()
		{
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
						// Console.WriteLine("Connection Established Successfully...");
						// Console.WriteLine(userid);
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

						// foreach (Entity currency in currencyCollection.Entities) Console.WriteLine("Currencies retrieved are " + currency.Attributes["currencyname"].ToString());


						// Get user's policy number
						// Console.WriteLine("Enter your policy number");
						string policyNumber = policy_num.Text;

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

								claim.Attributes["new_contact"] = new EntityReference("contact", ((EntityReference)foundPolicy.Attributes["new_policyholder"]).Id);


								// incident_type			: new_incidents
								// driver_damages
								// car_damages				: new_driverinjuries
								// other_driver_injuries
								// other_car_damages		: 
								// description				: new_description

								claim.Attributes["new_description"] = description2.Text;

								// Send the newly created claim to the system 
								// Console.WriteLine("Your claim was created with a GUID of: " + organizationService.Create(claim));
								System.Windows.Forms.MessageBox.Show("Your claim was created with a GUID of: " + organizationService.Create(claim));

								policyExists = true;
							}
						}
						// If policy doesn't exists, notify user
						if (!policyExists)
						{
							// Console.WriteLine("The policy number you entered was not found. Please try again");
							System.Windows.Forms.MessageBox.Show("The policy number you entered was not found. Please try again");
						}
					}
				}
				else
				{
					// Console.WriteLine("Failed to Established Connection!!!");
					System.Windows.Forms.MessageBox.Show("Failed to Established Connection!!!");
				}
			}
			catch (Exception ex)
			{
				// Console.WriteLine("Exception caught - " + ex.Message);
				System.Windows.Forms.MessageBox.Show("Exception caught - " + ex.Message);
			}
		}
	}
}