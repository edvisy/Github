//Excel Limitations
//1. Worksheet size: 65,536 rows by 256 columns 
//2. Cell contents (text): 32,767 characters 
//3. Sheets in a workbook: limited by available memory 
//4. Names in a workbook: limited by available memory 

//Microsoft.Jet.OLEDB.4.0 Limitations
//--SQL CODE
//--enable the use of 'Ad Hoc Distributed Queries' by using sp_configure
//--"Surface Area Configuration" in SQL Server Books Online
//--OPENROWSET and OPENDATASOURCE
//sp_configure 'Ad Hoc Distributed Queries', 1;  
//GO  
//RECONFIGURE;  
//GO 
//Select * FROM OPENROWSET
//(
//	'Microsoft.Jet.OLEDB.4.0', 
//	'Excel 8.0;HDR=NO;IMEX=1;Database=EXCELFILENAME.xls',
//	'SELECT * FROM [PurchaseOrder$c1:c1]'
//) 
//--SQL CODE ENds
//"IMEX=1" option tells ADO.NET to honour the following registry key when reading the spreadsheet:
//Hkey_Local_Machine/Software/Microsoft/Jet/4.0/Engines/Excel/ImportMixedTypes
//ImportMixedTypes = Text
//This registry key tells ADO.NET what to do when it encounters mixed types in the first 8 rows. 
//It can either be set to the string "Majority Type" (for the default behavior) 
//or to "Text" (which forces the column to be of type string). 
//
//There’s also a second relevant registry setting (which is honoured regardless of the IMEX option):
//Hkey_Local_Machine/Software/Microsoft/Jet/4.0/Engines/Excel/TypeGuessRowsThat 
//TypeGuessRows = 0
//says how many rows to scan to guess the datatype. The default is 8, but you can set it anywhere from 0-16 decimal 
//(0 meaning "scan the first 16384 rows", and all other values meaning what they say). 

