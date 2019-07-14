using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Xrm.Sdk;
using Microsoft.Xrm.Tooling.Connector;

namespace Insurance_Website
{
	public partial class ClaimValidatePage : System.Web.UI.Page
	{
		public static CrmServiceClient service;
		IOrganizationService serv;
		protected void Page_Load(object sender, EventArgs e)
		{
			string crmConnectionString = "AuthType=Office365;Url=https://revaturegp.crm7.dynamics.com;UserName=system.robot@revaturegp.onmicrosoft.com;Password=robotPassword1";
			service = new CrmServiceClient(crmConnectionString);

			//serv = OnlineService.ser
		}

		protected void Button1_Click(object sender, EventArgs e)
		{

			//Entity pol = service.Retrieve("test", Guid.Parse("3eab7f69-67a6-e911-a97c-000d3a40526a"), null);
															//  8cb109e9-46a4-e911-a97b-000d3a40526a  Not the same
			//if (pol != null)
			//{
				Response.Redirect("ClaimForm.aspx");
			//}

		}
	}
}