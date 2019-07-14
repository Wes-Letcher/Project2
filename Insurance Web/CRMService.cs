using Insurance_Web.Class;
using Microsoft.Xrm.Sdk;
using Microsoft.Xrm.Tooling.Connector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Insurance_Web
{
    public class CRMService
    {

        public CrmServiceClient service = null;


        public CRMService()
        {
            string crmConnectionString = "AuthType=Office365;Url=https://revaturegp.crm7.dynamics.com;UserName=system.robot@revaturegp.onmicrosoft.com;Password=robotPassword1";
            service = new CrmServiceClient(crmConnectionString);
        }

        public Entity CreateContact(Contact contact)
        {
            //create an entity by entity id
            Entity contactEntity = new Entity("contact");

            //add attributes to the enitity
            contactEntity.Attributes.Add("firstname", contact.firstName);
            contactEntity.Attributes.Add("lastname", contact.lastName);
            //contactEntity.Attributes.Add("birthdate", contact.birthday);
            //contactEntity.Attributes.Add("new_ssn", contact.social);
            //contactEntity.Attributes.Add("gendercode", contact.);
            //contactEntity.Attributes.Add("familystatuscode",contact.);

            contactEntity.Attributes.Add("address1_country", contact.country);
            contactEntity.Attributes.Add("address1_stateorprovince", contact.state);
            contactEntity.Attributes.Add("address1_city", contact.city);
            contactEntity.Attributes.Add("address1_line1", contact.street);
            contactEntity.Attributes.Add("address1_line2", contact.apt);
            //contactEntity.Attributes.Add("address1_telephone1", contact.phone);
            //contactEntity.Attributes.Add("emailaddress1", contact.email);
            
            //create the entity
            Guid guid = service.Create(contactEntity);

            return contactEntity;
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