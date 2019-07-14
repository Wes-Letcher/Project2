using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Insurance_Web.Class
{
    public class Policy
    {
        public string type { get; set; }
        public string premium { get; set; }


        public Policy(string tp, string p)
        {
            type = tp;
            premium = p;
        }
    }
}