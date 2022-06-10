using System;
using System.IO;
using System.Text;
using System.Drawing;
using System.Resources;
using System.Reflection;
using System.Diagnostics;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Xml;
using System.Xml.Schema;
using System.Data;
using System.Linq;
using Microsoft.BizTalk.Component.Interop;
using Microsoft.BizTalk.Message.Interop;
using Microsoft.BizTalk.Streaming;
using Microsoft.BizTalk.Component;
using Microsoft.BizTalk.Messaging;

//using Microsoft.BizTalk.Component.Utilities;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using EXCEL = Microsoft.Office.Interop.Excel;
using System.Text.RegularExpressions;
using System.Security.Policy;
using System.Security;

namespace Visy.Middleware.Pipelines.ExcelForceXlsx
{
    [System.Runtime.InteropServices.Guid("36353bdc-fd2b-449c-ba9b-5a6faa3429c7")]
    [ComponentCategory(CategoryTypes.CATID_DisassemblingParser)]
    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    public class ExcelForecastDasm : IBaseComponent, IComponentUI, IPersistPropertyBag,
        IDisassemblerComponent
    {
        #region private variables

        // Component internal
        private IPipelineContext _pipelineContext;
        private IBaseMessage _inMessage;
        private IBaseMessageContext originalMsgContext;
        private string TempDirPath = System.Configuration.ConfigurationManager.AppSettings["XLSX2XMLTempPath"];
        private Queue<IBaseMessage> qOutputMsgs = new Queue<IBaseMessage>();

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

        #region Public Properties
        // Properties declarations.
        private bool _GenerateHeaderFields;
        public bool GenerateHeaderFields
        {
            get { return _GenerateHeaderFields; }
            set { _GenerateHeaderFields = value; }
        }

        private bool _GenerateTrailerFields;
        public bool GenerateTrailerFields
        {
            get { return _GenerateTrailerFields; }
            set { _GenerateTrailerFields = value; }
        }       

        private string _RootElementName;
        public string RootElementName
        {
            get { return string.IsNullOrEmpty(_RootElementName) ? "root" : _RootElementName; }
            set { _RootElementName = value; }
        }
       
        private string _NamespaceName;
        public string NamespaceName
        {
            get { return string.IsNullOrEmpty(_NamespaceName) ? "http://Visy.Middleware" : _NamespaceName; }
            set { _NamespaceName = value; }
        }

        private string _ExcelSheetName;
        public string ExcelSheetName
        {
            get { return string.IsNullOrEmpty(_ExcelSheetName) ? "Sheet1" : _ExcelSheetName; }
            set { _ExcelSheetName = value; }
        }

        private int _StartDetailsRowNo;
        public int StartDetailsRowNo
        {
            get { return _StartDetailsRowNo; }
            set { _StartDetailsRowNo = value; }
        }
        private int _HeaderRowNo;
        public int HeaderRowNo
        {
            get { return _HeaderRowNo; }
            set { _HeaderRowNo = value; }
        }

        private string _DateFormat;
        public string DateFormat
        {
            get { return string.IsNullOrEmpty(_DateFormat) ? "yyyyMMdd" : _DateFormat; }
            set { _DateFormat = value; }
        }
        #endregion

        #region IBaseComponent members
        /// <summary>
        /// Name of the component
        /// </summary>      
        [Browsable(true)]
        public string Name
        {
            get
            {
                return "ExcelForceXlsxDasm";
            }
        }
        /// <summary>
        /// Version of the component
        /// </summary>      
        [Browsable(true)]
        public string Version
        {
            get
            {
                return "1.0.0.0";
            }
        }
        /// <summary>
        /// Description of the component
        /// </summary>      
        [Browsable(true)]
        public string Description
        {
            get
            {
                return "Excel to xslx disassembler";
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
            classid = new System.Guid("0022db2c-1599-3108-9312-ec4f9b66c356");
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
        public virtual void Load(Microsoft.BizTalk.Component.Interop.IPropertyBag pb, int errlog)
        {
            object val;
            val = this.ReadPropertyBag(pb, "GenerateHeaderFields");
            if (val != null)
            {
                this.GenerateHeaderFields = ((bool)(val));
            }
            val = this.ReadPropertyBag(pb, "GenerateTrailerFields");
            if (val != null)
            {
                this.GenerateTrailerFields = ((bool)(val));
            }
            val = this.ReadPropertyBag(pb, "RootElementName");
            if (val != null)
            {
                this.RootElementName = ((string)(val));
            }
           
            val = this.ReadPropertyBag(pb, "NamespaceName");
            if (val != null)
            {
                this.NamespaceName = ((string)(val));
            }

            val = this.ReadPropertyBag(pb, "StartDetailsRowNo");
            if (val != null)
            {
                this.StartDetailsRowNo = ((int)(val));
            }

            val = this.ReadPropertyBag(pb, "HeaderRowNo");
            if (val != null)
            {
                this.HeaderRowNo = ((int)(val));
            }

            val = this.ReadPropertyBag(pb, "ExcelSheetName");
            if (val != null)
            {
                this.ExcelSheetName = ((string)(val));
            }

            val = this.ReadPropertyBag(pb, "DateFormat");
            if (val != null)
            {
                this.DateFormat = ((string)(val));
            }
        }
        /// <summary>
        /// Saves the current component configuration into the property bag
        /// </summary>
        /// <param name="pb">Configuration property bag</param>
        /// <param name="fClearDirty">not used</param>
        /// <param name="fSaveAllProperties">not used</param>
        public virtual void Save(Microsoft.BizTalk.Component.Interop.IPropertyBag pb, bool fClearDirty, bool fSaveAllProperties)
        {
            this.WritePropertyBag(pb, "GenerateHeaderFields", this.GenerateHeaderFields);
            this.WritePropertyBag(pb, "GenerateTrailerFields", this.GenerateTrailerFields);
            this.WritePropertyBag(pb, "RootElementName", this.RootElementName);           
            this.WritePropertyBag(pb, "NamespaceName", this.NamespaceName);
            this.WritePropertyBag(pb, "StartDetailsRowNo", this.StartDetailsRowNo);
            this.WritePropertyBag(pb, "HeaderRowNo", this.HeaderRowNo);
            this.WritePropertyBag(pb, "ExcelSheetName", this.ExcelSheetName);
            this.WritePropertyBag(pb, "DateFormat", this.DateFormat);
        }
        #region utility functionality
        /// <summary>
        /// Reads property value from property bag
        /// </summary>
        /// <param name="pb">Property bag</param>
        /// <param name="propName">Name of property</param>
        /// <returns>Value of the property</returns>
        private object ReadPropertyBag(Microsoft.BizTalk.Component.Interop.IPropertyBag pb, string propName)
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
        /// <summary>
        /// Writes property values into a property bag.
        /// </summary>
        /// <param name="pb">Property bag.</param>
        /// <param name="propName">Name of property.</param>
        /// <param name="val">Value of property.</param>
        private void WritePropertyBag(Microsoft.BizTalk.Component.Interop.IPropertyBag pb, string propName, object val)
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
        #endregion
        #endregion

        #region IComponentUI members
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
        /// <param name="pc">Pipeline context</param>
        /// <param name="inmsg">Input message</param>
        /// <returns>Original input message</returns>
        /// <remarks>
        /// IComponent.Execute method is used to initiate
        /// the processing of the message in this pipeline component.
        /// </remarks>

        // Here we go... this is where the real work is done!
        public void Disassemble(IPipelineContext pContext, IBaseMessage pInMsg)
        {

            // The 'SpreadsheetDocument.Open' method throws a System.IndexOutOfRange exception when you use the stream from inmsg directly. This is because this is a Microsoft.BizTalk.Message.Interop.StreamViewOfIStream occurence. So first I copy it to a regular MemoryStream.

            Stream instream;// = CopyStream(inmsg.BodyPart.GetOriginalDataStream());

            this._pipelineContext = pContext;
            this._inMessage = pInMsg;
            this.originalMsgContext = PipelineUtil.CloneMessageContext(pInMsg.Context);
            Stream originalDataStream = pInMsg.BodyPart.GetOriginalDataStream();
            string fileName = Path.GetFileName(pInMsg.Context.Read("ReceivedFileName", "http://schemas.microsoft.com/BizTalk/2003/file-properties").ToString());
            string extension = Path.GetExtension(fileName);

            string str1 = this.TempDirPath + Guid.NewGuid().ToString();

            this.WriteStreamToFile(originalDataStream, str1);
            EXCEL.Application instance = (EXCEL.Application)Activator.CreateInstance(Type.GetTypeFromCLSID(new Guid("00024500-0000-0000-C000-000000000046")));

            EXCEL.Workbook workbook = instance.Workbooks.Open(str1, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing, Type.Missing);
            workbook.CheckCompatibility = false;
            workbook.DoNotPromptForConvert = true;
            instance.DisplayAlerts = false;
            instance.Workbooks.Application.DisplayAlerts = false;
            workbook.SaveAs((object)str1, (object)EXCEL.XlFileFormat.xlOpenXMLWorkbook, Type.Missing, Type.Missing, (object)false, (object)false, EXCEL.XlSaveAsAccessMode.xlNoChange, (object)EXCEL.XlSaveConflictResolution.xlUserResolution, (object)true, Type.Missing, Type.Missing, Type.Missing);
            workbook.Close((object)false, Type.Missing, Type.Missing);

            instance.Application.Quit();
            using (Stream stTemp = new FileStream(str1 + ".xlsx", FileMode.Open))
            {
                instream = CopyStream(stTemp);
            }
            this.DeleteTempFile(str1 + ".xlsx");
            this.DeleteTempFile(str1);

            //try
            //{
            #region Office SDK
            string xml = string.Empty;
            XmlDocument xmldoc = new XmlDocument();
            XmlElement root = xmldoc.CreateElement(RootElementName, NamespaceName);
            xmldoc.AppendChild(root);

            
            using (SpreadsheetDocument doc = SpreadsheetDocument.Open(instream, false))
            {
                WorkbookPart wbp = doc.WorkbookPart;
                SharedStringTablePart shareStringPart = doc.WorkbookPart.GetPartsOfType<SharedStringTablePart>().First();
                SharedStringItem[] items = shareStringPart.SharedStringTable.Elements<SharedStringItem>().ToArray();

                var sheet = this.ExcelSheetName == string.Empty ? wbp.Workbook.Descendants<Sheet>().Where(a => a.Name.Value == "Sheet1").First() : wbp.Workbook.Descendants<Sheet>().Where(a => a.Name.Value == this.ExcelSheetName).FirstOrDefault();
                sheet = sheet == null ? wbp.Workbook.Descendants<Sheet>().First() : sheet;

                var worksheet = ((WorksheetPart)doc.WorkbookPart.GetPartById(sheet.Id)).Worksheet;

                var cellFormats = wbp.WorkbookStylesPart.Stylesheet.CellFormats;
                var numberingFormats = wbp.WorkbookStylesPart.Stylesheet.NumberingFormats;

                var columnHeaders = new Hashtable();
              
                foreach (Row row in worksheet.Descendants<Row>())
                {
                    
                    if (row.RowIndex.Value == this.HeaderRowNo && this.GenerateHeaderFields)
                    {
                       
                        XmlElement rownode = xmldoc.CreateElement("Header", NamespaceName);
                        root.AppendChild(rownode);
                        foreach (Cell cell in row)
                        {
                            //cell.DataType = DocumentFormat.OpenXml.Spreadsheet.CellValues.String;
                            string col = GetCellColumn(cell);
                            string nodename;
                            if (columnHeaders.ContainsKey(col))
                                nodename = (string)columnHeaders[col];
                            else
                                nodename = "Field" + col;

                            string cellvalue = GetCellValue(cell, items).Trim();

                            if (!string.IsNullOrEmpty(cellvalue))
                            {
                                XmlElement node = xmldoc.CreateElement(nodename, NamespaceName);
                                node.InnerText = cellvalue;
                                rownode.AppendChild(node);
                            }
                        }
                    }
                    if (row.RowIndex.Value >= this.StartDetailsRowNo) //== 1))
                    {
                        XmlElement rownode = xmldoc.CreateElement("Details", NamespaceName);
                        root.AppendChild(rownode);
                        foreach (Cell cell in row)
                        {
                            //cell.DataType = DocumentFormat.OpenXml.Spreadsheet.CellValues.String;
                            string col = GetCellColumn(cell);
                            string nodename;
                            if (columnHeaders.ContainsKey(col))
                                nodename = (string)columnHeaders[col];
                            else
                                nodename = "Field" + col;

                            var formatString = string.Empty;

                            if (cell.DataType == null && cell.InnerText.Trim() != string.Empty && cell.StyleIndex != null)
                            {
                                var styleIndex = (int)cell.StyleIndex.Value;
                                var cellFormat = (CellFormat)cellFormats.ElementAt(styleIndex);

                                if (cellFormat.NumberFormatId != null && cellFormat.NumberFormatId > 0 && numberingFormats != null)
                                {                                   
                                    if (ExcelHelper.IsDateTimeCell(wbp, cell)) {
                                        double number = double.Parse(cell.InnerText);
                                        DateTime conv = DateTime.FromOADate(number);
                                        formatString = conv.ToString(this.DateFormat);
                                    }else
                                        formatString = GetCellValue(cell, items).Trim();
                                }
                                else
                                    formatString = GetCellValue(cell, items).Trim();
                            }
                            else {
                                formatString = GetCellValue(cell, items).Trim();
                            }

                           
                            XmlElement node = xmldoc.CreateElement(nodename, NamespaceName);
                            node.InnerText = formatString;
                            rownode.AppendChild(node); 
                        }
                    }

                    if (worksheet.Descendants<Row>().Count() - 1 == row.RowIndex.Value && this.GenerateTrailerFields)
                    {
                        XmlElement rownode = xmldoc.CreateElement("Trailer", NamespaceName);
                        root.AppendChild(rownode);
                        foreach (Cell cell in row)
                        {
                            string col = GetCellColumn(cell);
                            string nodename;
                            if (columnHeaders.ContainsKey(col))
                                nodename = (string)columnHeaders[col];
                            else
                                nodename = "Field" + col;
                            string cellvalue = GetCellValue(cell, items).Trim();
                            if (!string.IsNullOrEmpty(cellvalue))
                            {
                                XmlElement node = xmldoc.CreateElement(nodename, NamespaceName);
                                node.InnerText = cellvalue;
                                rownode.AppendChild(node);
                            }
                        }
                    }
                }
            }
            
            #endregion

            MemoryStream memStr = new MemoryStream();
            StreamWriter strOut = new StreamWriter(memStr);
            strOut.Write(xmldoc.OuterXml);
            strOut.Flush();
            memStr.Position = 0;
            memStr.Seek(0, SeekOrigin.Begin);

            IBaseMessage outMsg = pContext.GetMessageFactory().CreateMessage();
            outMsg.AddPart("Body", pContext.GetMessageFactory().CreateMessagePart(), true);
            outMsg.Context = pInMsg.Context;
            outMsg.GetPart("Body").Data = memStr;

            outMsg.BodyPart.Data.Seek(0, SeekOrigin.Begin);

            qOutputMsgs.Enqueue(outMsg);
        }
        public IBaseMessage GetNext(IPipelineContext pContext)
        {

            if (qOutputMsgs.Count > 0)
            {
                return (IBaseMessage)qOutputMsgs.Dequeue();
            }
            else
                return null;
        }


        private Stream CopyStream(Stream input)
        {
            Stream output = new MemoryStream();
            byte[] buffer = new byte[32768];
            int read = 1;
            while (read > 0)
            {
                read = input.Read(buffer, 0, buffer.Length);
                if (read > 0)
                    output.Write(buffer, 0, read);
            }
            return output;
        }

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
        private string GetCellColumn(Cell cell)
        {
            string cellref = cell.CellReference.Value;
            int pos = 0;
            int column;
            while (!int.TryParse(cellref.Substring(pos), out column))
                pos++;
            return cellref.Substring(0, pos);
        }
        private string GetCellValue(Cell cell, SharedStringItem[] items)
        {
            string txt = string.Empty;
            if (cell.CellValue != null)
                txt = cell.CellValue.Text;
            if (cell.DataType != null && cell.DataType.Value == CellValues.SharedString)
                txt = items[int.Parse(txt)].InnerText;
            return txt;
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
        #endregion
    }

    public class ExcelHelper
    {
        static uint[] builtInDateTimeNumberFormatIDs = new uint[] { 14, 15, 16, 17, 18, 19, 20, 21, 22, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 45, 46, 47, 50, 51, 52, 53, 54, 55, 56, 57, 58 };
        static Dictionary<uint, NumberingFormat> builtInDateTimeNumberFormats = builtInDateTimeNumberFormatIDs.ToDictionary(id => id, id => new NumberingFormat { NumberFormatId = id });
        static Regex dateTimeFormatRegex = new Regex(@"((?=([^[]*\[[^[\]]*\])*([^[]*[ymdhs]+[^\]]*))|.*\[(h|mm|ss)\].*)", RegexOptions.Compiled);

        public static Dictionary<uint, NumberingFormat> GetDateTimeCellFormats(WorkbookPart workbookPart)
        {
            var dateNumberFormats = workbookPart.WorkbookStylesPart.Stylesheet.NumberingFormats
                .Descendants<NumberingFormat>()
                .Where(nf => dateTimeFormatRegex.Match(nf.FormatCode.Value).Success)
                .ToDictionary(nf => nf.NumberFormatId.Value);

            var cellFormats = workbookPart.WorkbookStylesPart.Stylesheet.CellFormats
                .Descendants<CellFormat>();

            var dateCellFormats = new Dictionary<uint, NumberingFormat>();
            uint styleIndex = 0;
            foreach (var cellFormat in cellFormats)
            {
                if (cellFormat.ApplyNumberFormat != null && cellFormat.ApplyNumberFormat.Value)
                {
                    if (dateNumberFormats.ContainsKey(cellFormat.NumberFormatId.Value))
                    {
                        dateCellFormats.Add(styleIndex, dateNumberFormats[cellFormat.NumberFormatId.Value]);
                    }
                    else if (builtInDateTimeNumberFormats.ContainsKey(cellFormat.NumberFormatId.Value))
                    {
                        dateCellFormats.Add(styleIndex, builtInDateTimeNumberFormats[cellFormat.NumberFormatId.Value]);
                    }
                }

                styleIndex++;
            }

            return dateCellFormats;
        }

        // Usage Example
        public static bool IsDateTimeCell(WorkbookPart workbookPart, Cell cell)
        {
            if (cell.StyleIndex == null)
                return false;

            var dateTimeCellFormats = ExcelHelper.GetDateTimeCellFormats(workbookPart);

            return dateTimeCellFormats.ContainsKey(cell.StyleIndex);
        }
    }
}