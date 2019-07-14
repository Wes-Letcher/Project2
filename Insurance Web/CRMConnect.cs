using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.Xrm.Sdk;
using Microsoft.Xrm.Tooling.Connector;
using Insurance_Web.Class;

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

        public Entity CreateContact(Contact contact)
        {
            Entity contactEntity = new Entity();


            contactEntity.Attributes.Add("lastname", contact.lastName);
            contactEntity.Attributes.Add("lastname", contact.lastName);

            return null;
        }

        public Entity CreatePolicy(Policy policy)
        {

            return null;
        }

        public Entity CreateCar(Car car)
        {

            return null;
        }

    }
}