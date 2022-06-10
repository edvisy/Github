using System;
using System.Data;
using System.Xml;
using System.IO;
using System.ComponentModel;
using System.Xml.Serialization;
using Microsoft.BizTalk.Message.Interop;
using Microsoft.BizTalk.Component.Interop;
using Microsoft.BizTalk.Streaming;
using System.Collections;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.OleDb;
using IComponent = Microsoft.BizTalk.Component.Interop.IComponent;

using utilities=Visy.Middleware.Components.Utilities;

namespace Visy.Middleware.Pipelines.XLSXToXML
{
    /// <summary>
    /// Defines an Excel 2007 FC Disassembler pipeline component.
    /// </summary>
    /// <remarks>
    /// This pipeline component calls the Excel 2007 FC Data Converter .NET component
    /// to convert an Excel file to one more more XML documents. 
    /// </remarks>A5193261-0115-428F-A70B-7287DD34AEE5
    [System.Runtime.InteropServices.Guid("A5193261-0115-428F-A70B-7287DD34AEE5")]
    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    [ComponentCategory(CategoryTypes.CATID_Decoder)]
    public class XLSXToXML : IBaseComponent, IComponentUI, IComponent, IPersistPropertyBag
    {
        #region Private Fields
        //private string TempDirPath = Visy.ECommerce.Utilities.AppSettingsReader.retrieveValue("EXCEL2XMLTempPath");

        private string TempDirPath = utilities.AppSettingsReader.retrieveValue("EXCEL2XMLTempPath");

        // Component internal
        private IPipelineContext _pipelineContext = null;
        private IBaseMessage _inMessage = null;
        //private IBaseMessageContext originalMsgContext;

        // Custom variables
        private int _messageIndex = 0;
        private ArrayList _outputFiles = null;

        private const int bufferSize = 1024;
        private string[] sheetnames;
        private string _tempWorkingFolder = string.Empty;
        private string _customerID = string.Empty;
        private string SheetName, Range;
        private OleDbDataAdapter daAdapter;
        private OleDbConnection cn;
        private string ExcelConWithoutHDR = string.Empty;
        private string ExcelConWithHDR = string.Empty;
        private string Filepath = string.Empty;

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
            get { return "Excel XLSXToXML component"; }
        }

        public string Name
        {
            get { return "Excel XLSXToXML"; }
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
            classID = new System.Guid("A5193261-0115-428F-A70B-7287DD34AEE5");
        }

        public void InitNew()
        { }

        public void Load(IPropertyBag propertyBag, int errorLog)
        {
            string val = (string)ReadPropertyBag(propertyBag, "TempWorkingFolder");
            if (val != null)
                _tempWorkingFolder = val;

            val = (string)ReadPropertyBag(propertyBag, "CustomerID");
            if (val != null)
                _customerID = val;

        }

        public void Save(IPropertyBag propertyBag, bool clearDirty, bool saveAllProperties)
        {
            object val = (object)_tempWorkingFolder;
            WritePropertyBag(propertyBag, "TempWorkingFolder", val);

            val = (object)_customerID;
            WritePropertyBag(propertyBag, "CustomerID", val);
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
                pb.Read(propName, out val, 0);
            }

