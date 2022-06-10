using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Configuration;
using System.Text;
using System.Threading.Tasks;

namespace Visy.Middleware.SAP.Magento2.AdapterBehaviors
{
    public class MagentoBehaviourElement : BehaviorExtensionElement
    {

        public override Type BehaviorType
        {
            get { return typeof(MagentoBehaviour); }
        }

        protected override object CreateBehavior()
        {
            return new MagentoBehaviour();
        }
    }
}
