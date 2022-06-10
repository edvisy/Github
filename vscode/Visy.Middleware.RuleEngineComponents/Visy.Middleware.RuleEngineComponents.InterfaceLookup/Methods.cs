using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.RuleEngine;

namespace Visy.Middleware.RuleEngineComponents.InterfaceLookup
{
    [Serializable]
    public class Methods
    {
        private const string POLICY_NAME = "{0}.InterfaceLookup.Policies";
        public static string GetLookupValue(string lookUpKey, string interfaceName)
        {
            Policy policy = new Policy(string.Format(POLICY_NAME, interfaceName));
            FactObject lookup = new FactObject();

            lookup.InterfaceName = interfaceName;
            lookup.LookupKey = lookUpKey;

            policy.Execute(lookup);

            return lookup.LookupValue;
        }
    }
}