namespace Visy.Middleware.Pipelines.ExcelToXML
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
    using System.Xml;
    using System.Data.SqlClient;
    using System.Data.OleDb;
    using System.Configuration;
    using System.Data;


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
    [System.Runtime.InteropServices.Guid("68f9a517-a2d4-4686-83f8-d630109328c2")]
    public class ExcelToXML :  
                                IBaseComponent,
                                Microsoft.BizTalk.Component.Interop.IComponent,
                                Microsoft.BizTalk.Component.Interop.IPersistPropertyBag,
                                IComponentUI
    {
        private string _tempWorkingFolder = null;
        private string _customerID = null;
        
        private const int bufferSize = 1024;
        private string[] sheetnames;
        Visy.Middleware.Components.Libraries.ExcelToXML obj;
        
      
        #region PROPERTIES
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
                        SqlDataReader dr = Visy.Middleware.Components.Utilities.SqlHelper.ExecuteReader(sqlCon, "p_customer", null, this.CustomerID);
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
                using (SqlConnection sqlCon = new SqlConnection(Visy.Middleware.Components.Utilities.AppSettingsReader.retrieveValue("BiztalkExcelAdapter")))
                {
                    try
                    {
                        sqlCon.Open();
                        SqlDataReader dr = Visy.Middleware.Components.Utilities.SqlHelper.ExecuteReader(sqlCon, "p_customer", null, this.CustomerID);
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
        [Browsable(true)]
        public string Name
        {
            get { return "ExcelToXML Component"; }
        }

        /// <summary>
        /// Version of the component.
        /// </summary>
        [Browsable(true)]
        public string Version
        {
            get { return "1.0"; }
        }

        /// <summary>
        /// Description of the component.
        /// </summary>
        [Browsable(true)]
        public string Description
        {
            get { return "ExcelToXML Pipeline Component"; }
        }

        #endregion

        #region IComponent
        /// <summary> Implements IComponent.Execute method.
        /// </summary>
        /// <param name="pc">Pipeline context</param>
        /// <param name="inmsg">Input message.</param>
        /// <returns>Processed input message with appended or prepended data.</returns>
        /// <remarks>
        /// IComponent.Execute method is used to initiate
        /// the processing of the message in pipeline component.
        /// 
        /// ASSUMPTIONS :
        /// - First line is always header
        /// 
        /// </remarks>
        public IBaseMessage Execute(IPipelineContext pc, IBaseMessage inmsg)
        {
            //IBaseMessage outMsg;
            try
            {
                
                Stream strmInFile;                
                MemoryStream strmMem = new MemoryStream();
                Stream originalStrm = null;
                FileStream fileArchive = null;
                BinaryWriter binWriter = null;
                string path = "";
                
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
                        path = Path.Combine(path, _tempWorkingFolder);
                        path = Path.Combine(path, (_customerID + @"\"));

                        string fileName = @"%MessageID%.xls";
                        fileName = fileName.Replace("%MessageID%", inmsg.MessageID.ToString());
                        path = Path.GetFullPath(path) + fileName;
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
                    throw (ex);
                }
                finally
                {
                    // Flush()/Close() the output stream
                    if (binWriter != null) { binWriter.Flush(); binWriter.Close(); }
                }
                #endregion               
                string strMsg = ExcelToXMLFile(path);

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

        public string ExcelToXMLFile(string path)
        {
            obj = new Visy.Middleware.Components.Libraries.ExcelToXML(path, false);
            sheetnames = obj.GetExcelSheetNames();
            
            //string sFilePath = @"c:\temp\" + sCustomerID + "-XLSPOSpecific.xml";
            MemoryStream strmMem = new MemoryStream();
            //need to revert to disk here if stream is too large
            StreamWriter sw = new StreamWriter(strmMem);
            XmlTextWriter xtw = new XmlTextWriter(sw);
            string newMsg = "";

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
                newMsg =  reader.ReadToEnd();
            }
            
            return newMsg;
        }
        #region old code
        /*public MemoryStream ExcelToXMLStream(string path)
        {
            obj = new Visy.Libraries.ExcelXML.ExcelToXML(path, false);
            sheetnames = obj.GetExcelSheetNames();

            
            
            MemoryStream strmMem = new MemoryStream();
            //need to revert to disk here if stream is too large
            StreamWriter sw = new StreamWriter(strmMem);
            XmlTextWriter xtw = new XmlTextWriter(sw);
            string newMsg = "";

            //TODO : Make sure before this function is called that excel file is open and sheets are read
            //NOTE LIMITATIONS : for 01 and 10 currently just handling ranges of 1 deep
            //Need to check database to see if ranges of more than one deep are needed

            xtw.WriteStartElement("VISY");
            xtw.WriteElementString("From", _customerID);
            xtw.WriteElementString("To", "VISY");
            xtw.WriteStartElement("PurchaseOrders");
            //occurs multiple times
            xtw.WriteStartElement("PurchaseOrder");
            xtw.WriteStartElement("Headers");
            //occurs multiple times
            #region PROCESS HEADERS
            xtw.WriteStartElement("Header");
            //process multiple headers from SQL here
            generateData("01", xtw);
            xtw.WriteEndElement();
            #endregion
            xtw.WriteEndElement();
            xtw.WriteStartElement("Texts");
            #region PROCESS TEXTS
            //occurs multiple times
            xtw.WriteStartElement("Text");
            //process multiple headers from SQL here
            generateData("10", xtw);
            xtw.WriteEndElement();
            #endregion
            xtw.WriteEndElement();
            xtw.WriteStartElement("Details");
            #region PROCESS DETAILS
            //occurs multiple times

            //occurs multiple times - according to spreadsheet
            generateGenericDetails("50", xtw);

            #endregion
            xtw.WriteEndElement();
            xtw.WriteEndElement();
            xtw.WriteEndElement();
            xtw.WriteEndElement();
            sw.Flush();
                        
            strmMem.Seek(0, System.IO.SeekOrigin.Begin);

            return strmMem;
        }*/
        #endregion

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
                    SqlDataReader dr = Visy.Middleware.Components.Utilities.SqlHelper.ExecuteReader(sqlCon, "p_cf_list", this.CustomerID, sRecordType);

                    while (dr.Read())
                    {
                        if (!dr.IsDBNull(0))
                        {
                            string sRecordRange = dr.GetString(0);

                            //read the range from Excel
                            if (dt.Columns.Count == 0)
                            {
                                dt = obj.GetDataTable(sheet_name + "|" + sRecordRange);
                            }
                            else dt.Merge(obj.GetDataTable(sheet_name + "|" + sRecordRange), true);
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

        #region generate PRIVATE METHODS
        private int getRepeaterKeyColumnINDEX(string sheet_name)
        {
            int rpt_row;//!!! OBSOLATED CODE !!! RepeatRow - is not used anymore
            int rpt_key = -1;
            //process multiple headers from SQL here
            using (SqlConnection sqlCon = new SqlConnection(Visy.Middleware.Components.Utilities.AppSettingsReader.retrieveValue("BiztalkExcelAdapter")))
            {
                try
                {
                    ///TODO: Need to see if I need to handle Headers spanning more than one column
                    sqlCon.Open();
                    SqlDataReader dr = Visy.Middleware.Components.Utilities.SqlHelper.ExecuteReader(sqlCon, "p_repeater", this.CustomerID);

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
                    if (row[rpt_key_id].ToString() == list[i].ToString() || row[rpt_key_id].ToString().Length==0)
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
        private void generateDetails (DataTable dt, XmlTextWriter xtw, ref bool empty_order)
        {
            this.generateDetails(dt, 0, "EMPTY", xtw, ref empty_order);
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
        #endregion

        #endregion

        #region IPersistPropertyBag

        /// <summary>
        /// Gets class ID of component for usage from unmanaged code.
        /// </summary>
        /// <param name="classid">Class ID of the component.</param>
        public void GetClassID(out Guid classid)
        {
            classid = new System.Guid("68f9a517-a2d4-4686-83f8-d630109328c2");
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
            string val = (string)ReadPropertyBag(pb, "TempWorkingFolder");
            if (val != null) 
                _tempWorkingFolder = val;

            val = (string)ReadPropertyBag(pb, "CustomerID");
            if (val != null)
                _customerID = val;

        }

        /// <summary>
        /// Saves the current component configuration into the property bag.
        /// </summary>
        /// <param name="pb">Configuration property bag.</param>
        /// <param name="fClearDirty">Not used.</param>
        /// <param name="fSaveAllProperties">Not used.</param>
        public void Save(Microsoft.BizTalk.Component.Interop.IPropertyBag pb, Boolean fClearDirty, Boolean fSaveAllProperties)
        {
            object val = (object)_tempWorkingFolder;
            WritePropertyBag(pb, "TempWorkingFolder", val);

            val = (object)_customerID;
            WritePropertyBag(pb, "CustomerID", val);
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
            ArrayList strList = new ArrayList();

            // Validate column name ( make sure no invalid characters )
            if (_tempWorkingFolder == null)
                strList.Add("Must have a value for property TempWorkingFolder");

            if (_customerID == null)
                strList.Add("Must have a value for property CustomerID");

            if (strList.Count > 0)
            {
                enumerator = strList.GetEnumerator();
            }

            return enumerator;
        }

        #endregion
    }
}
