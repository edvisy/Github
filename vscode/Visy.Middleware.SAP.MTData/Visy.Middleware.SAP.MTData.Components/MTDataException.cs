using System;
using System.Collections.Generic;
using System.Text;
using System.Runtime.Serialization;

namespace Visy.Middleware.SAP.MTData.Components
{
    [Serializable]
    public class MTDataException : System.Exception
    {
        private string _webResponseType = null;
        private string _webResponseData = null;

        public MTDataException()
            : base()
        {
        }

        public MTDataException(string message)
            : base(message)
        {
        }

        public MTDataException(SerializationInfo info, StreamingContext context)
            : base(info, context)
        {
        }

        public MTDataException(string message, string webResponseType, string webResponseData)
            : base(message)
        {
            _webResponseType = webResponseType;
            _webResponseData = webResponseData;
        }


        public string WebResponseType
        {
            get { return _webResponseType; }
            set { _webResponseType = value; }
        }

        public string WebResponseData
        {
            get { return _webResponseData; }
            set { _webResponseData = value; }
        }



    }
}
