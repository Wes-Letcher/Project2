using Insurance_Web.Class;
using Microsoft.Xrm.Sdk;
using Microsoft.Xrm.Sdk.Query;
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

        //creates a contact entity and adds it to the crm
        public Entity CreateContactEntity(Contact contact, out Guid c_guid)
        {
            //create an entity by entity id
            Entity contactEntity = new Entity("contact");

            //add attributes to the enitity
            contactEntity.Attributes.Add("firstname", contact.firstName);
            contactEntity.Attributes.Add("lastname", contact.lastName);
            //contactEntity.Attributes.Add("birthdate", contact.birthday);
            contactEntity.Attributes.Add("new_ssn", contact.social);
            contactEntity.Attributes.Add("gendercode", new OptionSetValue(contact.gender));
            contactEntity.Attributes.Add("familystatuscode", new OptionSetValue(contact.maritalStatus));

            contactEntity.Attributes.Add("address1_country", contact.country);
            contactEntity.Attributes.Add("address1_stateorprovince", contact.state);
            contactEntity.Attributes.Add("address1_city", contact.city);
            contactEntity.Attributes.Add("address1_line1", contact.street);
            contactEntity.Attributes.Add("address1_line2", contact.apt);
            //contactEntity.Attributes.Add("address1_telephone1", contact.phone);
            //contactEntity.Attributes.Add("emailaddress1", contact.email);

            c_guid = service.Create(contactEntity);

            return contactEntity;
        }

        public Entity CreatePolicy(Policy policy, Entity contactEntity, out Guid p_guid, Guid c_guid)
        {
            Entity policyEntity = new Entity("new_policy");

            policyEntity.Attributes.Add("new_policytype", new OptionSetValue(policy.type));
            policyEntity.Attributes.Add("new_premium", new Money(Convert.ToDecimal(policy.premium)));
            policyEntity.Attributes.Add("new_country", new OptionSetValue(policy.country));
            policyEntity.Attributes.Add("new_policyholder", new EntityReference("contact", c_guid));

            //claim.Attributes["new_contact"] = new EntityReference("contact", ((EntityReference)foundPolicy.Attributes["new_policyholder"]).Id);

            p_guid = service.Create(policyEntity);

            return policyEntity;
        }

        public Entity CreateCar(Car car, Entity policyEntity, Guid p_guid)
        {
            Entity carEntity = new Entity("new_car");
            carEntity.Attributes.Add("new_year_text", car.year);
            carEntity.Attributes.Add("new_car", car.make);
            carEntity.Attributes.Add("new_model", car.model);
            carEntity.Attributes.Add("new_policy", new EntityReference("new_policy", p_guid));

            Guid guid = service.Create(carEntity);

            return carEntity;
        }

        //look and see if contact exists by comparing ssn
        public Entity getContactBySSN(string ssn)
        {

            if (ssn == "")
                return null;

            string fetchxml = $@"
                <fetch version='1.0' output-format='xml-platform' mapping='logical' distinct='false'>
                  <entity name='contact'>
                    <attribute name='fullname' />
                    <attribute name='telephone1' />
                    <attribute name='contactid' />
                    <order attribute='fullname' descending='false' />
                    <filter type='and'>
                      <condition attribute='new_ssn' operator='eq' value='{ssn}' />
                    </filter>
                  </entity>
                </fetch>";

            EntityCollection contact = service.RetrieveMultiple(new FetchExpression(fetchxml));
            Entity c;
            try
            {
                c = contact[0];
            }
            catch (Exception e)
            {
                c = null;
            }

            return c;
        }
        
    }
}