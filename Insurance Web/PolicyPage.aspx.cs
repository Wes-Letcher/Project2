using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Insurance_Web.Class;

namespace Insurance_Web
{
    public partial class PolicyPage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                if (Request.QueryString != null)
                {
                    //only way it works for some dumn reason...
                    string fn = "firstname";
                    string ln = "lastname";


                    string t1 = Request.Form["firstname"];
                    string t2 = Request.Form["lastname"];
                    string t3 = Request.Form[fn];
                    string t4 = Request.Form[ln];

                    var t5= Request.Form["firstname"];
                    var t6= Request.Form[fn];
                    Policy policy = new Policy(t3,t4);

                    int i = 0;
                }
            }
        }
    }
}