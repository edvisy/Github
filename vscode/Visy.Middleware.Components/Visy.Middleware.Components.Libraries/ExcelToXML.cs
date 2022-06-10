using System;
using System.Data; 
using System.Data.OleDb ; 
using System.IO;
using System.Xml;
using System.Xml.Schema;


using System.Collections;


namespace Visy.Middleware.Components.Libraries
{
	/// <summary>
	/// Summary description for ExcelToXML.
	/// </summary>
	public class ExcelToXML
	{
		#region Variable Declaration
		private OleDbConnection cn;
        private OleDbDataAdapter daAdapter;

        private string ExcelConWithoutHDR = @"Provider=Microsoft.ACE.OLEDB.12.0;Extended Properties="
            + Convert.ToChar(34).ToString() + "Excel 12.0;HDR=No;MAXSCANROWS=16;IMEX=1"
            + Convert.ToChar(34).ToString();
        private string ExcelConWithHDR = @"Provider=Microsoft.ACE.OLEDB.12.0;Extended Properties="
            + Convert.ToChar(34).ToString() + "Excel 12.0;HDR=Yes;MAXSCANROWS=16;IMEX=1"
            + Convert.ToChar(34).ToString();
        private string strConnectionString;

		private string strParseError="";
		private string SheetName,Range;
		#endregion

		#region Constructors
		/// <summary>
		/// Initialize ExcelXML component using the sepecifed File name, By default HDR property will be false.
		/// </summary>
		/// <param name="strFileName"></param>
		public ExcelToXML(string strFileName)
		{
            strConnectionString = "Data Source=" + strFileName + ";" + ExcelConWithoutHDR;
            cn = new OleDbConnection(); 
			cn.ConnectionString = strConnectionString; 
		}

		/// <summary>
		/// Initialize ExcelXML component using the specified File name, you can specify HDR value using _blnHeaders
		/// </summary>
		/// <param name="strFileName"></param>
		/// <param name="_blnHeaders"></param>
		public ExcelToXML(string strFileName,Boolean _blnHeaders)
		{
            if (_blnHeaders)
                strConnectionString = "Data Source=" + strFileName + ";" + ExcelConWithHDR;
                //old code strConnectionString=ExcelCon+"Data Source="+strFileName+";Extended Properties="+ Convert.ToChar(34).ToString()+"Excel 8.0;HDR=Yes"+Convert.ToChar(34).ToString();
            else
                strConnectionString = "Data Source=" + strFileName + ";" + ExcelConWithoutHDR;
                //old code strConnectionString = ExcelCon + "Data Source=" + strFileName + ";Extended Properties=" + Convert.ToChar(34).ToString() + "Excel 8.0;HDR=No" + Convert.ToChar(34).ToString();
            cn = new OleDbConnection(); 
			cn.ConnectionString = strConnectionString; 
		}

		#endregion

		#region Functionality

		#region XML Functionality
		public string GetXML(string strSheetName,Boolean _blnSchema)
		{
			DataSet ds=new DataSet();  			
			ds.Tables.Add(this.GetDataTable(strSheetName));  

			if(_blnSchema)
                return ds.GetXmlSchema()+ds.GetXml();  			
			else
				return ds.GetXml();  			
		}
		public string GetXMLSchema(string strSheetName)
		{
			DataSet ds=new DataSet();  
			ds.Tables.Add(this.GetDataTable(strSheetName));  
			return ds.GetXmlSchema();
		}

		public string[] GetAllXML()
		{
			string[] excelSheet=GetExcelSheetNames();
			
			DataSet dsExcelData=new DataSet(); 
			DataTable dt=new DataTable();  
			foreach(string strSheetName in excelSheet)
			{
				dsExcelData.Tables.Add(this.GetDataTable(strSheetName));  
			}
			string[] xml=new string[2];
			xml[0]=dsExcelData.GetXmlSchema();
			xml[1]=dsExcelData.GetXml();
			return xml;  
		}

