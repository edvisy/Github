using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Diagnostics;
using Microsoft.BizTalk.Streaming;
using System.Xml;
using System.Xml.XPath;

namespace Visy.Middleware.SAP.ServiceMax.PipelineComponents
{
    class Utilities
    {
        #region
        /// <summary>
        /// ReadStreamToEndAndSeekToBeginning - Consumes a stream then optionally seeks back to the beginning.
        /// </summary>
        /// <param name="data">Stream to consume.</param>
        /// <param name="seekToBeginning">Seek back to the beginning after reading the entire stream.</param>
        /// <param name="bufferSize">Size of the buffer to use during stream read.</param>
        /// <returns></returns>
        internal static Stream ReadStreamToEndAndSeekToBeginning(Stream data, bool seekToBeginning, int bufferSize)
        {
            Debug.WriteLine("Entering ContextPropertyPromoter.ReadStreamToEndAndSeekToBeginning method.");
            byte[] buffer = new byte[bufferSize]; // 1 MB should suffice
            
            Stream outputStream = data;

            // NOTE: The stream needs to be seekable to allow seek to the beginning
            if (seekToBeginning && !outputStream.CanSeek)
            {
                Debug.WriteLine("Wrapping the stream in a seekable stream.");
                // Wrap the stream in a seekable stream
                outputStream = new ReadOnlySeekableStream(outputStream);
            }

            // Read the entire stream
            Debug.WriteLine("Consuming the stream.");
            while (0 != outputStream.Read(buffer, 0, buffer.Length))
            {
                // Keep reading...
            }

            // Seek to the start if requested
            if (seekToBeginning)
            {
                Debug.WriteLine("Seeking the stream back to the beginning.");

                // Seek back to the beginning
                outputStream.Seek(0, SeekOrigin.Begin);
            }

            // Return the stream
            Debug.WriteLine("Returning stream object from ContextPropertyPromoter.ReadStreamToEndAndSeekToBeginning method.");
            return outputStream;
        }
        #endregion

        internal static string ExtractDataValueXPath(Stream MsgStream, string MsgXPath)
        {
            XmlReaderSettings settings = new XmlReaderSettings()
            {
                ConformanceLevel = ConformanceLevel.Document,
                IgnoreWhitespace = true,
                ValidationType = ValidationType.None,
                IgnoreProcessingInstructions = true,
                IgnoreComments = true,
                CloseInput = false
            };
            MsgStream.Seek(0, SeekOrigin.Begin);
            XmlReader reader = XmlReader.Create(MsgStream, settings);
            string strValue = null;
            if (!string.IsNullOrEmpty(MsgXPath))
            {
                if (reader.Read())
                {
                    XPathDocument xPathDoc = new XPathDocument(reader);
                    XPathNavigator xNavigator = xPathDoc.CreateNavigator();
                    XPathNodeIterator xNodes = xNavigator.Select(MsgXPath);
                    if (xNodes.Count != 0 && xNodes.MoveNext())
                    {
                        strValue = xNodes.Current.Value;
                    }
                    MsgStream.Seek(0, SeekOrigin.Begin);
                }
            }
            return strValue;
        }
    }
}
