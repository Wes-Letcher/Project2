using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Xrm.Sdk;

namespace Insurance_Website
{
	public partial class ClaimNumber : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			Int32[] claimOptions = ClaimForm.claimInfo;
			string[] claimDate = ClaimForm.claimDate;
			//ClaimValidatePage.service
			Entity claim = new Entity("new_claim");
			claim.Attributes.Add("new_incidents", new OptionSetValue( claimOptions[0] ) );
			claim.Attributes.Add("new_driverinjuries", new OptionSetValue(claimOptions[1]));
			claim.Attributes.Add("new_otherpartyinjuries", new OptionSetValue(claimOptions[3]));
			claim.Attributes.Add("new_cardamage", new OptionSetValue(claimOptions[2]));
			claim.Attributes.Add("new_otherpartycardamages", new OptionSetValue(claimOptions[4]));
//			claim.Attributes.Add("Date Of Incident", new DateTime( 
//				Convert.ToInt32(claimElements[5]),
//				Convert.ToInt32(claimElements[6]),
//				Convert.ToInt32(claimElements[7])
//				) 
//			);
			
			ClaimValidatePage.service.Create(claim);
		}
	}
}