using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.BizTalk.Streaming;
using Microsoft.BizTalk.Message.Interop;
using Microsoft.BizTalk.Component.Interop;
using System.IO;


namespace SAP.ANZBank.Splitter.Pipeline
{
    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    [ComponentCategory(CategoryTypes.CATID_Decoder)]
    [System.Runtime.InteropServices.Guid("E6AB3EB4-480E-4e2f-8139-A58B5784F1DA")]
    public class ANZFileSplitter : IBaseComponent,IComponentUI,IComponent,IPersistPropertyBag  
    {

        #region VariabeleDeclaration

            string strInterfaceName = string.Empty;
            string strPartyIdentifier = string.Empty;

            private int _messageIndex = 0;
            private System.Collections.ArrayList _outputFiles = null;

            private IPipelineContext _pipelineContext;
            private IBaseMessage _inMessage;
            private IBaseMessageContext originalMsgContext;


        #endregion

        #region IBaseComponent
           

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

            private System.Collections.ArrayList OutputFiles
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
                get { return "ANZ File Filter"; }
            }

            public string Name
            {
                get { return "ANZFileFilter"; }
            }

            public string Version
            {
                get { return "1.0"; }
            }


            #endregion

            #region IComponentUI Members

            [System.ComponentModel.Browsable(false)]
            public IntPtr Icon
            {
                get { return System.IntPtr.Zero; }
            }

            [System.ComponentModel.Browsable(false)]
            public System.Collections.IEnumerator Validate(object projectSystem)
            {
                System.Collections.IEnumerator enumerator = null;
                return enumerator;
            }


            #endregion
            #region IPersistPropertyBag members

            /// <summary>
            /// Gets class ID of component for usage from unmanaged code.
            /// </summary>
            /// <param name="classid">
            /// Class ID of the component
            /// </param>
            public void GetClassID(out Guid classid)
            {
                classid = new Guid("CD74CFCC-4FC1-4e2f-A570-G172A77CBF05");
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
            }

            /// <summary>
            /// Saves the current component configuration into the property bag
            /// </summary>
            /// <param name="pb">Configuration property bag</param>
            /// <param name="fClearDirty">not used</param>
            /// <param name="fSaveAllProperties">not used</param>
            public virtual void Save(IPropertyBag pb, bool fClearDirty, bool fSaveAllProperties)
            {
            }
            #endregion

            #region IComponent Members

            public IBaseMessage Execute(IPipelineContext pc, IBaseMessage inmsg)
            {
                try
                {
                    string filePreFix = string.Empty;
                    string fileName = string.Empty;
                    string fileName1 = string.Empty;
                    IBaseMessageContext context = inmsg.Context;

                    string srcFileName = context.Read("ReceivedFileName", "http://schemas.microsoft.com/BizTalk/2003/file-properties").ToString();

                    int LastIndex = srcFileName.LastIndexOf("\\");
                    srcFileName = srcFileName.Substring(LastIndex + 1, srcFileName.Length - LastIndex - 1);
                    if (srcFileName.Substring(0, 4) == "BPTD")
                    {
                        fileName = "IVR_" + srcFileName;
                    }
                    else
                    {
                        fileName = "WEBLINK_" + srcFileName;
                    }
                    context.Write("ReceivedFileName", "http://schemas.microsoft.com/BizTalk/2003/file-properties", fileName);

                }
                catch
                {
                    throw new Exception("Error Preprocessing ANZ Bank File Filter.");
                }
                finally
                {
                    //reader.Close();
                }
                return inmsg;

            }

            #endregion

    }
}
