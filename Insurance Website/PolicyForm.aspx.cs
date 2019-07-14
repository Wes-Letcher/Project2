using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Insurance_Website
{
    public partial class PolicyForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                if (Request.QueryString != null)
                {
                    var obj = Request.Form;

                    var input = Request.Form["testinput"];
                }
            }
        }

        protected void onSubmit(object sender, EventArgs e)
        {
           

        }
        
        protected void Get_Quote(object sender, EventArgs e)
        {
            //create contacts
            //return price

            //can do complex logic here?
        }

        protected void Create_Policy(object sender, EventArgs e)
        {
            //create policy
            //create cars

        }
    }
}