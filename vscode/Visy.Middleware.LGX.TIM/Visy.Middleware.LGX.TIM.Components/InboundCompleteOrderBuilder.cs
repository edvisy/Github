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
    public class InboundCompleteOrderBuilder : BaseComponent
    {

        private readonly complete_order objcomplete_order;
        private InboundResponse objInboundResponse = null;
        private AseConnection connComplete;

        public InboundCompleteOrderBuilder(XLANGMessage inmsg)
        {
            objcomplete_order = Deserialize<complete_order>(inmsg);
        }

        public XmlDocument getcompleteOrderBuilder(complete_order ObjComplete_order, string ConncString, string CompleteOrderSPname, out string exceptionString)
        {
            string totalHours = string.Empty;
            string strSQM = string.Empty;
            string strmessagetypecode = string.Empty;
            string strBoards = string.Empty;
            string strChange = string.Empty;
            string strNoOfProofs = string.Empty;
            exceptionString = string.Empty;
            try
            {
                objInboundResponse = new InboundResponse();
                if ((ObjComplete_order.vendor_order.total_hours == null) || (ObjComplete_order.vendor_order.total_hours == string.Empty))
                {
                    totalHours = "0";
                }
                else
                {
                    totalHours = ObjComplete_order.vendor_order.total_hours.ToString();
                }
                if ((ObjComplete_order.vendor_order.sqm == null) || (ObjComplete_order.vendor_order.sqm == string.Empty))
                {
                    strSQM = "0";
                }
                else
                {
                    strSQM = ObjComplete_order.vendor_order.sqm.ToString();
                }
                if ((ObjComplete_order.vendor_order.message_type_code == null) || (ObjComplete_order.vendor_order.message_type_code == string.Empty))
                {
                    strmessagetypecode = "0";
                }
                else
                {
                    strmessagetypecode = ObjComplete_order.vendor_order.message_type_code.ToString();
                }
                if ((ObjComplete_order.vendor_order.boards == null) || (ObjComplete_order.vendor_order.boards == string.Empty))
                {
                    strBoards = "0";
                }
                else
                {
                    strBoards = ObjComplete_order.vendor_order.boards.ToString();
                }
                if ((ObjComplete_order.vendor_order.charge == null) || (ObjComplete_order.vendor_order.charge == string.Empty))
                {
                    strChange = "0";
                }
                else
                {
                    strChange = ObjComplete_order.vendor_order.charge.ToString();
                }
                if (ObjComplete_order.vendor_order.no_proofs == null || ObjComplete_order.vendor_order.no_proofs == string.Empty)
                {
                    strNoOfProofs = "0";
                }
                else
                {
                    strNoOfProofs = ObjComplete_order.vendor_order.no_proofs.ToString();
                }

                CompleteOrderSPProcess(ObjComplete_order.vendor_order.vendor_order_id,
                              totalHours,
                              strSQM,
                              ObjComplete_order.vendor_order.tim_vendor_code,
                              strmessagetypecode,
                              strBoards,
                              strChange,
                              strNoOfProofs,
                              ConncString,
                              CompleteOrderSPname);
                objInboundResponse.tim_vendor_order_id = ObjComplete_order.vendor_order.vendor_order_id.ToString();
                objInboundResponse.InboundType = "Complete Order";
                objInboundResponse.ResponseDate = DateTime.Today;
                //Utility.WriteEventLog("Function getcompleteOrderBuilder has completed", "Information"); 
                return Serialize(objInboundResponse);
                //return objInboundResponse;

            }

            catch (Exception Ex)
            {
                Utility.WriteEventLog("Error Details from function getcompleteOrderBuilder() :" + Ex.Message, "Error");
                exceptionString = Ex.Message + ". " + Ex.StackTrace;
                return null;
               
            }
            finally
            {
                DisposeCompleteCloseConn();
            }

        }


        private AseConnection OpenCompleteConnection(string connString)
        {
            //var connectionString = getConnectionInfo();
            //try
            //{
                connComplete = new AseConnection(connString);
                connComplete.Open();
                return connComplete;
            //}
            //catch (Exception Ex)
            //{
            //    Utility.WriteEventLog("Error Details from function OpenCompleteConnection() :" + Ex.Message, "Error");
            //    // return null;
            //    throw;
            //}
        }

        private void DisposeCompleteCloseConn()
        {
            try
            {
                if (connComplete != null)
                {
                    if (connComplete.State == ConnectionState.Open)
                    {
                        connComplete.Close();
                        connComplete.Dispose();
                    }

                    else if (connComplete.State == ConnectionState.Closed)
                    {
                        connComplete.Dispose();
                    }
                }
            }
            catch (Exception Ex)
            {
                Utility.WriteEventLog("Error Details from function DisposeCompleteCloseConn() :" + Ex.Message, "Error");
                throw;
            }
        }


        private void CompleteOrderSPProcess(int tim_vendor_order_id,
                            string total_hours,
                            string sqm,
                            string user_name,
                            string message_type_code,
                            string boards,
                            string charge,
                            string no_of_proof,
                            string ConncString,
                            string CompleteOrderSPname)
        {
            var spCompleteOrder = CompleteOrderSPname;
            //try
            //{
                /*
                    create procedure dbo.pu_tim_vendor_order_handover
                    (
	                        @tim_vendor_order_id	NUMERIC(9,0)
                        ,	@total_hours			VARCHAR(15) 		-- LC - Hacked to cater for Biztalk...
                        ,	@sqm					VARCHAR(15)
                        ,	@user_name 				VARCHAR(20)
                           ,@message_type_code		VARCHAR(15)  	= NULL
                        ,	@boards					VARCHAR(15)  	= NULL
                        ,	@charge					VARCHAR(15)  	= NULL
                        ,	@no_of_proof			VARCHAR(15)  	= "0"
                        ,	@allow_update			INT				= 0 -- Added on 21-01-2015
                        ,	@debug					INT				= 0
                    )            
                 */

                if (connComplete == null) 
                {
                    connComplete = OpenCompleteConnection(ConncString);
                }
                else if (connComplete.State != ConnectionState.Open)
                {
                    connComplete = OpenCompleteConnection(ConncString);
                }
                var cmd = new AseCommand(spCompleteOrder, connComplete) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new AseParameter("@tim_vendor_order_id", AseDbType.Numeric, 9) { Value = tim_vendor_order_id });
                cmd.Parameters.Add(new AseParameter("@total_hours", AseDbType.VarChar, 15) { Value = total_hours });
                cmd.Parameters.Add(new AseParameter("@sqm", AseDbType.VarChar, 15) { Value = sqm });
                cmd.Parameters.Add(new AseParameter("@user_name", AseDbType.VarChar, 20) { Value = user_name });
                cmd.Parameters.Add(new AseParameter("@message_type_code", AseDbType.VarChar, 15) { Value = message_type_code });
                cmd.Parameters.Add(new AseParameter("@boards", AseDbType.VarChar, 15) { Value = boards });
                cmd.Parameters.Add(new AseParameter("@charge", AseDbType.VarChar, 15) { Value = charge });
                cmd.Parameters.Add(new AseParameter("@user_name", AseDbType.VarChar, 20) { Value = user_name });
                cmd.Parameters.Add(new AseParameter("@no_of_proof", AseDbType.VarChar, 20) { Value = no_of_proof });
                cmd.Parameters.Add(new AseParameter("@debug", AseDbType.Integer) { Value = 0 });
                cmd.ExecuteNonQuery();
                //Utility.WriteEventLog("Function CompleteOrderSPProcess has completed", "Information"); 
            //}
            //catch (Exception Ex)
            //{
            //    Utility.WriteEventLog("Error Details from function CompleteOrderSPProcess() :" + Ex.Message, "Error");
            //    throw;
            //}

        }
    }
}
