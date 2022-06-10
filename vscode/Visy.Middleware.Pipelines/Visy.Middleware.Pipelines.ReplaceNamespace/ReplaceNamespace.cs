using System;
using System.Xml;
using System.IO;
using System.Collections;
using System.ComponentModel;
using System.Xml.Serialization;
using Microsoft.BizTalk.Message.Interop;
using Microsoft.BizTalk.Component.Interop;
using System.Xml.Linq;
using System.Linq;

namespace Visy.Middleware.Pipelines.ReplaceNamespace
{
    /// <summary>
    /// String Replacer pipeline component.
    /// </summary>
    [System.Runtime.InteropServices.Guid("35353bdc-fd2b-449c-ba9b-5a6faa3429c6")]
    [ComponentCategory(CategoryTypes.CATID_Any)]
    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    public class StringReplacer : 
        IBaseComponent, IComponentUI, IPersistPropertyBag, 
        Microsoft.BizTalk.Component.Interop.IComponent
    {
        #region Private Fields

        private const string DefaultReplacementString = "<Blank>";
        private const string DefaultStringToReplace = "<None>";

        private string _namespace = DefaultReplacementString;
        private string _rootnode = DefaultReplacementString;

        private IPipelineContext _pipelineContext;
        private IBaseMessage _inMessage;

        #endregion

        #region Public Properties


        [DisplayName("New Namespace String")]
        [Description("This value will be used to replace the \"New Namespace\" value found in the message. " + 
            "If set to <Blank> or empty then the found string will be removed from the message.")]
        public string NewNameSpace
        {
            get { return _namespace; }
            set { _namespace = value; }
        }


        [DisplayName("Root Node")]
        [Description("This is the node to be replaced")]
        public string RootNode
        {
            get { return _rootnode; }
            set { _rootnode = value; }
        }

        #endregion

        #region Private Properties

        private IPipelineContext PipelineContext
        {
            get
            {
                if (_pipelineContext == null)
                    throw new ArgumentNullException("_pipelineContext");
                return _pipelineContext;
            }
        }

        private IBaseMessage InMessage
        {
            get
            {
                if (_inMessage == null)
                    throw new ArgumentNullException("_inMessage");
                return _inMessage;
            }
        }

        #endregion

        #region IBaseComponent Members

        public string Description
        {
            get { return "Namespace Replacer component"; }
        }

        public string Name
        {
            get { return "Namespace Replacer"; }
        }

        public string Version
        {
            get { return "1.0"; }
        }

        #endregion

        #region IComponentUI Members

        [Browsable(false)]
        public IntPtr Icon
        {
            get { return System.IntPtr.Zero; }
        }

        [Browsable(false)]
        public System.Collections.IEnumerator Validate(object projectSystem)
        {
            System.Collections.IEnumerator enumerator = null;
            return enumerator;
        }

        #endregion

        #region IPersistPropertyBag Members

        public void GetClassID(out Guid classID)
        {
            classID = new System.Guid("35353bdc-fd2b-449c-ba9b-5a6faa3529c6");
        }

        public void InitNew()
        { }

        public void Load(IPropertyBag propertyBag, int errorLog)
        {
            object val = null;
            try
            {               

                propertyBag.Read("NewNameSpace", out val, 0);
                if (val != null)
                    this.NewNameSpace = (string)val;

                propertyBag.Read("RootNode", out val, 0);
                if (val != null)
                    this.RootNode = (string)val;

            }
            catch (ArgumentException) 
            {}
        }

        public void Save(IPropertyBag propertyBag, bool clearDirty, bool saveAllProperties)
        {            
            object val = this.NewNameSpace;
            propertyBag.Write("NewNameSpace", ref val);

            val = this.RootNode;
            propertyBag.Write("RootNode", ref val);
        }

        #endregion

        #region IComponent Members

        /// <summary>
        /// Performs string removal on the input message data.
        /// </summary>
        /// <param name="pContext">The BizTalk's pipeline contenxt.</param>
        /// <param name="pInMsg">The original message.</param>
        /// <returns>The modified message.</returns>
        public IBaseMessage Execute(IPipelineContext pContext, IBaseMessage pInMsg)
        {
            //To get Incoming message
            System.IO.Stream originalStream = pInMsg.BodyPart.GetOriginalDataStream();


            StreamReader streamReader = new StreamReader(originalStream);
            string messageString = streamReader.ReadToEnd();
         

            XmlDocument xd = new XmlDocument();
            xd.LoadXml(messageString);
            string xml = stripDocumentNamespace(xd.OuterXml);
            //Working with XDocument

            //XDocument xDoc;
            //using (XmlReader reader = XmlReader.Create(originalStream))
            //{
            //    reader.MoveToContent();
            //    xDoc = XDocument.Load(reader);
            //}

            //xDoc.Root.RemoveAttributes();
            XDocument xDoc = XDocument.Load(xml);

            xDoc.Root.Add(new XAttribute(XNamespace.Xmlns + "ns0", this.NewNameSpace));
            xDoc.Root.Name = xDoc.Root.GetNamespaceOfPrefix("ns0") + this.RootNode;



            // Returning stream
            byte[] output = System.Text.Encoding.ASCII.GetBytes(xml);// xDoc.ToString());
            MemoryStream memoryStream = new MemoryStream();
            memoryStream.Write(output, 0, output.Length);
            memoryStream.Position = 0;
            pInMsg.BodyPart.Data = memoryStream;

            return pInMsg;            
        }
        private string stripDocumentNamespace(string oldDom)
        {
            string str = System.Text.RegularExpressions.Regex.Replace(
            oldDom, @"( xmlns:?[^=]*=[""][^""]*[""])", "",
            System.Text.RegularExpressions.RegexOptions.IgnoreCase | System.Text.RegularExpressions.RegexOptions.Multiline);

            var validXmlChars = str.Where(ch => XmlConvert.IsXmlChar(ch)).ToArray();
            return new string(validXmlChars);

        }

        #endregion

        #region Private Methods

        /// <summary>
        /// Creates new IBaseMessage with single message part (Body part).
        /// </summary>
        /// <param name="pContext">The pipeline context instance.</param>
        /// <param name="stream">The Body part data stream.</param>
        /// <returns>A new IBaseMessage instance.</returns>
        private IBaseMessage GetNewMessage(IPipelineContext pContext, Stream stream)
        {
            // Create new message
            IBaseMessage outMessage = pContext.GetMessageFactory().CreateMessage();
            // Create new message part part
            IBaseMessagePart bodyPart = pContext.GetMessageFactory().CreateMessagePart();

            // Copy context
            outMessage.Context = InMessage.Context;

            // Seek to the start of the stream
            if (stream.CanSeek)
                stream.Seek(0, SeekOrigin.Begin);
            // Set body part stream
            bodyPart.Data = stream;

            outMessage.AddPart("body", bodyPart, true);

            // Track the outbound stream
            pContext.ResourceTracker.AddResource(outMessage.BodyPart.Data);

           
            return outMessage;
        }

        #endregion
    }
}
