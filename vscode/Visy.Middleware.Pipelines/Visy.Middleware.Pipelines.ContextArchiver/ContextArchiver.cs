
using System;
using System.Resources;
using System.Drawing;
using System.Collections;
using System.Reflection;
using System.ComponentModel;
using System.Text;
using System.IO;
using Microsoft.BizTalk.Message.Interop;
using Microsoft.BizTalk.Component.Interop;
using System.Diagnostics;
using System.Configuration;




namespace Visy.Middleware.Components.Pipelines
{
    
    /// <summary>
    /// Implements custom pipeline component to append and/or prepend data to a stream.
    /// </summary>
    /// <remarks>
    /// FixMag class implements pipeline component that can be used in receive and
    /// send BizTalk pipelines. The pipeline component gets a data stream, appends
    /// and/or prepends user specified data to it and outputs modified stream.
    ///</remarks>
    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    [ComponentCategory(CategoryTypes.CATID_Any)]
    [ComponentCategory(CategoryTypes.CATID_Validate)]
    [System.Runtime.InteropServices.Guid("318af758-4eaf-40af-94d5-55d394a6a09c")]
    public class ContextArchiver :	
        IBaseComponent, 
        Microsoft.BizTalk.Component.Interop.IComponent,
        Microsoft.BizTalk.Component.Interop.IPersistPropertyBag,
        IComponentUI
    {
		
        
        private string archivePath = null;
        private string filePrefix = null;
        private const int bufferSize = 1024;

	static	ResourceManager resManager = new ResourceManager("Visy.Middleware.Pipelines.ContextArchiver", Assembly.GetExecutingAssembly());

	
        const string FILEAdapterTargetNamespace = "http://schemas.microsoft.com/BizTalk/2003/file-properties";
        /// <summary>
        /// Data to prepend at the beginning of a stream.
        /// </summary>	
	
        public string ArchivePath
        {
            get {   return archivePath;  }
            set {   archivePath = value; }
        }

        public string FilePrefix
        {
            get { return filePrefix; }
            set { filePrefix = value; }
        }
        /// <summary>
        /// Converts a string to its byte representation.
        /// </summary>
        /// <param name="str">String to be converted to byte representation.</param>
        /// <returns>Array of bytes that represents the string.</returns>
        private byte[] ConvertToBytes(string str)
        {
            byte[] data = null;

            if (str != null)
                data = UTF8Encoding.UTF8.GetBytes(str);

            return data;
        }

        #region IBaseComponent
        
        /// <summary>
        /// Name of the component.
        /// </summary>
        [Browsable(false)]
        public string Name
        {
            get {   return "Context Archiver Component";  }
        }
        
        /// <summary>
        /// Version of the component.
        /// </summary>
        [Browsable(false)]
        public string Version
        {
            get {   return "1.0";   }
        }
        
        /// <summary>
        /// Description of the component.
        /// </summary>
        [Browsable(false)]
        public string Description
        {
            get {   return "Context Archiver Pipeline Component"; }
        }
    
        #endregion
        
        #region IComponent

        /// <summary>
        /// Implements IComponent.Execute method.
        /// </summary>
        /// <param name="pc">Pipeline context</param>
        /// <param name="inmsg">Input message.</param>
        /// <returns>Processed input message with appended or prepended data.</returns>
        /// <remarks>
        /// IComponent.Execute method is used to initiate
        /// the processing of the message in pipeline component.
        /// </remarks>
        public IBaseMessage Execute(IPipelineContext pc, IBaseMessage inmsg)
        {
            Stream originalStrm = null;
            FileStream fileArchive = null;
            BinaryWriter binWriter = null;

            try
            {
                IBaseMessagePart bodyPart = inmsg.BodyPart;
                if (bodyPart != null)
                {
                    
                    #region SET PATH & FILENAME
                    /*
                     * FILENAME FORMAT : [ReceiveLocation]~[ContextID]~[x].[extension]
                     * 
                     * Archive will perform the following conversion to FileName and store that on
                     * FILE.ReceiveFileName Property Schema property
                     * 
                     * 1. Strip off ReceiveLocation prefix
                     * 2. Strip off File Extension
                     * 3. Store result in FILE.ReceiveFileName property.
                     *                     
                     */
                    #region ARCHIVE PATH
                    string path = "";
                    try
                    {

                        path = Visy.Middleware.Components.Utilities.AppSettingsReader.retrieveValue("BiztalkArchiverPath");
                    }
                    catch (Exception PathEx)
                    {
                        throw(new Exception("Missing entry in machine.config/appsettings for BiztalkArchiverPath.  Entry must be there before Archiver can successfully run.", PathEx));
                    }
                    //string sMessage = "";
                    //sMessage = "File Saved in : " + path + Environment.NewLine;                    
                    path = Path.Combine(path, archivePath);
                    #endregion

                    ///TODO: Set Correct file extension by reading the incomming file extension
                    string orgFileName = inmsg.Context.Read("ReceivedFileName", FILEAdapterTargetNamespace) as string;
                    string orgFileNameWithoutExt = "";
                    string fileExtension = Path.GetExtension(orgFileName);
                    string[] aFileNameParts;
                    string fileName = "";
                    string ReceiveFileName = "";
                    string InterchangeID = "";

                    InterchangeID = (string)inmsg.Context.Read("InterchangeID", "http://schemas.microsoft.com/BizTalk/2003/system-properties");
                    #region HANDLE BLANK InterchangeID
                    if (InterchangeID.Length == 0 || InterchangeID == null)
                    {
                        System.Diagnostics.EventLog.WriteEntry("Biztalk Archiver", "Unable to Read InterchangeID, Defaulting to MessageID");
                        InterchangeID = inmsg.MessageID.ToString();
                    }
                    else
                    {
                        string PreviousInterchangeID = InterchangeID;
                        //remove { brakets if found
                        int indexOpenBracket = InterchangeID.IndexOf('{');
                        if (indexOpenBracket != -1)
                            InterchangeID = InterchangeID.Substring(indexOpenBracket + 1);
                        int indexCloseBracket = InterchangeID.LastIndexOf('}');
                        if (indexCloseBracket != -1)
                            InterchangeID = InterchangeID.Substring(0, InterchangeID.Length - 1); //zero based index, strip last char 


                        System.Diagnostics.EventLog.WriteEntry("Biztalk Archiver", "InterchangeID changed from (4): " + PreviousInterchangeID + " to " + InterchangeID);
                    }
                    #endregion
                    
                    orgFileNameWithoutExt = Path.GetFileNameWithoutExtension(orgFileName);
                    aFileNameParts = orgFileNameWithoutExt.Split('~');
                    if (aFileNameParts.Length == 3) //3 parts expected separated by ~ character
                    {
                        //[0]=ReceiveLocation
                        //[1]=ContextID
                        //[2]=x

                        //SET ReceiveFileName to [ContextID]~[x]
                        ReceiveFileName = aFileNameParts[1] + '~' + aFileNameParts[2];                        

                    }
                    else
                    {
                        //filename is not as expected, accept file and use InterchangeID as GUID
                        ReceiveFileName = InterchangeID + "~1";
                        
                    }
                    fileName = filePrefix + "." + ReceiveFileName + fileExtension;
                    
                    inmsg.Context.Write("ReceivedFileName", "http://schemas.microsoft.com/BizTalk/2003/file-properties", ReceiveFileName);
                    path = path + fileName;
                    
                    #endregion 
                       
                    
                    
                    
                    // Get a *copy* of the original input stream
                    originalStrm = bodyPart.Data;

                    // Dump the data to the file, for archiving
                    fileArchive = new FileStream(path, FileMode.Create, FileAccess.Write);
                    binWriter = new BinaryWriter(fileArchive);

                    // Read the stream and send bytes to the file
                    byte[] buffer = new byte[bufferSize];
                    int sizeRead = 0;

                    while ((sizeRead = originalStrm.Read(buffer, 0, bufferSize)) != 0)
                    {
                        binWriter.Write(buffer, 0, sizeRead);
                    }
                }
            }
            catch (Exception ex)
            {
                // Do not fail the pipeline if we cannot archive
                // Just log the failure to the event log
                System.Diagnostics.EventLog.WriteEntry(ex.Source, ex.Message + "\n" + ex.StackTrace, EventLogEntryType.Error);
            }
            finally
            {
                // Flush()/Close() the output stream
                if (binWriter != null) { binWriter.Flush(); binWriter.Close(); }
            }

            return inmsg;
        }
        #endregion

        #region IPersistPropertyBag
    
        /// <summary>
        /// Gets class ID of component for usage from unmanaged code.
        /// </summary>
        /// <param name="classid">Class ID of the component.</param>
        public void GetClassID(out Guid classid)
        {
            classid = new System.Guid("5EEBE827-D4AC-48ad-B90F-A11F37BA631E");
        }
        
        /// <summary>
        /// Not implemented.
        /// </summary>
        public void InitNew()
        {
        }
        
        /// <summary>
        /// Loads configuration property for component.
        /// </summary>
        /// <param name="pb">Configuration property bag.</param>
        /// <param name="errlog">Error status (not used in this code).</param>
        public void Load(Microsoft.BizTalk.Component.Interop.IPropertyBag pb, Int32 errlog)
        {
            string val = (string)ReadPropertyBag(pb, "ArchivePath");
            if (val != null) 
                archivePath = val;

            val = (string)ReadPropertyBag(pb, "FilePrefix");
            if (val != null) 
                filePrefix = val;
        }
        
        /// <summary>
        /// Saves the current component configuration into the property bag.
        /// </summary>
        /// <param name="pb">Configuration property bag.</param>
        /// <param name="fClearDirty">Not used.</param>
        /// <param name="fSaveAllProperties">Not used.</param>
        public void Save(Microsoft.BizTalk.Component.Interop.IPropertyBag pb, Boolean fClearDirty, Boolean fSaveAllProperties)
        {
            object val = (object)archivePath;
            WritePropertyBag(pb, "ArchivePath", val);
            
            val = (object)filePrefix;
            WritePropertyBag(pb, "FilePrefix", val);
        }

        /// <summary>
        /// Reads property value from property bag.
        /// </summary>
        /// <param name="pb">Property bag.</param>
        /// <param name="propName">Name of property.</param>
        /// <returns>Value of the property.</returns>
        private static object ReadPropertyBag(Microsoft.BizTalk.Component.Interop.IPropertyBag pb, string propName)
        {
            object val = null;
            try
            {
                pb.Read(propName,out val,0);
            }

            catch(ArgumentException)
            {
                return val;
            }
            catch(Exception ex)
            {
                throw new ApplicationException( ex.Message);
            }
            return val;
        }

        /// <summary>
        /// Writes property values into a property bag.
        /// </summary>
        /// <param name="pb">Property bag.</param>
        /// <param name="propName">Name of property.</param>
        /// <param name="val">Value of property.</param>
        private static void WritePropertyBag(Microsoft.BizTalk.Component.Interop.IPropertyBag pb, string propName, object val)
        {
            try
            {
                pb.Write(propName, ref val);
            }
            catch(Exception ex)
            {
                throw new ApplicationException( ex.Message);
            }
        }




        #endregion

        #region IComponentUI

        /// <summary>
        /// Component icon to use in BizTalk Editor.
        /// </summary>
        public System.IntPtr Icon
        {
            get { throw new System.NotImplementedException(); }
        }

        /// <summary>
        /// The Validate method is called by the BizTalk Editor during the build 
        /// of a BizTalk project.
        /// </summary>
        /// <param name="obj">Project system.</param>
        /// <returns>
        /// A list of error and/or warning messages encounter during validation
        /// of this component.
        /// </returns>
        public IEnumerator Validate(object obj)
        {
		IEnumerator enumerator = null;
		ArrayList   strList  = new ArrayList();

		// Validate prepend data property
		if (filePrefix == null) 
		{
			strList.Add("Must give a value to filePrefix property");
		}

		// validate append data property
		if (archivePath == null)
		{
			strList.Add("Must give a value to ArchivePath property");
		}

		if (strList.Count > 0) 
		{
			enumerator = strList.GetEnumerator();
		}

		return enumerator;
        }

        #endregion
    }
}
