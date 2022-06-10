using Microsoft.BizTalk.Component.Interop;
using Microsoft.BizTalk.Message.Interop;
using Microsoft.BizTalk.Streaming;
using Microsoft.Office.Interop.Excel;
using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.IO;
using System.Runtime.InteropServices;
using System.Xml.Serialization;
using Visy.Middleware.Components.Utilities;

namespace Visy.Middleware.Pipelines.ExcelOrderExtendedToXML
{
    /// <summary>
    /// Defines an Excel FC Disassembler pipeline component.
    /// </summary>
    /// <remarks>
    /// This pipeline component calls the Excel FC Data Converter .NET component
    /// to convert an Excel file to one more more XML documents. 
    /// </remarks>A5193261-0115-428F-A70B-7287DD34ADD5
    [System.Runtime.InteropServices.Guid("A5193261-0115-428F-A70B-7287DD34AEF5")]
    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    [ComponentCategory(CategoryTypes.CATID_DisassemblingParser)]
    public class ExcelOrderExtendedToXML : IBaseComponent, IComponentUI, IPersistPropertyBag, IDisassemblerComponent
    {
        #region Private Fields
        string TempDirPath = Visy.Middleware.Components.Utilities.AppSettingsReader.retrieveValue("XLSX2XMLTempPath");
        private DataSet rulesDS = null;
        private RulesConfiguration rulesConfig = null;
        private string contextID = "";
        private int y = 0;

        // Component internal
        private IPipelineContext _pipelineContext;
        private IBaseMessage _inMessage;
        private IBaseMessageContext originalMsgContext;
        
        // Custom variables
        private int _messageIndex = 0;
        private ArrayList _outputFiles = null;

        #endregion

        #region Public Properties

        

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

        private ArrayList OutputFiles
        {
            get 
            {
                if (_outputFiles == null)
                    throw new ArgumentNullException("_outputFiles"); 
                return _outputFiles; 
            }
        }

        private int MessageIndex
        {
            get { return _messageIndex; }
            set { _messageIndex = value; }
        }

        #endregion

        #region IBaseComponent Members

        public string Description
        {
            get { return "ExcelOrderExntededToXML component"; }
        }

        public string Name
        {
            get { return "ExcelOrderExntededToXML"; }
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
            classID = new System.Guid("80E38CB9-9920-436D-B4AA-62A994860A54");
        }

        public void InitNew()
        {}

        public void Load(IPropertyBag propertyBag, int errorLog)
        {
            
           
        }

        public void Save(IPropertyBag propertyBag, bool clearDirty, bool saveAllProperties)
        {
            
        }

        #endregion

        #region IDisassemblerComponent Members

