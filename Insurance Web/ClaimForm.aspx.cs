using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Insurance_Website
{
	public partial class ClaimForm : System.Web.UI.Page
	{
		public static Int32[] claimInfo { get; set; }
		public static string[] claimDate { get; set; }
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
	}
}