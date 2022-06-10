using System;
using System.Collections;
using System.IO;
using System.Reflection;
using System.Resources;
using System.Runtime.InteropServices;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.BizTalk.Component;
using Microsoft.BizTalk.Component.Interop;
using Microsoft.BizTalk.Message.Interop;
using System.ComponentModel;

namespace Visy.Middleware.LGX.Orders.DelimitedFF.PipelineComponents
{
    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    [ComponentCategory(CategoryTypes.CATID_Any)]
    [Guid("17107CAB-66C1-4E5A-BEAF-BA99CCAA8952")]
    public class ConverterLGXOrderDFF : IComponentUI, IBaseComponent, IPersistPropertyBag, Microsoft.BizTalk.Component.Interop.IComponent
    {
        //private static ResourceManager resManager;

        private const string FilePropertiesTargetNamespace = "http://schemas.microsoft.com/BizTalk/2003/file-properties";

        private string someProperty = null;

        //static ConverterLGXOrderDFF()
        //{
        //    resManager = new ResourceManager("Common.LGX.Converters.Order.DelimitedFF.Helper.Resources.ConverterLGXOrderDFFResource", Assembly.GetExecutingAssembly());
        //}

        public string SomeProperty
        {
            get { return someProperty; }
            set { someProperty = value; }
        }

        #region IComponentUI Members

        [Browsable(false)]
        public IntPtr Icon
        {
            get { throw new System.NotImplementedException(); }
        }

        public IEnumerator Validate(object projectSystem)
        {
            IEnumerator enumerator = null;
            ArrayList strList = new ArrayList();

            if (strList.Count > 0)
            {
                enumerator = strList.GetEnumerator();
            }

            return enumerator;
        }

        #endregion IComponentUI Members

        #region IBaseComponent Members

        [Browsable(false)]
        public string Description
        {
            get 
            {
                return "FF to LGX XML Converter";
            }
        }

        [Browsable(false)]
        public string Name
        {
            get 
            {
                return "FFToLGXxmlConverter";
            }
        }

        [Browsable(false)]
        public string Version
        {
            get
            {
                return "1.0.0.0";
            }
        }

        #endregion IBaseComponent Members

        #region IPersistPropertyBag Members
        
        public void GetClassID(out Guid classID)
        {
            classID = new Guid("17107CAB-66C1-4E5A-BEAF-BA99CCAA8952");
        }

        public void InitNew()
        {
        }

        public void Load(IPropertyBag propertyBag, int errorLog)
        {
            object val = ReadPropertyBag(propertyBag, "SomeProperty");
            if (val != null)
                someProperty = val.ToString();
        }

        public void Save(IPropertyBag propertyBag, bool clearDirty, bool saveAllProperties)
        {
            object val = (object)someProperty;
            WritePropertyBag(propertyBag, "SomeProperty", val);
        }

        #region IPersistPropertyBag Helper Methods

        public static object ReadPropertyBag(IPropertyBag pb, string propName)
        {
            object val = null;
            try
            {
                pb.Read(propName, out val, 0);
            }
            catch (System.ArgumentException)
            {
                return val;
            }
            catch (System.Exception e)
            {
                throw new System.ApplicationException(e.Message);
            }
            return val;
        }

        public static void WritePropertyBag(IPropertyBag pb, string propName, object val)
        {
            try
            {
                pb.Write(propName, ref val);
            }
            catch (System.Exception e)
            {
                throw new System.ApplicationException(e.Message);
            }
        }


        #endregion IPersistPropertyBag Helper Methods

        #endregion IPersistPropertyBag Members

        #region IComponent Members

        public IBaseMessage Execute(IPipelineContext pContext, IBaseMessage pInMsg)
        {
            Stream msgStream = pInMsg.BodyPart.GetOriginalDataStream();
            StreamReader readStreamReader = new StreamReader(msgStream);
            string orderMessage = string.Empty;
            string receivedFileName = string.Empty;
            string sourceFileName = string.Empty;
            string definitionName = string.Empty;

            try
            {
                // Get file name
                
                try
                {
                    receivedFileName = pInMsg.Context.Read("ReceivedFileName", FilePropertiesTargetNamespace).ToString();
                }
                catch
                {
                }
                finally
                {
                    if (string.IsNullOrEmpty(receivedFileName))
                        receivedFileName = string.Empty;
                }

                if (receivedFileName.Contains("\\"))
                    sourceFileName = receivedFileName.Substring(receivedFileName.LastIndexOf("\\") + 1);
                else
                    sourceFileName = receivedFileName;

                if (sourceFileName.Contains("~"))
                    definitionName = sourceFileName.Substring(0, sourceFileName.IndexOf("~"));
                else
                    definitionName = sourceFileName;

                // Get file definition from SharePoint List

                //string delimFileDefinition = @"TestDefinitionName~,~CRLF~1~1~H1P1~LAC~H1P2~H1P3~1yyMMdd~D~hh:mm~O1P1~O1P2~O1P3~O1P4~O1P5~yyyyMMdd~H1P4~LTH";
                //string delimFileDefinition = @"Willow_Ware~,~CRLF~0~1~L 9399999002128~LNA~O1P1~O1P2~1yyMMdd~D~hh:mm:ss:fff~O1P4~O1P5~O1P7~O1P6~O1P3~1yyMMdd~LWHC-W1804~LTH";
                string delimFileDefinition = Visy.Middleware.Components.Utilities.DataLookupHelper.GetInterfaceLookupData(definitionName, "LGX.Orders.DelimitedFF");//Helper.GetLGXOrdersFFValues(definitionName);

                
                // Convert delimited ff to array

                string[] fileDefinition = LGXOrderWriter.GetFileDefinition(delimFileDefinition);

                char columnDelimiter = ',';
                string rowDelimiter = string.Empty;

                columnDelimiter = Char.Parse(fileDefinition[(int)LGXOrderWriter.FileDefLocations.ColumnDelimeter]);
                rowDelimiter = fileDefinition[(int)LGXOrderWriter.FileDefLocations.RowDelimeter];
                
                // Create Order Message

                List<DelimitedRow> rows = new List<DelimitedRow>();
                DelimitedRow row;

                //orderMessage = readStreamReader.ReadToEnd();

                using (DelimitedFileReader reader = new DelimitedFileReader(msgStream))
                {
                    rows = reader.ReadRows(columnDelimiter, rowDelimiter);
                }

                orderMessage = LGXOrderWriter.WriteOrder(rows, fileDefinition);

                // write LGX Order messages to pInMsg container

                MemoryStream orderMemoryStream = new MemoryStream();
                StreamWriter orderStreamWriter = new StreamWriter(orderMemoryStream);
                orderStreamWriter.AutoFlush = true;
                orderStreamWriter.Write(orderMessage);
                orderMemoryStream.Position = 0;

                pInMsg.BodyPart.Data = orderMemoryStream;

                System.Diagnostics.Trace.WriteLine("Hello from converter pipeline");

                System.Diagnostics.Trace.WriteLine(orderMessage);
                System.Diagnostics.Trace.WriteLine(fileDefinition.ToString());
                System.Diagnostics.Trace.WriteLine(String.Format("Column Delimiter: {0}, Row Delimiter: {1}, Received File Name: {2}, Source File Name: {3}, Some Property Value: {4}, Definition Name: {5}", columnDelimiter, rowDelimiter, receivedFileName, sourceFileName, someProperty, definitionName));
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.WriteLine(String.Format("ConverterLGXOrderDFF.Execute failed because: {0}", ex.Message));
            }

            return pInMsg;
        }

        #endregion IComponent Members
    }
}
