//---------------------------------------------------------------------
// File: HttpTransmitter.cs
// 
// Summary: Implementation of an adapter framework sample adapter. 
//
// Sample: HTTP Transmit Adapter, demonstrating solicit-response.
//
//
//---------------------------------------------------------------------
// This file is part of the Microsoft BizTalk Server SDK
//
// Copyright (c) Microsoft Corporation. All rights reserved.
//
// This source code is intended only as a supplement to Microsoft BizTalk
// Server release and/or on-line documentation. See these other
// materials for detailed information regarding Microsoft code samples.
//
// THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY
// KIND, WHETHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS FOR A PARTICULAR
// PURPOSE.
//---------------------------------------------------------------------

using System;
using System.Xml;
using System.Threading;

using Microsoft.BizTalk.Component.Interop;
using Microsoft.BizTalk.TransportProxy.Interop;
using Microsoft.BizTalk.Message.Interop;

using Microsoft.BizTalk.Adapter.Common;

namespace Visy.Middleware.Adapters.Http.Transmit
{
    /// <summary>
    /// This is a singleton class for HTTP.VISY send adapter. All the messages, going to various
    /// send ports of this adapter type, will go through this class.
    /// 
    /// Messages will go delivered to this adapter in batches. The batch implementation is provided
    /// by HttpTransmitAdapterBatch class.
    /// </summary>
    sealed public class HttpTransmitAdapter : AsyncTransmitter
    {
        private static string httpNamespace = "http://schemas.microsoft.com/BizTalk/2003/Messaging/Transports/httpvisy-properties";

        public HttpTransmitAdapter() : base(
                ".Net HTTP Transmit Adapter",
                "1.0",
                ".NET HTTP Transmit Adapter SDK",
                "HTTP.VISY",
                new Guid("D5353BB1-BAE9-4de7-8362-F1160FAD3985"),
                httpNamespace, typeof(HttpTransmitterEndpoint), 10)
        {
        }

        protected override IBTTransmitterBatch CreateAsyncTransmitterBatch()
        {
            return new HttpTransmitAdapterBatch(10, httpNamespace, TransportProxy, this);
        }

        public ConfigProperties CreateProperties(string uri)
        {
            ConfigProperties properties = new HttpAdapterProperties(uri);
            return properties;
        }

        protected override void HandlerPropertyBagLoaded ()
        {
            IPropertyBag config = this.HandlerPropertyBag;
            if (null != config)
            {
                XmlDocument handlerConfigDom = ConfigProperties.IfExistsExtractConfigDom(config);
                if (null != handlerConfigDom)
                {
                    HttpAdapterProperties.TransmitHandlerConfiguration(handlerConfigDom);
                }
            }
        }
    }
}
