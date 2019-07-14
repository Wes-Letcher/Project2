using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Insurance_Web.Class
{

    public class Car
    {
        public string year { get; set; }
        public string make { get; set; }
        public string model { get; set; }
        public Car(string yr, string mk, string mdl)
        {
            year = yr;
            make = mk;
            model = mdl;

        }
    }
}