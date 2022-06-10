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
    //public class ActiveOrderBuilder 
    public class ActiveOrderBuilder : BaseComponent
    {
        private readonly ACTIVE_ORDER_SYNC aCTIVE_ORDER_SYNC;
        private ActiveOrderSyncResponse activeOrderSyncResponse = null;
        private ActiveOrderSyncResponseOrders activeOrderSyncResponseOrders = null;
        private int LINCNT = 0;
        private AseConnection conn;

        
        public ActiveOrderBuilder(XLANGMessage inmsg)
        {
            aCTIVE_ORDER_SYNC = Deserialize<ACTIVE_ORDER_SYNC>(inmsg);

        }
        //public ActiveOrderSyncResponse getActiveOrderBuilder(ACTIVE_ORDER_SYNC active_Order_Sync, string ConncString, string SPname)
        public XmlDocument getActiveOrderBuilder(ACTIVE_ORDER_SYNC active_Order_Sync, string ConncString, string SPname, out string exceptionString)
        {
            exceptionString = string.Empty;
            try
            {
                activeOrderSyncResponse = new ActiveOrderSyncResponse();

                ActiveOrderSyncResponseOrders[] arrActiveOrderSyncResponseOrders = new ActiveOrderSyncResponseOrders[active_Order_Sync.vendor_orders.Length];
                if (active_Order_Sync.vendor_orders.Length > 0)
                {
                    for (LINCNT = 0; LINCNT < active_Order_Sync.vendor_orders.Length; LINCNT++)
                    {
                        arrActiveOrderSyncResponseOrders[LINCNT] = new ActiveOrderSyncResponseOrders();
                        arrActiveOrderSyncResponseOrders[LINCNT] = getActiveOrderSyncResponseOrders(active_Order_Sync.vendor_orders[LINCNT],
                                                                                                    active_Order_Sync.scope,
                                                                                                    ConncString,
                                                                                                    SPname);

                    }
                    activeOrderSyncResponse.tim_vendor_code = active_Order_Sync.tim_vendor_code;
                    activeOrderSyncResponse.Orders = arrActiveOrderSyncResponseOrders;
                    //return activeOrderSyncResponse;
                }
                else
                {
                    activeOrderSyncResponse = null;
                    //Do not throw exception when empty sync order is received but log it and gracefully end the orchestration.
                    exceptionString = "EmptyOrderSyncRequest";                    
                    return null;
                }
                //return activeOrderSyncResponse;
                return Serialize(activeOrderSyncResponse);
            }
            catch (Exception Ex)
            {
                Utility.WriteEventLog("Error Details from function getActiveOrderBuilder() :" + Ex.Message, "Error");
                exceptionString = Ex.Message + ". " + Ex.StackTrace;
                return null;
            }
            finally
            {
                DisposeCloseConn();
            }
        }

        //}
        private ActiveOrderSyncResponseOrders getActiveOrderSyncResponseOrders(vendor_ordersVendor_order objvendor_ordersVendor_order, string strscope, string ConncString, string SPname)
        {
            //try
            //{
                activeOrderSyncResponseOrders = new ActiveOrderSyncResponseOrders();
                activeOrderSyncResponseOrders.tim_vendor_order_id = objvendor_ordersVendor_order.tim_vendor_order_id;
                activeOrderSyncResponseOrders.Message = "Success";
                UpdateVendorOrderSync(objvendor_ordersVendor_order.tim_vendor_order_id,
                                        objvendor_ordersVendor_order.actual_due_date,
                                        objvendor_ordersVendor_order.is_date_change_accepted,
                                        objvendor_ordersVendor_order.order_status,
                                        strscope,
                                        ConncString,
                                        SPname);
                return activeOrderSyncResponseOrders;
            }

            /*catch (Exception Ex)
            {
                //return null;
                throw Ex;
            }*/
            /*finally
            {
                activeOrderSyncResponseOrders = null;
            }

        }*/


        private Nullable<DateTime> ConvertStringDate(string inputDate, string  tim_vendor_order_id)
        {
            //try
            //{
                DateTime parsedDateTime;
                if (inputDate != string.Empty)
                {
                    
                    DateTime.TryParseExact(inputDate, "yyyy-MM-dd'T'HH:mm:ss'Z'", null, System.Globalization.DateTimeStyles.None, out parsedDateTime);
                    if (parsedDateTime.Year == 1)
                    {
                        return null;
                        throw new Exception("Invalid actual_due_date field value in Order Sync for tim_vendor_order_id : " + tim_vendor_order_id);                        
                    }
                    else
                    {
                        return parsedDateTime;
                    }
                }
                else
                {
                    return null;
                }
                //return parsedDateTime;

            }
            /*catch (Exception Ex)
            {
                throw Ex;
            }
            finally
            {

            }
        }*/

        private string GetTrimFixedlength(string InputStringParam, int LengthParam)
        {
            //string InputStringParam = string.Empty;
            //try
            //{
                if (InputStringParam.Trim().Length > LengthParam)
                {

                    InputStringParam = InputStringParam.Trim().Substring(0, LengthParam);
                }
                else
                {
                    InputStringParam = InputStringParam.Trim();
                }
                return InputStringParam;
            }
            /*finally
            {

            }
        }*/


        private AseConnection OpenConnection(string connString)
        {
            //var connectionString = getConnectionInfo();
            //try
            //{
                conn = new AseConnection(connString);
                conn.Open();
                return conn;
            }
            /*catch (Exception Ex)
            {
               // return null;
                throw Ex;
            }
            finally
            {

            }
        }*/

         private void DisposeCloseConn()
        {
            
                if (conn != null)
                {
                    if (conn.State == ConnectionState.Open)
                    {
                        conn.Close();
                        conn.Dispose();
                    }

                    else if (conn.State == ConnectionState.Closed)
                    {
                        conn.Dispose();
                    }
                }         

          
         }

        public void UpdateVendorOrderSync(//int tim_vendor_order_id,
                                            string tim_vendor_order_id,
                                            //DateTime actual_due_date,
                                            string actual_due_date,
                                            //int is_date_change_accepted,
                                            string is_date_change_accepted,
                                            string order_status,
                                            string scope,
                                            string ConncString,
                                            string SPname)
        {
            var spTIMProcessUpdate = SPname;
            //try
            //{
                int tim_vendor_order_id_Int;
                int is_date_change_accepted_Int;

                if (!int.TryParse(tim_vendor_order_id, out tim_vendor_order_id_Int))
                {
                    throw new Exception("Invalid tim_vendor_order_id field value in Order Sync for tim_vendor_order_id : " + tim_vendor_order_id);
                }
                if (!int.TryParse(is_date_change_accepted, out is_date_change_accepted_Int))
                {
                    throw new Exception("Invalid is_date_change_accepted_Int field value in Order Sync for tim_vendor_order_id : " + tim_vendor_order_id);
                }
                if (conn == null)
                {
                    conn = OpenConnection(ConncString);
                }
                else if(conn.State != ConnectionState.Open)
                {
                conn = OpenConnection(ConncString);
                }
                var cmd = new AseCommand(spTIMProcessUpdate, conn) { CommandType = CommandType.StoredProcedure };
                cmd.Parameters.Add(new AseParameter("@tim_vendor_order_id", AseDbType.Numeric, 9) { Value = tim_vendor_order_id_Int });
                cmd.Parameters.Add(new AseParameter("@actual_due_date", AseDbType.DateTime) { Value = ConvertStringDate(actual_due_date, tim_vendor_order_id) });
                cmd.Parameters.Add(new AseParameter("@is_date_change_accepted", AseDbType.TinyInt) { Value = is_date_change_accepted });
                cmd.Parameters.Add(new AseParameter("@order_status", AseDbType.VarChar, 50) { Value = GetTrimFixedlength(order_status,50) });
                cmd.Parameters.Add(new AseParameter("@scope", AseDbType.VarChar, 50) { Value = GetTrimFixedlength(scope,50) });
                cmd.Parameters.Add(new AseParameter("@debug", AseDbType.Integer) { Value = 0 });
                cmd.ExecuteNonQuery();
            }
            /*catch (Exception Ex)
            {
                throw Ex;
            }

            finally
            {
                //conn.Close();
            }

        }*/
    }
}
