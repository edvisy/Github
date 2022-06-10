using System;
using System.Text;
using System.Collections.Generic;
using System.IO;
using System.Xml;
using System.Xml.Serialization;
using Microsoft.XLANGs.BaseTypes;
using System.Configuration;
using System.Data;
using Sybase.Data.AseClient;
using System.Diagnostics;

namespace Visy.Middleware.LGX.TIM.Components
{
    [Serializable]
    public class InboundAcceptOrderBuilder : BaseComponent
    {
        private readonly accept_order objaccept_order;
        private InboundResponse objInboundResponse = null;
        private AseConnection connAccept;

        public InboundAcceptOrderBuilder(XLANGMessage inmsg)
        {
            objaccept_order = Deserialize<accept_order>(inmsg);
        }
        public XmlDocument getAcceptOrderBuilder(accept_order ObjAccept_order, string ConncString, string AcceptOrderSPname, out string exceptionString)
        {
            DateTime Actual_Due_Date;
            exceptionString = string.Empty;
            try
            {
                objInboundResponse = new InboundResponse();
                Actual_Due_Date = DateTime.Parse(ObjAccept_order.vendor_order.actual_due_date);
                AcceptOrderSPProcess(ObjAccept_order.vendor_order.vendor_order_id,
                    //ObjAccept_order.vendor_order.actual_due_date,
                                    Actual_Due_Date,
                                    ObjAccept_order.vendor_order.vendor_reference,
                                    ObjAccept_order.vendor_order.tim_vendor_code,
                                    ObjAccept_order.vendor_order.is_date_change_accepted,
                                    ConncString,
                                    AcceptOrderSPname);
                objInboundResponse.tim_vendor_order_id = ObjAccept_order.vendor_order.vendor_order_id.ToString();
                objInboundResponse.InboundType = "Accept Order";
                objInboundResponse.ResponseDate = DateTime.Today;
                //Utility.WriteEventLog("Function getAcceptOrderBuilder has completed", "Information"); 
                return Serialize(objInboundResponse);
            }

            catch (Exception Ex)
            {
                Utility.WriteEventLog("Error Details from function getAcceptOrderBuilder() :" + Ex.Message, "Error");
                exceptionString = Ex.Message + ". " + Ex.StackTrace;
                return null;               
                
            }
            finally
            {
                DisposeAcceptCloseConn();
            }

        }

        private AseConnection OpenAcceptConnection(string connString)
        {
            //var connectionString = getConnectionInfo();
            //try
            //{
                connAccept = new AseConnection(connString);
                connAccept.Open();
                return connAccept;
            //}
            //catch (Exception Ex)
            //{
            //    Utility.WriteEventLog("Error Details from function OpenAcceptConnection() :" + Ex.Message, "Error");
            //    //return null;
            //    throw;
            //}
        }

        private void DisposeAcceptCloseConn()
        {
            try
            {
                if (connAccept != null)
                {
                    if (connAccept.State == ConnectionState.Open)
                    {
                        connAccept.Close();
                        connAccept.Dispose();
                    }

                    else if (connAccept.State == ConnectionState.Closed)
                    {
                        connAccept.Dispose();
                    }
                }

            }
            catch (Exception Ex)
            {
                Utility.WriteEventLog("Error Details from function DisposeAcceptCloseConn() :" + Ex.Message, "Error");
                throw;
            }
        }


        private void AcceptOrderSPProcess(int tim_vendor_order_id,
                                    DateTime due_date,
            //string due_date,
                                    string vendor_reference,
                                    string user_name,
                                    string is_date_change_accepted,
                                    string ConncString,
                                    string AcceptOrderSPname)
        {
            var spAcceptOrder = AcceptOrderSPname;
            //try
            //{
                /*
                    create procedure dbo.pu_tim_vendor_order_accept
                    (	@tim_vendor_order_id	NUMERIC(9,0)
                    ,	@due_date 				DATETIME 		= NULL
                    ,	@vendor_reference		VARCHAR(20)		= NULL
                    ,	@user_name 				VARCHAR(20)		= NULL
                    ,   @is_date_change_accepted  VARCHAR(3)      =NULL     --Modified on 05/11/2014
                    ,	@debug					INT				= 0
                    )
                    AS      
                 */

                if (connAccept == null)
                {
                    connAccept = OpenAcceptConnection(ConncString);
                }
                else if (connAccept.State != ConnectionState.Open)
                {
                    connAccept = OpenAcceptConnection(ConncString);
                }
                var cmd = new AseCommand(spAcceptOrder, connAccept) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new AseParameter("@tim_vendor_order_id", AseDbType.Numeric, 9) { Value = tim_vendor_order_id });
                cmd.Parameters.Add(new AseParameter("@due_date", AseDbType.DateTime) { Value = due_date });
                cmd.Parameters.Add(new AseParameter("@vendor_reference", AseDbType.VarChar, 20) { Value = vendor_reference });
                cmd.Parameters.Add(new AseParameter("@user_name", AseDbType.VarChar, 20) { Value = user_name });
                cmd.Parameters.Add(new AseParameter("@is_date_change_accepted", AseDbType.VarChar, 3) { Value = is_date_change_accepted });
                cmd.Parameters.Add(new AseParameter("@debug", AseDbType.Integer) { Value = 0 });
                cmd.ExecuteNonQuery();
                //Utility.WriteEventLog("Function AcceptOrderSPProcess has completed", "Information"); 
            //}
            //catch (Exception Ex)
            //{
            //    Utility.WriteEventLog("Error Details from function AcceptOrderSPProcess() :" + Ex.Message, "Error");
            //    throw;
            //}

        }
    }
}

