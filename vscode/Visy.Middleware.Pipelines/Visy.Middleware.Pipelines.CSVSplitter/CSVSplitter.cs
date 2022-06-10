// Decompiled with JetBrains decompiler
// Type: Visy.Biztalk.Pipelines.CSVsplitter.GroupCSV2
// Assembly: Visy.Biztalk.Pipelines.CSVsplitter, Version=1.0.0.0, Culture=neutral, PublicKeyToken=e051355a629fa595
// MVID: 6FAED4B1-39B9-48BF-942B-1F50394F7BCE
// Assembly location: C:\Users\bangged\Downloads\Visy.Biztalk.Pipelines.CSVsplitter.dll

using Microsoft.BizTalk.Component.Interop;
using Microsoft.BizTalk.Message.Interop;
using System;
using System.Collections;
using System.ComponentModel;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Reflection;
using System.Resources;
using System.Runtime.InteropServices;
using System.Text;

namespace Visy.Middleware.Pipelines.CSVSplitter
{
    [System.Runtime.InteropServices.Guid("d85e3044-01fd-4bd1-b6c2-e78c7a286692")]
    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    [ComponentCategory(CategoryTypes.CATID_Any)]
    [ComponentCategory(CategoryTypes.CATID_Validate)]
    public class CSVSplitter : IBaseComponent, Microsoft.BizTalk.Component.Interop.IComponent, IPersistPropertyBag, IComponentUI
    {
        private static ResourceManager resManager = new ResourceManager("Visy.Middleware.Pipelines.CSVSplitter", Assembly.GetExecutingAssembly());
        private string groupColumnName = (string)null;
        private string headerPrefix = (string)null;
        private string detailPrefix = (string)null;
        private string ignoreTopXLines = (string)null;
        private bool hasNoHeaderLine = false;
        private CSVSplitter.GroupTypes groupTypeID = CSVSplitter.GroupTypes.Name;
        private string groupColumnPosition = (string)null;

        public string GroupColumnName
        {
            get
            {
                return this.groupColumnName;
            }
            set
            {
                this.groupColumnName = value;
            }
        }

        public string HeaderPrefix
        {
            get
            {
                return this.headerPrefix;
            }
            set
            {
                this.headerPrefix = value;
            }
        }

        public string DetailPrefix
        {
            get
            {
                return this.detailPrefix;
            }
            set
            {
                this.detailPrefix = value;
            }
        }

        public string IgnoreTopXLines
        {
            get
            {
                return this.ignoreTopXLines;
            }
            set
            {
                this.ignoreTopXLines = value;
            }
        }

        public bool HasNoHeaderLine
        {
            get
            {
                return this.hasNoHeaderLine;
            }
            set
            {
                this.hasNoHeaderLine = value;
            }
        }

        public GroupTypes GroupTypeID
        {
            get
            {
                return this.groupTypeID;
            }
            set
            {
                this.groupTypeID = value;
            }
        }

        public string GroupColumnPosition
        {
            get
            {
                return this.groupColumnPosition;
            }
            set
            {
                this.groupColumnPosition = value;
            }
        }

        [Browsable(true)]
        public string Name
        {
            get
            {
                return "CSVSplitter Component";
            }
        }

        [Browsable(true)]
        public string Version
        {
            get
            {
                return "1.0";
            }
        }

        [Browsable(true)]
        public string Description
        {
            get
            {
                return "CSVSplitter Pipeline Component";
            }
        }

        public System.IntPtr Icon
        {
            get { throw new System.NotImplementedException(); }
        }

        private byte[] ConvertToBytes(string str)
        {
            byte[] numArray = (byte[])null;
            if (str != null)
                numArray = Encoding.UTF8.GetBytes(str);
            return numArray;
        }

        public IBaseMessage Execute(IPipelineContext pc, IBaseMessage inmsg)
        {
            try
            {
                MemoryStream memoryStream = new MemoryStream();
                foreach (byte num in Encoding.ASCII.GetBytes(this.GroupCSVFile(new StreamReader(inmsg.BodyPart.GetOriginalDataStream()))))
                    memoryStream.WriteByte(num);
                memoryStream.Seek(0L, SeekOrigin.Begin);
                inmsg.BodyPart.Data = (Stream)memoryStream;
            }
            catch (Exception ex)
            {
                EventLog.WriteEntry(ex.Source, ex.Message + "\n" + ex.StackTrace, EventLogEntryType.Error);
            }
            finally
            {
            }
            return inmsg;
        }

