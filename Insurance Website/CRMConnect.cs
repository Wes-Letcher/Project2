using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.Xrm.Sdk;
using Microsoft.Xrm.Tooling.Connector;

namespace Insurance_Website
{

    public class CRMConnect
    {

        public CrmServiceClient service = null;

        public CRMConnect()
        {
            string crmConnectionString = "AuthType=Office365;Url=https://revaturegp.crm7.dynamics.com;UserName=system.robot@revaturegp.onmicrosoft.com;Password=robotPassword1";
            service = new CrmServiceClient(crmConnectionString);
        }


        

    }
}