		#endregion

		
        #region Excel File Info
        /// <summary>
        /// '------------------------------------------------------------------------------
        /// 'Table names encased in single quotes cause errors retreiving spreadsheet data
        /// '(ie tablename not found) so we have to strip them out...
        /// '------------------------------------------------------------------------------
        /// </summary>
        /// <param name="strTableName"></param>
        /// <returns>Formated Table Name as string</returns>
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
		public String[] GetExcelSheetNames()
		{
			
			System.Data.DataTable dt = null;

			try
			{
				cn.Open();
				
				// Get the data table containing the schema
				dt = cn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, new object[] { null, null, null, "TABLE" });

				if(dt == null)
				{
					return null;
				}

				// Add the sheet name to the string array.
                String[] excelSheets = new String[dt.Rows.Count];
                int i = 0;
				foreach(DataRow row in dt.Rows)
				{
                    string strSheetTableName = formatTableName(row["TABLE_NAME"].ToString());
					excelSheets[i] = strSheetTableName.Substring(0, strSheetTableName.Length-1); //!!! DANGER CODE
					i++;
				}
				
				return excelSheets;
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message) ;
			}
			finally
			{
				// Clean up.
				cn.Close();				
			}
		}

		public DataTable GetDataTable(string strSheetName)
		{
			try
			{
				string strComand;
				if(strSheetName.IndexOf("|") > 0)
				{
					SheetName = strSheetName.Substring(0,strSheetName.IndexOf("|"));
					Range = strSheetName.Substring(strSheetName.IndexOf("|")+1);
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
				return dt ;
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message);  
			}
		}
		
		#endregion

		#region Save Functionality
		public void SaveSheetXML(string strFileName,string strSheetName,Boolean _blnSchema)
		{
			try
			{
				string strFile = strFileName.Substring(strFileName.LastIndexOf("\\")+1); 
				string path = strFileName.Substring(0,strFileName.LastIndexOf("\\")); 
				strFile = strFile.Remove(strFile.IndexOf("."),4);     
				SaveFile(path,strFile,strSheetName); 
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message);  
			}
		}

		private void SaveFile(string path,string strFile,string strSheetName)
		{
			FileStream file=new FileStream(path+"\\"+strFile+".xml" ,FileMode.Create);
			StreamWriter wr=new StreamWriter(file);
			wr.Write("<?xml version='1.0'?>"+this.GetXML(strSheetName,false));   
			wr.Close();
			file.Close();  
			file=new FileStream(path+"\\"+strFile+".xsd" ,FileMode.Create);
			wr=new StreamWriter(file);
			wr.Write(this.GetXMLSchema(strSheetName).Replace("utf-16","utf-8"));   
			wr.Close();
			file.Close();  
		}
		public void SaveXslXml(string strFileName,Boolean _blnSchema, Boolean _blnMulti)
		{
			string[] excelSheet=GetExcelSheetNames();
			string strFile = strFileName.Substring(strFileName.LastIndexOf("\\")+1); 
			string path = strFileName.Substring(0,strFileName.LastIndexOf("\\")); 
			strFile = strFile.Remove(strFile.IndexOf("."),4);   

			if(_blnMulti)
			{
				foreach(string strSheetName in excelSheet)
				{
					this.SaveFile(path,strFile+"_"+strSheetName,strSheetName);  
				
				}
			}
			else
			{
				string[] xml=this.GetAllXML(); 
				FileStream file=new FileStream(path+"\\"+strFile+".xml" ,FileMode.Create);
				StreamWriter wr=new StreamWriter(file);
				wr.Write("<?xml version='1.0'?>"+xml[1]);   
				wr.Close();
				file.Close();  
				file=new FileStream(path+"\\"+strFile+".xsd" ,FileMode.Create);
				wr=new StreamWriter(file);
				wr.Write(xml[0].Replace("utf-16","utf-8"));   
				wr.Close();
				file.Close();  
			}

		}

		#endregion

		#region Validations 
		public string ValidateXML(string strSchemaFile)
		{
			strParseError="";

			XmlParserContext context = new XmlParserContext(null, new XmlNamespaceManager(new NameTable()), null, XmlSpace.None);
			XmlTextReader xmlReader = new XmlTextReader(this.GetAllXML()[1], XmlNodeType.Element, context);
			XmlValidatingReader objValidator = new XmlValidatingReader(xmlReader);

			//set the validation type to use an XSD schema
			objValidator.ValidationType = ValidationType.Schema;
			XmlSchemaCollection objSchemaCol = new XmlSchemaCollection();
			objSchemaCol.Add("", strSchemaFile);
			objValidator.Schemas.Add(objSchemaCol);
			objValidator.ValidationEventHandler  += new ValidationEventHandler(ShowCompileErrors);

			try
			{
				while (objValidator.Read()) { }
				//xmlInfo.InnerHtml += "<b>* XML was validated - " + intValidErrors + "</b> error(s) found";
			}
			catch(Exception objError)
			{
				throw new Exception(objError.Message);   
				//xmlInfo.InnerHtml += "<b>* Read/Parser error:</b> " + objError.Message + "<br />";
			}
			finally
			{
				xmlReader.Close();
			}
			return strParseError;
		}

		public string ValidateXML(string strSchemaFile,string WorkSheet)
		{

			strParseError="";

			XmlParserContext context = new XmlParserContext(null, new XmlNamespaceManager(new NameTable()), null, XmlSpace.None);
			XmlTextReader xmlReader = new XmlTextReader(this.GetXML(WorkSheet,false), XmlNodeType.Element, context);
			XmlValidatingReader objValidator = new XmlValidatingReader(xmlReader);

			//set the validation type to use an XSD schema
			objValidator.ValidationType = ValidationType.Schema;
			XmlSchemaCollection objSchemaCol = new XmlSchemaCollection();
			objSchemaCol.Add("", strSchemaFile);
			objValidator.Schemas.Add(objSchemaCol);
			objValidator.ValidationEventHandler  += new ValidationEventHandler(ShowCompileErrors);

			try
			{
				while (objValidator.Read()) { }
				//xmlInfo.InnerHtml += "<b>* XML was validated - " + intValidErrors + "</b> error(s) found";
			}
			catch(Exception objError)
			{
				throw new Exception(objError.Message);   
				//xmlInfo.InnerHtml += "<b>* Read/Parser error:</b> " + objError.Message + "<br />";
			}
			finally
			{
				xmlReader.Close();
			}
			return strParseError;
		}

		private void ShowCompileErrors(object sender, ValidationEventArgs args)
		{
			strParseError+="::"+args.Message+"\r\n" ;  			
		}

		#endregion

		#region Batch Function
		public static void BatchXMLConvert(string[] Files,Boolean _blnMulti)
		{
			try
			{
				foreach(string FileName in Files)
				{
					ExcelToXML obj=new ExcelToXML(FileName);   
					obj.SaveXslXml(FileName,true,_blnMulti);  
				}
			}
			catch(Exception ex)
			{
				throw new Exception(ex.Message);  
			}
		}

		#endregion

		#endregion

	}
}
