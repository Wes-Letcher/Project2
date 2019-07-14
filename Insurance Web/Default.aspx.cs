using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Insurance_Web
{
    public class MyContainer
    {
        string store;
        public MyContainer(string strg)
        {
            store = strg;
        }
    }

    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                if (Request.QueryString != null)
                {
                    string str = "test";

                    foreach (string x in Request.Form)
                    {
                        Response.Write(x + ": " + Request.Form[x] + "<br />");
                    }

                    var result = Request.Form[str];

                    int i = 0;

                }
            }
        }
    }
}