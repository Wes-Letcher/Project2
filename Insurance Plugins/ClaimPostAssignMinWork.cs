using Microsoft.Xrm.Sdk;
using Microsoft.Xrm.Sdk.Query;
using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;

namespace Plugins
{


    public class ClaimPostCreateMinWork : IPlugin
    {

        public void Execute(IServiceProvider serviceProvider)
        {
            // Obtain the tracing service
            ITracingService tracingService =
            (ITracingService)serviceProvider.GetService(typeof(ITracingService));

            // Obtain the execution context from the service provider.  
            IPluginExecutionContext context = (IPluginExecutionContext)
                serviceProvider.GetService(typeof(IPluginExecutionContext));

            // The InputParameters collection contains all the data passed in the message request.  
            if (context.InputParameters.Contains("Target") &&
                context.InputParameters["Target"] is Entity)
            {
                // Obtain the target entity from the input parameters.  
                //is like a dictionary, has key value pair
                //target is current record
                Entity claim = (Entity)context.InputParameters["Target"];

                // Obtain the organization service reference which you will need for  
                // web service calls.
                //service is like a database connection
                IOrganizationServiceFactory serviceFactory =
                    (IOrganizationServiceFactory)serviceProvider.GetService(typeof(IOrganizationServiceFactory));
                IOrganizationService service = serviceFactory.CreateOrganizationService(context.UserId);

                try
                {
                    //make query to get users with workload

                    string fetchxml = @"
                        <fetch version='1.0' output-format='xml-platform' mapping='logical' distinct='false'>
                            <entity name='systemuser'>
                                <attribute name='fullname' />
                                <attribute name='systemuserid' />
                                <attribute name='new_workload' />
                                <order attribute='new_workload' descending='false' />
                                <filter type='and'>
                                    <condition attribute='isdisabled' operator='eq' value='0' />
                                    <condition attribute='accessmode' operator='ne' value='3' />   
                                    <condition attribute='accessmode' operator='ne' value='4' />
                                    <condition attribute='accessmode' operator='ne' value='5' />                                 
                                </filter>
                            </entity>
                        </fetch>
                    ";

                    EntityCollection users = service.RetrieveMultiple(new FetchExpression(fetchxml));
                    tracingService.Trace("users: " + users.Entities.Count);

                    //get the user work lowest workload
                    Entity user = users[0];
                    tracingService.Trace("user: " + user.Attributes["fullname"].ToString());

                    //get workload
                    int work;
                    if (user.Attributes.Contains("new_workload"))
                    {
                        work = (int)user.Attributes["new_workload"];
                    }
                    else
                    {
                        work = 0;
                    }
                    tracingService.Trace("workload: " + work);

                    //assign to new owner
                    claim.Attributes["ownerid"] = user.ToEntityReference();
                    service.Update(claim);

                    //increment users workload
                    user.Attributes["new_workload"] = work + 1;
                    service.Update(user);

                    tracingService.Trace("final work: " + work + 1);

                }

                catch (FaultException<OrganizationServiceFault> ex)
                {
                    throw new InvalidPluginExecutionException("An error occurred in FollowUpPlugin.", ex);
                }

                catch (Exception ex)
                {
                    tracingService.Trace("FollowUpPlugin: {0}", ex.ToString());
                    throw;
                }
            }
        }
    }
}
