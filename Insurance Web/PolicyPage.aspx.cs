using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Insurance_Web.Class;
using Microsoft.Xrm.Sdk;

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
                    List<Car> cars = new List<Car>();

                    //get the form data
                    string fn = Request.Form["firstname"];
                    string ln = Request.Form["lastname"];
                    string bd = Request.Form["bd"]; //form YYYY-MM-dd
                    string ss = Request.Form["social"];
                    string gend = Request.Form["gender"];
                    string marstat = Request.Form["maritalstatus"];
                    string empstat = Request.Form["employmentstatus"];

                    string cntry = Request.Form["country"];
                    string st = Request.Form["state"];
                    string city = Request.Form["city"];
                    string str = Request.Form["street"];
                    string apt = Request.Form["apt"];

                    string lnc = Request.Form["license"];
                    string oneYrAc = Request.Form["acc_one_yr1"];
                    string fiveYrAc = Request.Form["acc_five_yr1"];

                    string ph = Request.Form["phone"];
                    string eml = Request.Form["email"];

                    //Button button = sender;
                    string prem = Request.Form["premium"];
                    string pol = Request.Form["policy"];


                    Policy policy = new Policy(prem, pol);
                    Contact contact = new Contact(fn, ln, bd, ss, gend, marstat, cntry, st, city, str, apt, ph, eml);

                    int i = 1;
                    do
                    {
                        string year = Request.Form["year" + i];
                        string make = Request.Form["make" + i];
                        string model = Request.Form["model" + i];

                        cars.Add(new Car(year, make, model));

                        i++;
                    } while (Request.Form["model" + i] != null);

                    //create connection to crm
                    CRMService crm = new CRMService();
                    //create contract in crm
                    Entity eContact = crm.CreateContact(contact);
                    
                }
            }
        }
    }
}