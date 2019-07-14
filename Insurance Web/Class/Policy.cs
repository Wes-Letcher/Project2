using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Insurance_Web.Class
{
    public class Policy
    {
        public string firstName { get; set; }
        public string lastName { get; set; }


        public Policy(string fn, string ln)
        {
            firstName = fn;
            lastName = ln;
        }
    }
}