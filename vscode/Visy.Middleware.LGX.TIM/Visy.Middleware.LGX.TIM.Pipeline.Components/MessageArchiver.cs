using System;
using System.IO;
using System.Text;
using System.Drawing;
using System.Resources;
using System.Reflection;
using System.Diagnostics;
using System.Collections;
using System.ComponentModel;
using Microsoft.BizTalk.Message.Interop;
using Microsoft.BizTalk.Component.Interop;
using Microsoft.BizTalk.Component;
using Microsoft.BizTalk.Messaging;
using Microsoft.BizTalk.Streaming;
//using Microsoft.Samples.BizTalk.Pipelines.CustomComponent;
using System.Xml;

namespace Visy.Middleware.LGX.TIM.PipelineComponents
{


    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    [System.Runtime.InteropServices.Guid("0f6c3914-4bfe-4023-aae9-eb1cfd5d81f5")]
    [ComponentCategory(CategoryTypes.CATID_Any)]
    public class MessageArchiver : Microsoft.BizTalk.Component.Interop.IComponent, IBaseComponent, IPersistPropertyBag, IComponentUI
    {

        private System.Resources.ResourceManager resourceManager = new System.Resources.ResourceManager("Visy.Middleware.LGX.TIM.PipelineComponents.MessageArchiver", Assembly.GetExecutingAssembly());

        #region Constants

        /// <summary>
        /// Maximum filename length - current limit under Windows 2003 (Ent.) Server (32-bit)
        /// When creating file and folder (directory) names limit your filenames to the characters A-Z, a-z, 0-9, underscore ( _ ), period ( . ), and hyphen ( - ).
        /// </summary>
        private const int MAX_FILENAME_LENGTH = 260;

        /// <summary>
        /// Size of buffer when performing an immediate copy to disk.
        /// </summary>
        private const int BUFFER_SIZE = 1024;

        public const string EVENT_LOG_SOURCE = "MessageArchiver";

        #endregion

        private string _archiveDirectoryMacroPath;
        private string _archiveFilenameMacroPath;
        private bool _overwriteExistingFile = false;
        private string _archiveFilePath;
        private bool _archivingEnabled;

        #region Get/Set Methods

        /// <summary>
        /// Archive directory.
        /// </summary>
        public string ArchiveDirectory
        {
            get
            {
                return _archiveDirectoryMacroPath;
            }
            set
            {
                _archiveDirectoryMacroPath = value;
            }
        }

        /// <summary>
        /// Archive filename.
        /// </summary>
        public string ArchiveFilename
        {
            get
            {
                return _archiveFilenameMacroPath;
            }
            set
            {
                _archiveFilenameMacroPath = value;
            }
        }

        /// <summary>
        /// Overwrite existing file boolean flag.
        /// </summary>
        public bool OverwriteExistingFile
        {
            get
            {
                return _overwriteExistingFile;
            }
            set
            {
                _overwriteExistingFile = value;
            }
        }


        /// <summary>
        /// Enables/disables the archiving component.
        /// </summary>
        public bool ArchivingEnabled
        {
            get
            {
                return _archivingEnabled;
            }
            set
            {
                _archivingEnabled = value;
            }
        }

        #endregion

        #region IBaseComponent members
        /// <summary>
        /// Name of the component
        /// </summary>
        [Browsable(false)]
        public string Name
        {
            get
            {
                return resourceManager.GetString("COMPONENTNAME", System.Globalization.CultureInfo.InvariantCulture);
            }
        }

        /// <summary>
        /// Version of the component
        /// </summary>
        [Browsable(false)]
        public string Version
        {
            get
            {
                return resourceManager.GetString("COMPONENTVERSION", System.Globalization.CultureInfo.InvariantCulture);
            }
        }

        /// <summary>
        /// Description of the component
        /// </summary>
        [Browsable(false)]
        public string Description
        {
            get
            {
                return resourceManager.GetString("COMPONENTDESCRIPTION", System.Globalization.CultureInfo.InvariantCulture);
            }
        }
        #endregion

        #region IPersistPropertyBag members
        /// <summary>
        /// Gets class ID of component for usage from unmanaged code.
        /// </summary>
        /// <param name="classid">
        /// Class ID of the component
        /// </param>
        public void GetClassID(out System.Guid classid)
        {
            classid = new System.Guid("0f6c3914-4bfe-4023-aae9-eb1cfd5d81f5");
        }