        /// <summary>
        /// Dissassembles an Excel file into one or more XML documents.
        /// </summary>
        /// <remarks>
        /// Calls the ExcelOrderToXML .NET component to perform the
        /// actual transformation of data.
        /// </remarks>
        /// <param name="pContext">The pipeline context instance.</param>
        /// <param name="pInMsg">The input BizTalk message, having its Body part
        /// containing the Excel data.</param>
        public void Disassemble(IPipelineContext pContext, IBaseMessage pInMsg)
        {
            if (pContext == null)
                throw new ArgumentNullException("pc");
            if (pInMsg == null)
                throw new ArgumentNullException("pInMsg");
            this._pipelineContext = pContext;
            this._inMessage = pInMsg;
            this.originalMsgContext = PipelineUtil.CloneMessageContext(pInMsg.Context);
            string str1 = this.TempDirPath + Guid.NewGuid().ToString();
            string empty = string.Empty;
            Stream originalDataStream = pInMsg.BodyPart.GetOriginalDataStream();
            string fileName = Path.GetFileName(pInMsg.Context.Read("ReceivedFileName", "http://schemas.microsoft.com/BizTalk/2003/file-properties").ToString());
            string extension = Path.GetExtension(fileName);
            this.contextID = fileName;
            if (extension == ".xls")
            {
                str1 += ".xls";
                this.WriteStreamToFile(originalDataStream, str1);
            }
            if (extension == ".xlsx" || extension == string.Empty || extension == ".XLSX")
            {
                string str2 = str1 + extension;
                this.WriteStreamToFile(originalDataStream, str2);
                Application instance = (Application)Activator.CreateInstance(Type.GetTypeFromCLSID(new Guid("00024500-0000-0000-C000-000000000046")));
                Workbook workbook = instance.Workbooks.Open(str2, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
                string filepath = str2;
                str1 = this.TempDirPath + Guid.NewGuid().ToString() + ".xls";
                workbook.CheckCompatibility = false;
                workbook.DoNotPromptForConvert = true;
                instance.DisplayAlerts = false;
                instance.Workbooks.Application.DisplayAlerts = false;
                workbook.SaveAs((object)str1, (object)XlFileFormat.xlWorkbookNormal, Type.Missing, Type.Missing, (object)false, (object)false, XlSaveAsAccessMode.xlNoChange, (object)XlSaveConflictResolution.xlUserResolution, (object)true, Type.Missing, Type.Missing, Type.Missing);
                workbook.Close((object)false, Type.Missing, Type.Missing);
                this.DeleteTempFile(filepath);
                instance.Application.Quit();
            }
            this.contextID = fileName.Substring(fileName.IndexOf("~") + 1);
            this.contextID = this.contextID.Replace(".xls", "");
            this.contextID = this.contextID.Replace(".body", "");


            // Create component instance

            rulesDS = Visy.Middleware.Pipelines.ExcelOrderExtendedToXML.ExcelOrderToXMLDBData.getDataSet(fileName.Substring(0, fileName.IndexOf("~")));
            rulesConfig = new Visy.Middleware.Pipelines.ExcelOrderExtendedToXML.RulesConfiguration(rulesDS);

            ExcelOrderExtendedHandler orderExtendedHandler = new ExcelOrderExtendedHandler();
            orderExtendedHandler.loadXLSBook(str1);
            OrderExtended o = orderExtendedHandler.readIntoOrder(this.rulesConfig);
            this._outputFiles = orderExtendedHandler.PopulateExcelXML(o);
            this.DeleteTempFile(str1);
        }

        /// <summary>
        /// This method will be called by BizTalk to get one output XML document at a time.
        /// </summary>
        /// <param name="pContext">The pipeline context instance.</param>
        /// <returns>The output BizTalk message containing one XML document.</returns>
        public IBaseMessage GetNext(IPipelineContext pContext)
        {
            y++;
            if (OutputFiles.Count == 0)
                throw new ApplicationException("The Output Files collection contains 0 items.");

            if (MessageIndex < OutputFiles.Count)
            {
                ExcelOrderExtended outputFile = ((ExcelOrderExtended)OutputFiles[MessageIndex]);
                // Get next XML document
                //ExcelForecast xmlDoc = outputFile.Instance;
                // Serialise XML document to stream
                VirtualStream stream = new VirtualStream();
                XmlSerializer xs = new XmlSerializer(typeof(ExcelOrderExtended));
                xs.Serialize(stream, outputFile);
                
                // Increment message index
                MessageIndex++;


                // Return new IBaseMessage
                return GetNewMessage(pContext, stream);
            }

            // Return null to indicate end of messages
            return null;
        }

        #endregion

        #region Private Methods

        #region sergiy's GetNewMessage()
        /*
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
            
            // Return new message
            return outMessage;
        }
        */
        #endregion



        public IBaseMessage GetNewMessage(IPipelineContext pContext, Stream stream)
        {
            // Create new message
            IBaseMessage outMessage = pContext.GetMessageFactory().CreateMessage();
            // Create new message part part
            IBaseMessagePart bodyPart = pContext.GetMessageFactory().CreateMessagePart();
            
            // Copy context
            originalMsgContext = InMessage.Context;
            // Seek to the start of the stream
            if (stream.CanSeek)
                stream.Seek(0, SeekOrigin.Begin);
            // Set body part stream
            bodyPart.Data = stream;
            bodyPart.Charset = "UTF-8";
            bodyPart.ContentType = "text/xml";

            outMessage.AddPart("body", bodyPart, true);


            // Copy the original message context to the newly created message

            for (int iProp = 0; iProp < originalMsgContext.CountProperties; iProp++)
            {

                string strName;
                string strNSpace;
                object val = originalMsgContext.ReadAt(iProp, out strName, out strNSpace);
                // If the property has been promoted, respect the settings

                if (originalMsgContext.IsPromoted(strName, strNSpace))
                    outMessage.Context.Promote(strName, strNSpace, val);
                else
                    outMessage.Context.Write(strName, strNSpace, val);                
            }
            outMessage.Context.Write("ReceivedFileName", "http://schemas.microsoft.com/BizTalk/2003/file-properties", contextID + "~" + y);

            outMessage.Context.Promote("MessageType", "http://schemas.microsoft.com/BizTalk/2003/system-properties", "http://Visy.Middleware.Common.Schemas.ExcelOrderExtended#ExcelOrderExtended");


            pContext.ResourceTracker.AddResource(outMessage.BodyPart.Data);
  
            return outMessage;
        }


        /// <summary>
        /// Creates a temporary Excel file at specified filepath.
        /// </summary>
        /// <param name="inputStream">The input Excel data stream.</param>
        /// <param name="filepath">The full physical filepath.</param>
        private void WriteStreamToFile(Stream inputStream, string filepath)
        {
            // Create output file stream
            FileStream fs = new FileStream(filepath, FileMode.CreateNew);

            // Copy the original stream to fileStream
            int Length = 256;
            Byte[] buffer = new Byte[Length];
            int bytesRead = inputStream.Read(buffer, 0, Length);
            // Write the required bytes
            while (bytesRead > 0)
            {
                fs.Write(buffer, 0, bytesRead);
                bytesRead = inputStream.Read(buffer, 0, Length);
            }
            // Seek to the start of the original stream
            if (inputStream.CanSeek)
                inputStream.Seek(0, SeekOrigin.Begin);

            // Close stream
            fs.Flush();
            fs.Close();
        }

        /// <summary>
        /// Deletes the temporary Excel file.
        /// </summary>
        /// <param name="filepath">The full physical filepath.</param>
        private void DeleteTempFile(string filepath)
        {
            try
            {
                FileInfo fi = new FileInfo(filepath);
                if (fi.Exists)
                    File.Delete(filepath);
                else
                    throw new FileNotFoundException();
            }
            catch (FileNotFoundException ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// Validates the configurable component properties for null. Throws exception if null.
        /// </summary>
        private void ValidateConfigurableProperties()
        {
           
        }

        #endregion
    }
}
