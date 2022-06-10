
namespace Visy.Middleware.Pipelines.GroupByCSV
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
    [System.Runtime.InteropServices.Guid("d85e3044-01fd-4bd1-b6c2-e78c7a286693")]
    public class GroupCSV :
        IBaseComponent,
        Microsoft.BizTalk.Component.Interop.IComponent,
        Microsoft.BizTalk.Component.Interop.IPersistPropertyBag,
        IComponentUI
    {
        public enum GroupTypes
        {
            Name = 1,
            Position = 2
        }
        private string groupColumnName = null;
        private string headerPrefix = null;
        private string detailPrefix = null;
        private string ignoreTopXLines = null;

        private bool hasNoHeaderLine = false;
        private GroupTypes groupTypeID = GroupTypes.Name;
        private string groupColumnPosition = null;

        //TODO
        /*
         
         Need to be able to 
            accept file without header line
                this will impact field to group by, grouping will have to be by location
            accept multiple group by
            specify which fields to include in header
             
                  
         */


        static ResourceManager resManager = new ResourceManager("Visy.Middleware.Pipelines.GroupByCSV", Assembly.GetExecutingAssembly());

        

        #region PROPERTIES
        public string GroupColumnName
        {
            get { return groupColumnName; }
            set { groupColumnName = value; }
        }
        public string HeaderPrefix
        {
            get { return headerPrefix; }
            set { headerPrefix = value; }
        }
        public string DetailPrefix
        {
            get { return detailPrefix; }
            set { detailPrefix = value; }
        }
        public string IgnoreTopXLines
        {
            get { return ignoreTopXLines; }
            set { ignoreTopXLines = value; }
        }
        public bool HasNoHeaderLine
        {
            get { return hasNoHeaderLine; }
            set { hasNoHeaderLine = value; }
        }
        public GroupTypes GroupTypeID
        {
            get { return groupTypeID; }
            set { groupTypeID = value; }
        }
        public string GroupColumnPosition
        {
            get { return groupColumnPosition; }
            set { groupColumnPosition = value; }
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
            get { return "GroupByCSV Component"; }
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
            get { return "GroupByCSV Pipeline Component"; }
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
        /// 
        /// ASSUMPTIONS :
        /// - First line is always header
        /// 
        /// </remarks>
        public IBaseMessage Execute(IPipelineContext pc, IBaseMessage inmsg)
        {
            try
            {

                Stream strmInFile;
                IBaseMessagePart msgPart;
                MemoryStream strmMem = new MemoryStream();

                msgPart = inmsg.BodyPart;
                strmInFile = msgPart.GetOriginalDataStream();
                StreamReader strReader = new StreamReader(strmInFile);
                //Change Data Recived - Group by Column
                string strMsg = GroupCSVFile(strReader);


                System.Text.Encoding aCode = System.Text.Encoding.ASCII;
                byte[] acodeBytes = aCode.GetBytes(strMsg);
                for (int i = 0; i < acodeBytes.Length; i++)
                {
                    strmMem.WriteByte(acodeBytes[i]);
                }
                strmMem.Seek(0, System.IO.SeekOrigin.Begin);
                inmsg.BodyPart.Data = strmMem; //change the message data

            }
            catch (Exception ex)
            {
                System.Diagnostics.EventLog.WriteEntry(ex.Source, ex.Message + "\n" + ex.StackTrace, EventLogEntryType.Error);
            }
            finally
            {

            }
            return inmsg;
        }
        /// <summary>
        /// Essentially the code below does the following :
        ///      1. Reads all contents of the file into a two dimentional array (table)
        ///         the array has one column for group and another for value.
        ///      2. Sorts array by group column using the Array.Sort function
        ///      3. Loop through array and save contents to file.  The group is used as a header and the
        ///         value as the detail line.
        /// </summary>
        /// <param name="strReader"></param>
        /// <returns></returns>
        public string GroupCSVFile(StreamReader strReader)
        {
            string str1 = "";
            SortedList sortedList = new SortedList();
            int num1;
            try
            {
                num1 = int.Parse(this.ignoreTopXLines);
            }
            catch (Exception ex)
            {
                num1 = 0;
                EventLog.WriteEntry(ex.Source, ex.Message + "\n" + ex.StackTrace, EventLogEntryType.Error);
            }
            try
            {
                string str2 = "";
                for (; num1 > 0; --num1)
                {
                    string str3 = strReader.ReadLine();
                    str1 = str1 + str3 + Environment.NewLine;
                }
                string str4 = !this.hasNoHeaderLine ? this.headerPrefix + strReader.ReadLine() : this.headerPrefix;
                string[] strArray1;
                if (this.groupTypeID == GroupCSV.GroupTypes.Name)
                {
                    if (this.groupColumnName.Length <= 0)
                        throw new Exception("Must specify Names of Columns to Group by if GroupType is 'Name'.");
                    string[] strArray2 = this.groupColumnName.Split(',');
                    strArray1 = new string[strArray2.Length];
                    for (int index1 = 0; index1 < strArray1.Length; ++index1)
                    {
                        string[] strArray3 = str4.Split(',');
                        for (int index2 = 0; index2 < strArray3.Length; ++index2)
                        {
                            if (strArray3[index2].CompareTo(strArray2[index1]) == 0)
                            {
                                strArray1[index1] = index2.ToString();
                                break;
                            }
                        }
                    }
                }
                else
                {
                    if (this.groupColumnPosition.Length <= 0)
                        throw new Exception("Must specify Postion of Columns to Group by if GroupType is 'Position'.");
                    strArray1 = this.groupColumnPosition.Split(',');
                    for (int index = 0; index < strArray1.Length; ++index)
                    {
                        int num2 = int.Parse(strArray1[index]) - 1;
                        strArray1[index] = num2.ToString();
                    }
                }
                int num3 = 0;
                while (str2 != null)
                {
                    str2 = strReader.ReadLine();
                    if (str2 != null)
                    {
                        string[] strArray2 = str2.Split(',');
                        string str3 = "";
                        for (int index = 0; index < strArray1.Length; ++index)
                        {
                            string str5 = strArray2[int.Parse(strArray1[index])];
                            if (str5.Length == 0)
                                str5 = "NOVALUE";
                            str3 = str3 + str5 + ",";
                        }
                        string str6 = str3.Substring(0, str3.Length - 1);
                        sortedList.Add((object)(str6 + "," + num3.ToString()), (object)str2);
                        ++num3;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            string str7 = "";
            for (int index1 = 0; index1 < sortedList.Count; ++index1)
            {
                string[] strArray = ((string)sortedList.GetKey(index1)).Split(',');
                string str2 = "";
                for (int index2 = 0; index2 < strArray.Length; ++index2)
                {
                    if (index2 != strArray.Length - 1)
                        str2 = index2 != 0 ? str2 + "," + strArray[index2] : str2 + strArray[index2];
                }
                if (str7 != str2)
                {
                    str1 = str1 + this.headerPrefix + str2 + Environment.NewLine;
                    str7 = str2;
                }
                str1 = str1 + this.detailPrefix + (string)sortedList.GetByIndex(index1) + Environment.NewLine;
            }
            return str1;
        }
        #endregion





        #region IPersistPropertyBag

        /// <summary>
        /// Gets class ID of component for usage from unmanaged code.
        /// </summary>
        /// <param name="classid">Class ID of the component.</param>
        public void GetClassID(out Guid classid)
        {
            classid = new System.Guid("d85e3044-01fd-4bd1-b6c2-e78c7a286693");
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
            string val = (string)ReadPropertyBag(pb, "GroupColumnName");

            if (val != null)
                groupColumnName = val;

            val = (string)ReadPropertyBag(pb, "DetailPrefix");
            if (val != null)
                detailPrefix = val;

            val = (string)ReadPropertyBag(pb, "HeaderPrefix");
            if (val != null)
                headerPrefix = val;

            val = (string)ReadPropertyBag(pb, "IgnoreTopXLines");
            if (val != null)
                ignoreTopXLines = val;


            val = (string)ReadPropertyBag(pb, "HasNoHeaderLine");
            if (val != null)
            {
                if (val == "false")
                    hasNoHeaderLine = false;
                else
                    hasNoHeaderLine = true;
            }
            else
            {
                hasNoHeaderLine = false;
            }


            val = (string)ReadPropertyBag(pb, "GroupTypeID");
            if (val != null)
            {
                if (val == "1")
                    groupTypeID = GroupTypes.Name;
                else
                    groupTypeID = GroupTypes.Position;

            }
            else
            {
                groupTypeID = GroupTypes.Name;
            }


            val = (string)ReadPropertyBag(pb, "GroupColumnPosition");
            if (val != null)
                groupColumnPosition = val;
        }

        /// <summary>
        /// Saves the current component configuration into the property bag.
        /// </summary>
        /// <param name="pb">Configuration property bag.</param>
        /// <param name="fClearDirty">Not used.</param>
        /// <param name="fSaveAllProperties">Not used.</param>
        public void Save(Microsoft.BizTalk.Component.Interop.IPropertyBag pb, Boolean fClearDirty, Boolean fSaveAllProperties)
        {
            object val = (object)groupColumnName;
            WritePropertyBag(pb, "GroupColumnName", val);

            val = (object)detailPrefix;
            WritePropertyBag(pb, "DetailPrefix", val);

            val = (object)headerPrefix;
            WritePropertyBag(pb, "HeaderPrefix", val);

            val = (object)ignoreTopXLines;
            WritePropertyBag(pb, "IgnoreTopXLines", val);

            val = (object)hasNoHeaderLine.ToString();
            WritePropertyBag(pb, "HasNoHeaderLine", val);

            val = (object)groupTypeID.ToString();
            WritePropertyBag(pb, "GroupTypeID", val);

            val = (object)groupColumnPosition;
            WritePropertyBag(pb, "GroupColumnPosition", val);
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




            if (groupTypeID == GroupTypes.Name)
            {
                if (hasNoHeaderLine)
                {
                    strList.Add("If you have no Header Line you cannot specify a group by Column Names.");
                }
                if (groupColumnName == null)
                    strList.Add("You must specify a value for property GroupColumnName");

            }
            else
            {
                if (groupColumnPosition == null)
                    strList.Add("You must specify a value for property GroupColumnPosition");

            }


            if (headerPrefix == null)
                strList.Add("You must specify a value for property HeaderPrefix");

            if (detailPrefix == null)
                strList.Add("You must specify a value for property DetailPrefix");

            if (ignoreTopXLines == null)
                strList.Add("You must specify a value for property IgnoreTopXLines");




            if (strList.Count > 0)
            {
                enumerator = strList.GetEnumerator();
            }

            return enumerator;
        }

        #endregion
    }
}