        /// <summary>
        /// not implemented
        /// </summary>
        public void InitNew()
        {
        }

        /// <summary>
        /// Loads configuration properties for the component
        /// </summary>
        /// <param name="pb">Configuration property bag</param>
        /// <param name="errlog">Error status</param>
        public virtual void Load(IPropertyBag pb, int errlog)
        {
            object val;
            val = ReadPropertyBag(pb, "ArchiveDirectory");
            if ((val != null))
            {
                _archiveDirectoryMacroPath = ((string)(val));
            }
            val = ReadPropertyBag(pb, "ArchiveFilename");
            if ((val != null))
            {
                _archiveFilenameMacroPath = ((string)(val));
            }
            val = ReadPropertyBag(pb, "OverwriteExistingFile");
            if ((val != null))
            {
                _overwriteExistingFile = ((bool)(val));
            }
            val = ReadPropertyBag(pb, "ArchivingEnabled");
            if ((val != null))
            {
                _archivingEnabled = ((bool)(val));
            }
        }

        /// <summary>
        /// Saves the current component configuration into the property bag
        /// </summary>
        /// <param name="pb">Configuration property bag</param>
        /// <param name="fClearDirty">not used</param>
        /// <param name="fSaveAllProperties">not used</param>
        public virtual void Save(IPropertyBag pb, bool fClearDirty, bool fSaveAllProperties)
        {
            WritePropertyBag(pb, "ArchiveDirectory", ArchiveDirectory);
            WritePropertyBag(pb, "ArchiveFilename", ArchiveFilename);
            WritePropertyBag(pb, "OverwriteExistingFile", OverwriteExistingFile);
            WritePropertyBag(pb, "ArchivingEnabled", ArchivingEnabled);
        }

        #region utility functionality
        /// <summary>
        /// Reads property value from property bag
        /// </summary>
        /// <param name="pb">Property bag</param>
        /// <param name="propName">Name of property</param>
        /// <returns>Value of the property</returns>
        private object ReadPropertyBag(IPropertyBag pb, string propName)
        {
            object val = null;
            try
            {
                pb.Read(propName, out val, 0);
            }
            catch (ArgumentException)
            {
                return val;
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }
            return val;
        }

        /// <summary>
        /// Writes property values into a property bag.
        /// </summary>
        /// <param name="pb">Property bag.</param>
        /// <param name="propName">Name of property.</param>
        /// <param name="val">Value of property.</param>
        private void WritePropertyBag(IPropertyBag pb, string propName, object val)
        {
            try
            {
                pb.Write(propName, ref val);
            }
            catch (Exception e)
            {
                throw new ApplicationException(e.Message);
            }
        }
        #endregion

        #endregion

        #region IComponentUI members
        /// <summary>
        /// Component icon to use in BizTalk Editor
        /// </summary>
        [Browsable(false)]
        public IntPtr Icon
        {
            get
            {
                return ((System.Drawing.Bitmap)(this.resourceManager.GetObject("COMPONENTICON", System.Globalization.CultureInfo.InvariantCulture))).GetHicon();
            }
        }

        /// <summary>
        /// The Validate method is called by the BizTalk Editor during the build 
        /// of a BizTalk project.
        /// </summary>
        /// <param name="obj">An Object containing the configuration properties.</param>
        /// <returns>The IEnumerator enables the caller to enumerate through a collection of strings containing error messages. These error messages appear as compiler error messages. To report successful property validation, the method should return an empty enumerator.</returns>
        public System.Collections.IEnumerator Validate(object obj)
        {
            // example implementation:
            // ArrayList errorList = new ArrayList();
            // errorList.Add("This is a compiler error");
            // return errorList.GetEnumerator();
            return null;
        }
        #endregion

        #region IComponent members

