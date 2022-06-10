using System;
using System.Configuration;
using System.ServiceModel.Configuration;
using System.Net;

namespace Visy.Middleware.AS2.Common.Components
{
    public class CustomBehaviorExtensionElement : BehaviorExtensionElement
    {

        private ConfigurationPropertyCollection properties;
        [ConfigurationProperty("CustomProtocolType")]
        public SecurityProtocolType CustomProtocolType
        {
            get
            {
                return (SecurityProtocolType)base["CustomProtocolType"];
            }
            set
            {
                base["CustomProtocolType"] = value;
            }
        }

        public override Type BehaviorType
        {
            get
            {
                return typeof(AS2CustomEndPointBehaviour);
            }
        }
        protected override ConfigurationPropertyCollection Properties
        {
            get
            {
                if (this.properties == null)
                {
                    this.properties = new ConfigurationPropertyCollection
                    {
                        new ConfigurationProperty("CustomProtocolType", typeof(SecurityProtocolType), SecurityProtocolType.Tls12, null, null, ConfigurationPropertyOptions.IsRequired)
                    };
                }
                return this.properties;
            }
        }

        protected override object CreateBehavior()
        {
            return new AS2CustomEndPointBehaviour(this.CustomProtocolType);
        }
    }
}
