using System.ServiceModel.Description;
using System.Net;
using System;
using System.ServiceModel.Channels;
using System.ServiceModel.Dispatcher;

namespace Visy.Middleware.AS2.Common.Components
{
    public class AS2CustomEndPointBehaviour : IEndpointBehavior
    {
        public SecurityProtocolType CustomProtocolType { get; set; }
        public AS2CustomEndPointBehaviour(SecurityProtocolType protocol)
        {
            this.CustomProtocolType = protocol;
           
        }
        public void AddBindingParameters(ServiceEndpoint endpoint, BindingParameterCollection bindingParameters)
        {
         
        }

        public void ApplyClientBehavior(ServiceEndpoint serviceEndpoint, System.ServiceModel.Dispatcher.ClientRuntime behavior)
        {
            ServicePointManager.SecurityProtocol = CustomProtocolType;
        }

        public void ApplyDispatchBehavior(ServiceEndpoint endpoint, EndpointDispatcher endpointDispatcher)
        {
            
        }

        public void Validate(ServiceEndpoint endpoint)
        {
           
        }
    }
}
