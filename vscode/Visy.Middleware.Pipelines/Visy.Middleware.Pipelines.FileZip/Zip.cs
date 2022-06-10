
namespace Visy.Middleware.Pipelines.FileZip
{ 
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
    using Ionic.Zip;


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
    [System.Runtime.InteropServices.Guid("468791C1-0C6C-4aea-9191-47F94CB83E41")]
    public class Zip :	
        IBaseComponent, 
        Microsoft.BizTalk.Component.Interop.IComponent,
        Microsoft.BizTalk.Component.Interop.IPersistPropertyBag,
        IComponentUI
    {
		
        
        private string zip_password = "";        
        private const int bufferSize = 1024;

        const string FILEAdapterTargetNamespace = "http://schemas.microsoft.com/BizTalk/2003/file-properties";
        /// <summary>
        /// Data to prepend at the beginning of a stream.
        /// </summary>	
	
        

        public string ZipPassord
        {
            get { return zip_password; }
            set { zip_password = value; }
            
        }
        //private nsoftware.IPWorksZip.Zip ZipObj;
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
            get {   return "Zip Component";  }
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
            get {   return "Zip Pipeline Component"; }
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

            string origFileName = inmsg.Context.Read("ReceivedFileName", FILEAdapterTargetNamespace) as string;
            Stream origStream = inmsg.BodyPart.Data;
            origFileName = Path.GetFileName(origFileName);
            string ZipFileName = Path.ChangeExtension(origFileName,"zip");

            inmsg.BodyPart.Data = Encode(origStream, origFileName);

            //CHange RECEIVEFILENAME
            inmsg.Context.Write("ReceivedFileName", FILEAdapterTargetNamespace, ZipFileName);

            return inmsg;
        }
        #endregion

        public Stream Encode(Stream origStream,string origFileName)
        {
            string path = "";

            #region GET BIZTALK ZIP TEMPORARY PATH
            try
            {

                path = ConfigurationSettings.AppSettings["BiztalkZipPath"].ToString();
            }
            catch (Exception PathEx)
            {
                throw (new Exception("Missing entry in machine.config/appsettings for BiztalkZipPath.  Entry must be there before Zip can successfully run.", PathEx));
            }
            #endregion

            //string origFileName = Path.GetRandomFileName();

            string zip_file = Path.ChangeExtension(origFileName, "zip");
            string zip_fullpath = Path.Combine(path, zip_file);
            string file_fullpath = Path.Combine(path, origFileName);


            #region COPY ORIGINAL STREAM TO FILE   
            
            // Dump the data to the file, for archiving            
            FileStream fileToCompress = new FileStream(file_fullpath, FileMode.Create, FileAccess.Write);
            BinaryWriter binWriter = new BinaryWriter(fileToCompress);

            // Read the stream and send bytes to the file
            byte[] buffer = new byte[bufferSize];
            int sizeRead = 0;

            while ((sizeRead = origStream.Read(buffer, 0, bufferSize)) != 0)
            {
                binWriter.Write(buffer, 0, sizeRead);
            }
            
         
            binWriter.Flush();
            binWriter.Close();
            fileToCompress.Close();
            fileToCompress.Dispose();

            #endregion

            #region COMPRESS FILE


            using (ZipFile zipOutputStream = new ZipFile())
            {
                zipOutputStream.AddFile(file_fullpath, "");
                zipOutputStream.Save(zip_fullpath);
            }
           
            #endregion

            #region REMOVE "FILE TO COMPRESS" CREATED
            try
            {
                File.Delete(file_fullpath);
            }
            catch (Exception ex)
            {
                System.Diagnostics.EventLog.WriteEntry("Visy.Middleware.Pipelines.FileZip", "Unable to Delete File : " + file_fullpath, EventLogEntryType.Warning);
            }
            #endregion

            #region LOAD ZIP INTO MEMORYSTREAM
            //pickup Compressed file and set data to message
            //read contents and write to memory stram and than assign to message

            MemoryStream strmMem = new MemoryStream();
            try
            {
                FileStream CompressedFile = new FileStream(zip_fullpath, FileMode.Open);


                Byte[] tmpBuff = new Byte[4095];
                int bytesRead = CompressedFile.Read(tmpBuff, 0, tmpBuff.Length);
                while (bytesRead != 0)
                {
                    strmMem.Write(tmpBuff, 0, bytesRead);
                    bytesRead = CompressedFile.Read(tmpBuff, 0, tmpBuff.Length);
                }
                CompressedFile.Close();
                strmMem.Seek(0, System.IO.SeekOrigin.Begin);
            }
            catch (Exception ex)
            {
                System.Diagnostics.EventLog.WriteEntry("ZIP.COMMON", ex.Message, EventLogEntryType.Information);
            }
            #endregion

            #region REMOVE ZIP FILE CREATED
            try
            {
                File.Delete(zip_fullpath);
            }
            catch (Exception ex)
            {
                string ex_msg = "Unable to Delete File : " + zip_fullpath;
                System.Diagnostics.EventLog.WriteEntry("Visy.Middleware.Pipelines.FileZip", ex_msg , EventLogEntryType.Warning);
            }
            #endregion

            return strmMem;

        }

        #region IPersistPropertyBag
    
        /// <summary>
        /// Gets class ID of component for usage from unmanaged code.
        /// </summary>
        /// <param name="classid">Class ID of the component.</param>
        public void GetClassID(out Guid classid)
        {
            classid = new System.Guid("468791C1-0C6C-4aea-9191-47F94CB83E41");
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
           
        }
        
        /// <summary>
        /// Saves the current component configuration into the property bag.
        /// </summary>
        /// <param name="pb">Configuration property bag.</param>
        /// <param name="fClearDirty">Not used.</param>
        /// <param name="fSaveAllProperties">Not used.</param>
        public void Save(Microsoft.BizTalk.Component.Interop.IPropertyBag pb, Boolean fClearDirty, Boolean fSaveAllProperties)
        {
            
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

		

		if (strList.Count > 0) 
		{
			enumerator = strList.GetEnumerator();
		}

		return enumerator;
        }

        #endregion
    }
}
