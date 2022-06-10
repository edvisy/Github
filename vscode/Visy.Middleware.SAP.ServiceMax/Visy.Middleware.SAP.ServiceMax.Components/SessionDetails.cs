using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Visy.Middleware.SAP.ServiceMax.Components
{
    [Serializable]
    public static class SessionDetails
    {
        private static DateTime _sessionDate = System.DateTime.Now;
        private static string _sessionId = System.String.Empty;
        private static string _serverUrl = System.String.Empty;

        public static DateTime SessionDate
        {
            get
            {
                return _sessionDate;
            }

            set
            {
                _sessionDate = value;
            }
        }

        
        public static string SessionId
        {
            get
            {
                return _sessionId;
            }
            set
            {
                _sessionId = value;
            }
        }

        public static string ServerUrl
        {
            get
            {
                return _serverUrl;
            }

            set
            {
                _serverUrl = value;
            }
        }
    }
}
