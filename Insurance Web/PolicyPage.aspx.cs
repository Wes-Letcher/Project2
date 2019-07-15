using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Insurance_Web.Class;
using Microsoft.Xrm.Sdk;
using Microsoft.Xrm.Sdk.Query;

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
                    List<Entity> carEntities = new List<Entity>();

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
                    string prem_basic = Request.Form["premium_basic"];
                    string prem_rec = Request.Form["premium_recommended"];
                    string pol = Request.Form["policy"];


                    Policy policy = new Policy(prem_basic, prem_rec, pol, cntry);
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
                    Guid c_guid;
                    Guid p_guid;

                    //check if contact already exists
                    Entity contactEntity = crm.getContactBySSN(contact.social);
                    //if not make new
                    if (contactEntity == null)
                        contactEntity = crm.CreateContactEntity(contact, out c_guid);
                    else
                        c_guid = (Guid)contactEntity.Attributes["contactid"];

                    //create the policy
                    Entity policyEntity = crm.CreatePolicy(policy, contactEntity, out p_guid, c_guid);

                    foreach(Car car in cars)
                    {
                        carEntities.Add(crm.CreateCar(car, policyEntity, p_guid));
                    }

					crm.getPolicyID(p_guid);
				}
            }
        }
    }
}