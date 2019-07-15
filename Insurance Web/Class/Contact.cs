using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Insurance_Web.Class
{


    public class Contact
    {
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string birthday { get; set; }
        public string social { get; set; }
        public int gender { get; set; }
        public int maritalStatus { get; set; }
        public string country { get; set; }
        public string state { get; set; }
        public string city { get; set; }
        public string street { get; set; }
        public string apt { get; set; }
        public string phone { get; set; }
        public string email { get; set; }


        public Contact(string fn, string ln, string bd, string ss, string gend, string marstat, 
            string cntry, string st, string c, string str, string a, string ph, string eml)
        {
            firstName = fn;
            lastName = ln;
            birthday = bd;
            social = ss;
            country = cntry;
            state = st;
            city = c;
            street = str;
            apt = a;
            phone = ph;
            email = eml;           
            
            switch(gend)
            {
                case "male": gender = 1; break;
                case "femle": gender = 2; break;
            }

            switch(marstat)
            {
                case "Single": maritalStatus = 1; break;
                case "Married": maritalStatus = 2; break;
                case "Divorced": maritalStatus = 3; break;
                case "Widowed": maritalStatus = 4; break;

            }
        }
    }
}