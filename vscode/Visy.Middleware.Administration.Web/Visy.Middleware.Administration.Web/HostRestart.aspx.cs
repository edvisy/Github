using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Management;
using System.Collections;
using System.Data;

namespace Visy.Middleware.Administration.Web
{
    public partial class HostRestart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            getStatus();

        }

       

      //Function to Enumerate all HostInstances of "InProcess" type and start them
    private void EnumerateAndStart(string hostName, string action)
    {

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("Starting... to" + action + "Host instances");
            try
            {
                
                //Create EnumerationOptions and run wql query
                EnumerationOptions enumOptions = new EnumerationOptions();
                enumOptions.ReturnImmediately = false;
                //Search for all HostInstances of 'InProcess' type in the Biztalk namespace scope
                ManagementObjectSearcher searchObject = new ManagementObjectSearcher("root\\MicrosoftBizTalkServer", "Select * from MSBTS_HostInstance where HostType=1 and HostName like '%"+ hostName + "%'", enumOptions);

                //Enumerate through the result set and start each HostInstance if it is already stopped
                foreach (ManagementObject inst in searchObject.Get())
                {
                    //Check if ServiceState is 'Stopped'
               
                        inst.InvokeMethod(action, null);

                        sb.AppendLine("HostInstance of Host: " + inst["HostName"] + " and Server: " + inst["RunningServer"] + action + "successfully");
              
                }
           
            }
            catch (Exception excep)
            {
                    sb.AppendLine("Failure while starting HostInstances - " + excep.Message);
            }

            getStatus();

    }

        protected void btnExec_Click(object sender, EventArgs e)
        {
            this.EnumerateAndStart(ddApplicationList.Text, "Start");
        }

        protected void btnExec_Click_Stop(object sender, EventArgs e)
        {
            this.EnumerateAndStart(ddApplicationList.Text, "Stop");
        }

        private void getStatus() {
            EnumerationOptions enumOptions = new EnumerationOptions();
            enumOptions.ReturnImmediately = false;
            ManagementObjectSearcher searchObject;
            searchObject = new ManagementObjectSearcher("root\\MicrosoftBizTalkServer", "Select * from MSBTS_HostInstance", enumOptions);
            DataTable dt = new DataTable();
            dt.Columns.Add("ProcessName", typeof(string));
            dt.Columns.Add("HostType", typeof(int));
            dt.Columns.Add("Disabled", typeof(string));
            dt.Columns.Add("ServiceState", typeof(string));
            dt.Columns.Add("Category", typeof(string));
            dt.Columns.Add("Server", typeof(string));

            //Enumerate through the result set and start each HostInstance if it is already stopped
            foreach (ManagementObject inst in searchObject.Get().Cast<ManagementObject>().OrderBy(obj=>obj["HostName"]))
            {

                var procName = inst["HostName"];
                var hostType = inst["HostType"];
                var isDisabed = inst["isDisabled"];
                string sState = inst["ServiceState"].ToString();
                sState = sState =="1" ? "Stopped" : "Running";
                var server = inst["RunningServer"];

                DataRow row = dt.NewRow();
                row["ProcessName"] = procName;
                row["HostType"] = hostType;
                row["Disabled"] = isDisabed;
                row["ServiceState"] = sState;
                row["Server"] = server;

                if (procName.ToString().Contains("SAP"))
                    row["Category"] = "SAP";

                if (procName.ToString().Contains("LGX"))
                    row["Category"] = "LGX";

                dt.Rows.Add(row);
                
            }

          
            grdView.DataSource = dt;
            grdView.DataBind();
        }
        protected void grdView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.Cells[3].Text == "Running")
                {
                    e.Row.Cells[3].ForeColor = System.Drawing.Color.Green;
                    e.Row.Cells[3].Font.Bold = true;
                }
                else if (e.Row.Cells[3].Text == "Stopped")
                {
                    e.Row.Cells[3].ForeColor = System.Drawing.Color.Red;
                    e.Row.Cells[3].Font.Bold = true;
                }
                else
                {
                    e.Row.Cells[3].ForeColor = System.Drawing.Color.Gray;
                }
            }
        }

    }
}