            catch (ArgumentException)
            {
                return val;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
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
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }
        }


        #endregion

        #region Public Properties
        public string TempWorkingFolder
        {
            get { return _tempWorkingFolder; }
            set { _tempWorkingFolder = value; }
        }


        public string CustomerID
        {
            get { return _customerID; }
            set { _customerID = value; }

        }

        public string Worksheet
        {
            get
            {
                string _worksheet = "0";
                using (SqlConnection sqlCon = new SqlConnection(Visy.Middleware.Components.Utilities.AppSettingsReader.retrieveValue("BiztalkExcelAdapter")))
                {
                    try
                    {
                        sqlCon.Open();
                        SqlDataReader dr = utilities.SqlHelper.ExecuteReader(sqlCon, "p_customer", null, CustomerID);
                        while (dr.Read())
                        {
                            for (int i = 0; i < dr.FieldCount; i++)
                            {
                                if (dr.GetName(i) == "Worksheet")
                                    _worksheet = dr.GetString(i);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }

                return _worksheet;
            }
        }

        public string Parser
        {
            get
            {
                string _parser = "default";
                using (SqlConnection sqlCon = new SqlConnection(utilities.AppSettingsReader.retrieveValue("BiztalkExcelAdapter")))
                {
                    try
                    {
                        sqlCon.Open();
                        SqlDataReader dr = utilities.SqlHelper.ExecuteReader(sqlCon, "p_customer", null, this.CustomerID);
                        while (dr.Read())
                        {
                            for (int i = 0; i < dr.FieldCount; i++)
                            {
                                if (dr.GetName(i) == "Parser")
                                    _parser = dr.GetString(i);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }
                return _parser;
            }
        }


        #endregion


        #region IComponent Members

        public IBaseMessage Execute(IPipelineContext pc, IBaseMessage inmsg)
        {
            //IBaseMessage outMsg;
            try
            {

                //Stream strmInFile;
                MemoryStream strmMem = new MemoryStream();
                Stream originalStrm = null;
                FileStream fileArchive = null;
                BinaryWriter binWriter = null;

                //ALGORITHM
                //1. get data from stream in binary
                //2. create temporary xls file on file system
                //3. pass path to file to convert to XML
                //4. delete temp file on file system
                //5. pass XML to message

                #region CREATE TEMP FILE
                try
                {
                    IBaseMessagePart bodyPart = inmsg.BodyPart;
                    if (bodyPart != null)
                    {
                        #region SET PATH & FILENAME
                        Filepath = Path.Combine(Filepath, _tempWorkingFolder);
                        Filepath = Path.Combine(Filepath, (_customerID + @"\"));

                        string fileName = @"%MessageID%.xlsx";
                        fileName = fileName.Replace("%MessageID%", inmsg.MessageID.ToString());
                        Filepath = Path.GetFullPath(Filepath) + fileName;
                        #endregion

                        // Get a *copy* of the original input stream
                        originalStrm = bodyPart.Data;

                        // Dump the data to the file, for archiving
                        fileArchive = new FileStream(Filepath, FileMode.Create, FileAccess.Write);
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
                    throw (ex);
                }
                finally
                {
                    // Flush()/Close() the output stream
                    if (binWriter != null) { binWriter.Flush(); binWriter.Close(); }
                }
                #endregion
                string strMsg = ExcelToXMLFile(Filepath);

                #region REMOVE TEMP FILE
                //if fails don't worry just
                #endregion

                System.Text.Encoding aCode = System.Text.Encoding.ASCII;
                byte[] acodeBytes = aCode.GetBytes(strMsg);
                for (int i = 0; i < acodeBytes.Length; i++)
                {
                    strmMem.WriteByte(acodeBytes[i]);
                }
                strmMem.Seek(0, System.IO.SeekOrigin.Begin);
                inmsg.BodyPart.Data = strmMem;

                //inmsg.BodyPart.Data = strmMem; //change the message data

                //outMsg = pc.GetMessageFactory().CreateMessage();
                //outMsg.AddPart("Body", pc.GetMessageFactory().CreateMessagePart(), true);
                //outMsg.BodyPart.Data = strmMem;

                //strmMem.Seek(0, System.IO.SeekOrigin.Begin);             
            }
            catch (Exception exc)
            {
                throw (exc);
            }
            finally
            {

            }
            return inmsg;

        }

        #endregion

        #region Public Method

        public string ExcelToXMLFile(string path)
        {
            sheetnames = GetExcelSheetNames();

            //string sFilePath = @"c:\temp\" + sCustomerID + "-XLSPOSpecific.xml";
            MemoryStream strmMem = new MemoryStream();
            //need to revert to disk here if stream is too large
            StreamWriter sw = new StreamWriter(strmMem);
            XmlTextWriter xtw = new XmlTextWriter(sw);
            string newMsg = string.Empty;

            //TODO : Make sure before this function is called that excel file is open and sheets are read
            //NOTE LIMITATIONS : for 01 and 10 currently just handling ranges of 1 deep
            //Need to check database to see if ranges of more than one deep are needed

            xtw.WriteStartElement("VISY");                      //<VISY>    
            xtw.WriteElementString("From", this.CustomerID);    // <From>A1292-NSW</From>
            xtw.WriteElementString("To", "VISY");               // <To>VISY</To>
            xtw.WriteStartElement("PurchaseOrders");            // <PurchaseOrders>...

            #region <Purchase Order>
            bool empty_order = true;
            switch (this.Worksheet)
            {
                case "N":
                    DataTable headersN = getData(sheetnames[sheetnames.Length - 1], "01");
                    DataTable textsN = getData(sheetnames[sheetnames.Length - 1], "10");
                    DataTable detailsN = getData(sheetnames[sheetnames.Length - 1], "50");

                    switch (this.Parser.ToLower())
                    {
                        case "generic":
                            generateData(headersN, "Header", xtw, ref empty_order);//<HEADERS>
                            generateData(textsN, "Text", xtw, ref empty_order);//<TEXTS>
                            generateDetails(detailsN, xtw, ref empty_order);//<DETAILS>
                            break;
                        case "repeater":
                            //strXML = strXML & vbCrLf & RepeaterPO(objTable.Name)
                            break;
                        case "crosstab":
                            //strXML = strXML & vbCrLf & CrosstabPO(objTable.Name)
                            break;
                    }
                    break;
                case "*":
                    foreach (string sheet in sheetnames)
                    {
                        DataTable headersSTAR = getData(sheet, "01");
                        DataTable textsSTAR = getData(sheet, "10");
                        DataTable detailsSTAR = getData(sheet, "50");

                        //'Worksheet print areas are ignored and not processed
                        //If InStr(objTable.Name, "Print_Area") = 0 Then
                        switch (this.Parser.ToLower())
                        {
                            case "generic":
                                generateData(headersSTAR, "Header", xtw, ref empty_order);//<HEADERS>
                                generateData(textsSTAR, "Text", xtw, ref empty_order);//<TEXTS>
                                generateDetails(detailsSTAR, xtw, ref empty_order);//<DETAILS>
                                break;
                            case "repeater":
                                //strXML = strXML & vbCrLf & RepeaterPO(strTableName)
                                break;
                            case "crosstab":
                                //strXML = strXML & vbCrLf & CrosstabPO(strTableName)
                                break;
                        }
                        //End If
                        if (!empty_order)
                        {
                            xtw.WriteEndElement();
                            empty_order = true;
                        }
                    }
                    break;
                default: //case '1':
                    int sheet_id = 0;
                    //if Worksheet=1 or Worksheet!=sheetnames[i], sheet_id=0
                    if (!Worksheet.Equals("1"))
                    {
                        for (int i = 0; i < sheetnames.Length; i++)
                        {
                            if (Worksheet.Equals(sheetnames[i]))
                            {
                                sheet_id = i;
                                break;
                            }
                        }
                    }

                    DataTable headers1 = getData(sheetnames[sheet_id], "01");
                    DataTable texts1 = getData(sheetnames[sheet_id], "10");
                    DataTable details1 = getData(sheetnames[sheet_id], "50");
                    switch (this.Parser.ToLower())
                    {
                        case "generic":
                            generateData(headers1, "Header", xtw, ref empty_order); //<HEADERS>
                            generateData(texts1, "Text", xtw, ref empty_order);     //<TEXTS>
                            generateDetails(details1, xtw, ref empty_order);        //<DETAILS>
                            break;
                        case "repeater":
                            int rpt_key_id = getRepeaterKeyColumnINDEX(sheetnames[sheet_id]);
                            if (rpt_key_id > -1)
                            {
                                ArrayList key_column = getRepeaterKeyColumn(details1, rpt_key_id);

                                for (int rpt_id = 0; rpt_id < key_column.Count; rpt_id++)
                                {
                                    generateData(headers1, "Header", xtw, ref empty_order); //<HEADERS>
                                    generateData(texts1, "Text", xtw, ref empty_order);     //<TEXTS>
                                    generateDetails(details1, rpt_key_id, key_column[rpt_id].ToString(), xtw, ref empty_order);//<DETAILS>
                                    if (!empty_order)
                                    {
                                        xtw.WriteEndElement();
                                        empty_order = true;
                                    }
                                }
                            }
                            else
                            {
                                throw (new Exception("Invalid customer repeater index: CustomerId="
                                    + this.CustomerID + " RepeatCol=" + rpt_key_id.ToString())
                                    );
                            }
                            break;
                        case "crosstab":
                            //strXML = strXML & vbCrLf & CrosstabPO(objTable.Name)
                            break;
                    }
                    break;
            }
            if (!empty_order)
            {
                xtw.WriteEndElement();
                empty_order = true;
            }
            #endregion

            xtw.WriteEndElement();                              // </PurchaseOrders>
            xtw.WriteEndElement();                              //</VISY>
            sw.Flush();

            //objBrowser.Navigate(sFilePath);
            //MessageBox.Show("Completed");
            strmMem.Seek(0, System.IO.SeekOrigin.Begin);
            using (StreamReader reader = new StreamReader(strmMem))
            {
                // Just read to the end. 
                newMsg = reader.ReadToEnd();
            }

            return newMsg;
        }

        public String[] GetExcelSheetNames()
        {

            System.Data.DataTable dt = null;

            try
            {
                //cn.Open();
                OpenExcelConnection(Filepath, false);
                // Get the data table containing the schema
                dt = cn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, new object[] { null, null, null, "TABLE" });

                if (dt == null)
                {
                    return null;
                }

                // Add the sheet name to the string array.
                String[] excelSheets = new String[dt.Rows.Count];
                int i = 0;
                foreach (DataRow row in dt.Rows)
                {
                    string strSheetTableName = formatTableName(row["TABLE_NAME"].ToString());
                    excelSheets[i] = strSheetTableName.Substring(0, strSheetTableName.Length - 1); //!!! DANGER CODE
                    i++;
                }

                return excelSheets;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                // Clean up.
                cn.Close();
            }
        }

        #endregion

        #region Private Method

        private void OpenExcelConnection(string fileName, Boolean _blnHeaders)
        {

            if (_blnHeaders)
            {
                ExcelConWithoutHDR = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source="
                                           + fileName + ";Extended Properties=\"Excel 12.0 Xml;HDR=YES;IMEX=1;TypeGuessRows=0;ImportMixedTypes=Text\"";
                cn = new OleDbConnection(ExcelConWithoutHDR);
            }
            else
            {
                ExcelConWithHDR = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source="
                                            + fileName + ";Extended Properties=\"Excel 12.0 Xml;HDR=NO;IMEX=1;TypeGuessRows=0;ImportMixedTypes=Text\"";
                cn = new OleDbConnection(ExcelConWithHDR);
            }
            cn.Open();

        }

        private string formatTableName(string strTableName)
        {
            string r = strTableName;

            if (r.StartsWith("'"))
            {
                r = r.Substring(1, r.Length - 1);
            }

            if (r.EndsWith("'"))
            {
                r = r.Substring(0, r.Length - 1);
            }

            return r;
        }

        private DataTable getData(string sheet_name, string sRecordType)
        {
            DataTable dt = new DataTable();
            //process multiple headers from SQL here
            using (SqlConnection sqlCon = new SqlConnection(Visy.Middleware.Components.Utilities.AppSettingsReader.retrieveValue("BiztalkExcelAdapter")))
            {
                try
                {
                    ///TODO: Need to see if I need to handle Headers spanning more than one column
                    sqlCon.Open();
                    SqlDataReader dr = utilities.SqlHelper.ExecuteReader(sqlCon, "p_cf_list", this.CustomerID, sRecordType);

                    while (dr.Read())
                    {
                        if (!dr.IsDBNull(0))
                        {
                            string sRecordRange = dr.GetString(0);

                            //read the range from Excel
                            if (dt.Columns.Count == 0)
                            {
                                dt = GetDataTable(sheet_name + "|" + sRecordRange);
                            }
                            else dt.Merge(GetDataTable(sheet_name + "|" + sRecordRange), true);
                        }
                    }

                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            return dt;
        }

        private void generateData(DataTable dt, string xml_element_name, XmlTextWriter xtw, ref bool empty_order)
        {
            int range_no = 1;
            bool empty = true;

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (!isEmpty(dt.Rows[i]))
                {
                    if (empty_order)
                    {
                        xtw.WriteStartElement("PurchaseOrder");
                        empty_order = false;
                    }
                    if (empty)
                    {
                        xtw.WriteStartElement(xml_element_name + "s");
                        xtw.WriteStartElement(xml_element_name);
                        empty = false;
                    }
                    xtw.WriteAttributeString("F" + range_no.ToString(), dt.Rows[i][0].ToString());
                }
                range_no++;
            }
            if (!empty)
            {
                xtw.WriteEndElement();
                xtw.WriteEndElement();
            }
        }
        private bool isEmpty(DataRow row)
        {
            bool empty = true;
            for (int i = 0; i < row.ItemArray.Length; i++)
                if (row[i].ToString().Length > 0)
                {
                    empty = false;
                    break;
                }
            return empty;
        }
        private void generateDetails
        (
            DataTable dt,
            int repeater_key_id,
            string repeating_cell,
            XmlTextWriter xtw,
            ref bool empty_order
        )
        {
            bool empty = true;
            bool notRepeater = !Parser.ToLower().Equals("repeater");

            for (int x = 0; x < dt.Rows.Count; x++)
            {
                if (!isEmpty(dt.Rows[x])
                    && (dt.Rows[x][repeater_key_id].ToString() == repeating_cell || notRepeater))
                {
                    if (empty_order)
                    {
                        xtw.WriteStartElement("PurchaseOrder");
                        empty_order = false;
                    }
                    if (empty)
                    {
                        xtw.WriteStartElement("Details");
                        empty = false;
                    }

                    #region <Detail>
                    xtw.WriteStartElement("Detail");
                    for (int y = 0; y < dt.Columns.Count; y++)
                    {
                        int field_no;
                        field_no = y + 1;
                        if (dt.Rows[x][y].ToString().Length > 0)
                        {
                            xtw.WriteAttributeString(
                                "F" + field_no.ToString(),
                                dt.Rows[x][y].ToString());
                        }
                    }
                    xtw.WriteEndElement();
                    #endregion
                }
            }
            if (!empty)
            {
                xtw.WriteEndElement();
            }
        }
        private void generateDetails(DataTable dt, XmlTextWriter xtw, ref bool empty_order)
        {
            this.generateDetails(dt, 0, "EMPTY", xtw, ref empty_order);
        }

        private int getRepeaterKeyColumnINDEX(string sheet_name)
        {
            int rpt_row;//!!! OBSOLATED CODE !!! RepeatRow - is not used anymore
            int rpt_key = -1;
            //process multiple headers from SQL here
            using (SqlConnection sqlCon = new SqlConnection(utilities.AppSettingsReader.retrieveValue("BiztalkExcelAdapter")))
            {
                try
                {
                    ///TODO: Need to see if I need to handle Headers spanning more than one column
                    sqlCon.Open();
                    SqlDataReader dr = utilities.SqlHelper.ExecuteReader(sqlCon, "p_repeater", this.CustomerID);

                    int cnt = 0;
                    while (dr.Read())
                    {
                        if (!dr.IsDBNull(0))
                        {
                            cnt++;
                            if (cnt == 1)
                            {
                                rpt_row = Convert.ToInt32(dr["RepeatRow"]);//!!! OBSOLATED CODE !!! RepeatRow - not used
                                rpt_key = Convert.ToInt32(dr["RepeatCol"]);
                            }
                            else
                            {
                                rpt_key = -1;
                                throw (new Exception(
                                    "BiztalkExcelAdapter.dbo.Repeater is not unique by CustomerID="
                                    + this.CustomerID.ToString()));
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }
            return rpt_key - 1;
        }
        private ArrayList getRepeaterKeyColumn(DataTable var_data, int rpt_key_id)
        {
            ArrayList list = new ArrayList();
            foreach (DataRow row in var_data.Rows)
            {
                bool exists = false;
                for (int i = 0; i < list.Count; i++)
                {
                    // Skip the cell if already exists in the list OR if it is empty
                    if (row[rpt_key_id].ToString() == list[i].ToString() || row[rpt_key_id].ToString().Length == 0)
                    {
                        exists = true;
                        break;
                    }
                }
                if (!exists)
                {
                    list.Add(row[rpt_key_id].ToString());
                }
            }
            return list;
        }

        private DataTable GetDataTable(string strSheetName)
        {
            try
            {
                string strComand;
                if (strSheetName.IndexOf("|") > 0)
                {
                    SheetName = strSheetName.Substring(0, strSheetName.IndexOf("|"));
                    Range = strSheetName.Substring(strSheetName.IndexOf("|") + 1);
                    strComand = "SELECT * FROM [" + SheetName + "$" + Range + "]";
                }
                else
                {
                    strComand = "SELECT * FROM [" + strSheetName + "$]";
                }

                daAdapter = new OleDbDataAdapter(strComand, cn);

                DataTable dtTypes = new DataTable(strSheetName);

                daAdapter.FillSchema(dtTypes, SchemaType.Source);
                daAdapter.Fill(dtTypes);

                DataTable dt = new DataTable(strSheetName);

                foreach (DataColumn clmn in dtTypes.Columns)
                {
                    DataColumn column = new DataColumn();
                    column.DataType = System.Type.GetType("System.String");
                    column.ColumnName = clmn.ColumnName;
                    dt.Columns.Add(column);
                }

                daAdapter.FillSchema(dt, SchemaType.Source);
                daAdapter.Fill(dt);

                cn.Close();

                return dt;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        #endregion

    }
}
