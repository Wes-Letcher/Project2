using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Insurance_Web.Class
{
    public class Policy
    {
        public int type { get; set; }
        public string premium { get; set; }
        public int country { get; set; }

        public Policy(string prem_base, string prem_rec, string pol, string cntry)
        {
            switch (pol)
            {
                case "Basic": type = 100000000; premium = prem_base; break;

                case "Recommended": type = 100000001; premium = prem_rec; break;

                default: type = -1; break;
            }

            switch (cntry)
            {
                case "US": country = 100000000; break;
                case "CA": country = 100000001; break;
            }

        }
    }
}