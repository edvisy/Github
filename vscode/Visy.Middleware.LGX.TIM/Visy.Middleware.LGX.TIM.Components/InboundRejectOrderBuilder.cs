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

namespace Visy.Middleware.LGX.TIM.Components
{
    [Serializable]
    public class InboundRejectOrderBuilder : BaseComponent
    {
        private readonly reject_order objreject_order;
        private InboundResponse objInboundResponse = null;
        private AseConnection connReject;

        public InboundRejectOrderBuilder(XLANGMessage inmsg)
        {
            objreject_order = Deserialize<reject_order>(inmsg);
        }

        public XmlDocument getRejectOrderBuilder(reject_order objReject_order, string ConncString, string RejectOrderSPname, out string exceptionString)
        {
            exceptionString = string.Empty;
            try
            {
                objInboundResponse = new InboundResponse();
                string rejectionReason = string.Empty;
                int countComments = objReject_order.vendor_order.comments.Length;
                if (countComments > 0)
                {
                    rejectionReason = objReject_order.vendor_order.comments[countComments - 1].comment.ToString();
                }
                RejectOrderSPProcess(objReject_order.vendor_order.vendor_order_id,
                     rejectionReason,
                     objReject_order.vendor_order.tim_vendor_code,
                     ConncString,
                     RejectOrderSPname);
                objInboundResponse.tim_vendor_order_id = objReject_order.vendor_order.vendor_order_id.ToString();
                objInboundResponse.InboundType = "Reject Order";
                objInboundResponse.ResponseDate = DateTime.Today;
                //Utility.WriteEventLog("Function getRejectOrderBuilder has completed", "Information"); 
                return Serialize(objInboundResponse);
                //return objInboundResponse;
            }

            catch (Exception Ex)
            {
                Utility.WriteEventLog("Error Details from function getRejectOrderBuilder() :" + Ex.Message, "Error");
                exceptionString = Ex.Message + ". " + Ex.StackTrace;
                return null;                
            }
            finally
            {
                DisposeRejectCloseConn();
            }

        }

        private AseConnection OpenRejectConnection(string connString)
        {
            //var connectionString = getConnectionInfo();
            //try
            //{
                connReject = new AseConnection(connString);
                connReject.Open();
                return connReject;
            //}
            //catch (Exception Ex)
            //{
            //    Utility.WriteEventLog("Error Details from function OpenRejectConnection() :" + Ex.Message, "Error");
            //    // return null;
            //    throw;
            //}
        }

        private void DisposeRejectCloseConn()
        {
            try
            {
                if (connReject != null)
                {
                    if (connReject.State == ConnectionState.Open)
                    {
                        connReject.Close();
                        connReject.Dispose();
                    }

                    else if (connReject.State == ConnectionState.Closed)
                    {
                        connReject.Dispose();
                    }
                }   
            }
            catch (Exception Ex)
            {
                Utility.WriteEventLog("Error Details from function DisposeRejectCloseConn() :" + Ex.Message, "Error");
                throw;
            }
        }



        private void RejectOrderSPProcess(int tim_vendor_order_id,
                            string reject_reason,
                            string user_name,
                            string ConncString,
                            string RejectOrderSPname)
        {
            var spRejectOrder = RejectOrderSPname;
            //try
            //{
                /*
                    create procedure dbo.pu_tim_vendor_order_reject
                    (	@tim_vendor_order_id	NUMERIC(9,0)
                    ,	@reject_reason			VARCHAR(500)
                    ,	@user_name 				VARCHAR(20)		= NULL
                    ,	@debug					INT				= 0
                    )
                    AS      
                 */

                if (connReject == null)
                {
                    connReject = OpenRejectConnection(ConncString);
                }
                else if(connReject.State != ConnectionState.Open)
                {
                    connReject = OpenRejectConnection(ConncString);
                }
                var cmd = new AseCommand(spRejectOrder, connReject) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new AseParameter("@tim_vendor_order_id", AseDbType.Numeric, 9) { Value = tim_vendor_order_id });
                cmd.Parameters.Add(new AseParameter("@reject_reason", AseDbType.VarChar, 500) { Value = reject_reason });
                cmd.Parameters.Add(new AseParameter("@user_name", AseDbType.VarChar, 20) { Value = user_name });
                cmd.Parameters.Add(new AseParameter("@debug", AseDbType.Integer) { Value = 0 });
                cmd.ExecuteNonQuery();
                //Utility.WriteEventLog("Function RejectOrderSPProcess has completed", "Information"); 
            //}
            //catch (Exception Ex)
            //{
            //    Utility.WriteEventLog("Error Details from function getRejectOrderBuilder() :" + Ex.Message, "Error");
            //    throw;
            //}

        }
    }
}
