using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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

		protected void Button2_Click(object sender, EventArgs e)
		{
			System.Windows.Forms.MessageBox.Show("My message here");
		}
	}
}