        /// <summary>
        /// Implements IComponent.Execute method.
        /// </summary>
        /// <param name="context">Pipeline context</param>
        /// <param name="inMsg">Input message</param>
        /// <returns>Original input message</returns>
        /// <remarks>
        /// IComponent.Execute method is used to initiate
        /// the processing of the message in this pipeline component.
        /// </remarks>
        public IBaseMessage Execute(IPipelineContext context, IBaseMessage message)
        {
            //this method should always catch exceptions internally and write to the event log where SCOM should pick it up
            //archiving failures should never stop message processing...
            try
            {
                if (ArchivingEnabled)
                {
                    if (string.IsNullOrEmpty(ArchiveDirectory) ||string.IsNullOrEmpty(ArchiveFilename))
                    {
                        throw new Exception("Archive Directory and/or Archive Filename cannot be empty.");
                    }
                    
                    if (message.BodyPart != null)
                    {
                        // Expand macros and build the archive file path.
                        _archiveFilePath = BuildArchiveFilePath(message);

                        // Create a Forward-Only Eventing Stream.
                        message.BodyPart.Data = CreateForwardOnlyEventingStream(message.BodyPart.GetOriginalDataStream());
                    }
                    else
                    {
                        System.Diagnostics.EventLog.WriteEntry(EVENT_LOG_SOURCE, "Could not archive message - the body part is null.", EventLogEntryType.Error, (int)EventData.BizTalkMessageValidation.BodyPartIsNull);
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.EventLog.WriteEntry(EVENT_LOG_SOURCE, String.Format("An error occured creating the archive file at {0}.\n\nThe following error was raised: {1}", ArchiveDirectory, ex.Message), EventLogEntryType.Error, (int)EventData.ArchiveFileWriteFailures.GeneralExceptionWritingArchiveFile);
            }
            finally
            {
                message.BodyPart.Data.Seek(0, SeekOrigin.Begin);
            }
            
            return (message);
        }

        /// <summary>
        /// Validate component configuration.
        /// </summary>
        /// <returns>Boolean indicating whether the component configuration is valid.</returns>
        private bool ComponentConfigurationValid()
        {
            return true;
        }

        /// <summary>
        /// Create a forward-only eventing stream.
        /// </summary>
        /// <param name="originalStream">Stream containing the original data stream.</param>
        /// <returns>Stream wrapped forward-only eventing stream.</returns>
        private Stream CreateForwardOnlyEventingStream(Stream originalStream)
        {
            DeleteExistingArchiveFile();

            // Create the forward-only eventing stream
            CForwardOnlyEventingReadStream eventingStream = new CForwardOnlyEventingReadStream(originalStream);
            eventingStream.ReadEvent += StreamOnReadEvent;

            return (eventingStream);
        }

        /// <summary>
        /// Delete the archive file if it already exists and the component has been configured to overwrite.
        /// </summary>
        private void DeleteExistingArchiveFile()
        {
            if (File.Exists(_archiveFilePath) && OverwriteExistingFile)
            {
                File.Delete(_archiveFilePath);
            }
        }

        /// <summary>
        /// Builds the file path for the archive file after replacing directory and filename macros.
        /// </summary>
        /// <param name="inMsg">BizTalk input message.</param>
        /// <returns>The file path for the archive file.</returns>
        private string BuildArchiveFilePath(IBaseMessage inMsg)
        {

            // Replace the archive directory & filename Macro Path Properties with 
            // Context Property vales from the current message.
            string archiveDirectory = ContextPropertiesHelper.UpdateMacroPathProperty(inMsg, _archiveDirectoryMacroPath.TrimEnd('\\') + "\\");
            string archiveFilename = ContextPropertiesHelper.UpdateMacroPathProperty(inMsg, _archiveFilenameMacroPath);

            // Create the directory if it does not already exist.
            if (!Directory.Exists(archiveDirectory))
            {
                Directory.CreateDirectory(archiveDirectory);
            }

            // If the file exists **and** the file should not be overwritten, add a GUID onto the end 
            // of the filename before the file extension.
            if (File.Exists(archiveDirectory + archiveFilename) && OverwriteExistingFile != true)
            {
                archiveFilename = Path.GetFileNameWithoutExtension(archiveFilename) + "-{" + Guid.NewGuid() + "}" +
                                  Path.GetExtension(archiveFilename);
            }

            // Build the final archive 'full file path'.
            string archiveFileFullPath = archiveDirectory + archiveFilename;

            // Modify the full file path if greater than the max filename length.
            if (archiveFileFullPath.Length > MAX_FILENAME_LENGTH)
            {
                archiveFileFullPath = archiveDirectory + inMsg.MessageID + Path.GetExtension(archiveFilename);
                System.Diagnostics.EventLog.WriteEntry(EVENT_LOG_SOURCE,
                                                       "After macro replacement, the full file path exceeded the operating system maximum length of " +
                                                       MAX_FILENAME_LENGTH + " characters. The file has been saved to " +
                                                       archiveFileFullPath, EventLogEntryType.Warning);
            }

            return archiveFileFullPath;
        }

        /// <summary>
        /// Stream 'On Read Event'. Called as downstream components or the BizTalk Messaging Agent itself 
        /// reads the message. This method spools the portion of the stream read to disk. An 'optimised' copy.
        /// </summary>
        /// <param name="src"></param>
        /// <param name="args"></param>
        private void StreamOnReadEvent(object src, EventArgs args)
        {
            ReadEventArgs rargs = args as ReadEventArgs;

            if (rargs != null)
            {
                try
                {
                    using (
                        FileStream FileArchiveStream =
                            new FileStream(_archiveFilePath, FileMode.Append, FileAccess.Write))
                    {
                        using (BinaryWriter FileBinaryWriter = new BinaryWriter(FileArchiveStream))
                        {
                            FileBinaryWriter.Write(rargs.buffer, 0, rargs.bytesRead);

                            // Close the file writer.
                            FileBinaryWriter.Flush();
                            FileBinaryWriter.Close();
                        }
                    }
                }
                catch (IOException Ex)
                {
                    System.Diagnostics.EventLog.WriteEntry(EVENT_LOG_SOURCE, String.Format("An error occured creating the archive file at {0}.\n\nThe following error was raised: {1}", _archiveFilePath, Ex.Message), EventLogEntryType.Error, (int)EventData.ArchiveFileWriteFailures.ArchiveFileFailedToWrite);
                }
                catch (Exception Ex)
                {
                    System.Diagnostics.EventLog.WriteEntry(EVENT_LOG_SOURCE, String.Format("An error occured creating the archive file at {0}.\n\nThe following error was raised: {1}", _archiveFilePath, Ex.Message), EventLogEntryType.Error, (int)EventData.ArchiveFileWriteFailures.GeneralExceptionWritingArchiveFile);
                }
            }
            else
            {
                // Supplied event arguements are null.
                System.Diagnostics.EventLog.WriteEntry(EVENT_LOG_SOURCE, String.Format("An error occured creating the archive file at {0}.\n\nThe stream OnRead event did not contain Event Args, the archive file cannot be written.", _archiveFilePath), EventLogEntryType.Error, (int)EventData.ArchiveFileWriteFailures.EventArgsAreNull);
            }
        }

        /// <summary>
        /// Performs an immediate copy of the file to disk - a 'non-optimised' copy. 
        /// </summary>
        /// <param name="dataStream"></param>
        private Stream PerformImmediateCopy(VirtualStream dataStream)
        {
            DeleteExistingArchiveFile();

            string CopyToFileNameTemp = _archiveFilePath + ".tmp";

            try
            {
                FileStream FileArchiveStream = new FileStream(CopyToFileNameTemp, FileMode.Create, FileAccess.Write);
                BinaryWriter FileBinaryWriter = new BinaryWriter(FileArchiveStream);

                // Read the stream and write to the archive file
                byte[] Buffer = new byte[BUFFER_SIZE];
                int SizeRead;
                while ((SizeRead = dataStream.Read(Buffer, 0, BUFFER_SIZE)) != 0)
                {
                    FileBinaryWriter.Write(Buffer, 0, SizeRead);
                }

                // Flush and close the output stream
                FileBinaryWriter.Flush();
                FileBinaryWriter.Close();

                // Rename the archived (.tmp) file to its correct extension.
                try
                {
                    File.Move(CopyToFileNameTemp, _archiveFilePath);
                }
                catch (IOException Ex)
                {
                    System.Diagnostics.EventLog.WriteEntry(EVENT_LOG_SOURCE, "An error occured moving the temporary archive file - the file has not been archived.\n\nThe following error was raised: " + Ex.Message, EventLogEntryType.Error);
                }
            }
            catch (IOException Ex)
            {
                System.Diagnostics.EventLog.WriteEntry(EVENT_LOG_SOURCE, "An error occured creating the archive file - the file has not been archived.\n\nThe following error was raised: " + Ex.Message, EventLogEntryType.Error);
            }

            dataStream.Seek(0, SeekOrigin.Begin);
            return (dataStream);
        }

        #endregion
    }
}