        public string GroupCSVFile(StreamReader strReader)
        {
            string str1 = "";
            StringBuilder stringBuilder = new StringBuilder("<ROOT>");
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
                if (this.groupTypeID == GroupTypes.Name)
                {
                    if (this.groupColumnName.Length <= 0)
                        throw new Exception("Must specify Names of Columns to Group by if GroupType is 'Name'.");
                    string[] strArray1 = this.groupColumnName.Split(',');
                    string[] strArray2 = new string[strArray1.Length];
                    for (int index1 = 0; index1 < strArray2.Length; ++index1)
                    {
                        string[] strArray3 = str4.Split(',');
                        int num2 = 0;
                        for (int index2 = 0; index2 < strArray3.Length; ++index2)
                        {
                            if (strArray3[index2].CompareTo(strArray1[index1]) == 0)
                            {
                                num2 = index2;
                                break;
                            }
                        }
                    }
                }
                else
                {
                    if (this.groupColumnPosition.Length <= 0)
                        throw new Exception("Must specify Postion of Columns to Group by if GroupType is 'Position'.");
                    string[] strArray = this.groupColumnPosition.Split(',');
                    for (int index = 0; index < strArray.Length; ++index)
                    {
                        int num2 = int.Parse(strArray[index]) - 1;
                        strArray[index] = num2.ToString();
                    }
                }
                bool flag = true;
                while (str2 != null)
                {
                    str2 = strReader.ReadLine();
                    if (str2 != null)
                    {
                        string[] strArray = str2.Split(',');
                        int index;
                        if (strArray[0].IndexOf("H") > -1)
                        {
                            if (flag)
                                stringBuilder.Append("<Item>");
                            else
                                stringBuilder.Append("</Item><Item>");
                            stringBuilder.Append("<Head>");
                            for (index = 1; index < strArray.Length; ++index)
                                stringBuilder.Append("<H" + index.ToString() + ">" + strArray[index] + "</H" + index.ToString() + ">");
                            stringBuilder.Append("</Head>");
                            flag = false;
                        }
                        else
                        {
                            stringBuilder.Append("<Detail>");
                            for (index = 1; index < strArray.Length; ++index)
                                stringBuilder.Append("<D" + index.ToString() + ">" + strArray[index] + "</D" + index.ToString() + ">");
                            stringBuilder.Append("</Detail>");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            stringBuilder.Append("</Item></ROOT>");
            stringBuilder.Replace("\"", "");
            stringBuilder.Replace("&", "and");
            return stringBuilder.ToString();
        }

        public void GetClassID(out Guid classid)
        {
            classid = new Guid("d85e3044-01fd-4bd1-b6c2-e78c7a286693");
        }

        public void InitNew()
        {
        }

        public void Load(IPropertyBag pb, int errlog)
        {
            string str1 = (string)ReadPropertyBag(pb, "GroupColumnName");
            if (str1 != null)
                this.groupColumnName = str1;
            string str2 = (string)ReadPropertyBag(pb, "DetailPrefix");
            if (str2 != null)
                this.detailPrefix = str2;
            string str3 = (string)ReadPropertyBag(pb, "HeaderPrefix");
            if (str3 != null)
                this.headerPrefix = str3;
            string str4 = (string)ReadPropertyBag(pb, "IgnoreTopXLines");
            if (str4 != null)
                this.ignoreTopXLines = str4;
            switch ((string)ReadPropertyBag(pb, "HasNoHeaderLine"))
            {
                case "false":
                    this.hasNoHeaderLine = false;
                    break;
                case null:
                    this.hasNoHeaderLine = false;
                    break;
                default:
                    this.hasNoHeaderLine = true;
                    break;
            }
            switch ((string)ReadPropertyBag(pb, "GroupTypeID"))
            {
                case "1":
                    this.groupTypeID = GroupTypes.Name;
                    break;
                case null:
                    this.groupTypeID = GroupTypes.Name;
                    break;
                default:
                    this.groupTypeID = GroupTypes.Position;
                    break;
            }
            string str5 = (string)ReadPropertyBag(pb, "GroupColumnPosition");
            if (str5 == null)
                return;
            this.groupColumnPosition = str5;
        }

        public void Save(IPropertyBag pb, bool fClearDirty, bool fSaveAllProperties)
        {
            object groupColumnName = (object)this.groupColumnName;
            WritePropertyBag(pb, "GroupColumnName", groupColumnName);
            object detailPrefix = (object)this.detailPrefix;
            WritePropertyBag(pb, "DetailPrefix", detailPrefix);
            object headerPrefix = (object)this.headerPrefix;
            WritePropertyBag(pb, "HeaderPrefix", headerPrefix);
            object ignoreTopXlines = (object)this.ignoreTopXLines;
            WritePropertyBag(pb, "IgnoreTopXLines", ignoreTopXlines);
            object val1 = (object)this.hasNoHeaderLine.ToString();
            WritePropertyBag(pb, "HasNoHeaderLine", val1);
            object val2 = (object)this.groupTypeID.ToString();
            WritePropertyBag(pb, "GroupTypeID", val2);
            object groupColumnPosition = (object)this.groupColumnPosition;
            WritePropertyBag(pb, "GroupColumnPosition", groupColumnPosition);
        }

        private static object ReadPropertyBag(IPropertyBag pb, string propName)
        {
            object ptrVar = (object)null;
            try
            {
                pb.Read(propName, out ptrVar, 0);
            }
            catch (ArgumentException ex)
            {
                return ptrVar;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }
            return ptrVar;
        }

        private static void WritePropertyBag(IPropertyBag pb, string propName, object val)
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

        public IEnumerator Validate(object obj)
        {
            IEnumerator enumerator = (IEnumerator)null;
            ArrayList arrayList = new ArrayList();
            if (this.groupTypeID == GroupTypes.Name)
            {
                if (this.hasNoHeaderLine)
                    arrayList.Add((object)"If you have no Header Line you cannot specify a group by Column Names.");
                if (this.groupColumnName == null)
                    arrayList.Add((object)"You must specify a value for property GroupColumnName");
            }
            else if (this.groupColumnPosition == null)
                arrayList.Add((object)"You must specify a value for property GroupColumnPosition");
            if (this.headerPrefix == null)
                arrayList.Add((object)"You must specify a value for property HeaderPrefix");
            if (this.detailPrefix == null)
                arrayList.Add((object)"You must specify a value for property DetailPrefix");
            if (this.ignoreTopXLines == null)
                arrayList.Add((object)"You must specify a value for property IgnoreTopXLines");
            if (arrayList.Count > 0)
                enumerator = arrayList.GetEnumerator();
            return enumerator;
        }

        public enum GroupTypes
        {
            Name = 1,
            Position = 2,
        }
    }
}
