using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Xml;

namespace Visy.Middleware.LGX.TIM.Console
{
    public class XMLUtility
    {
        int vendor_order_id = 0;
        int tim_process_id = 0;
        string process_code = string.Empty;
        string tim_vendor_code = string.Empty;
        string process_code_2 = string.Empty;


        public string Process_Code_2
        {
            get
            {
                return this.process_code_2;
            }
            set
            {
                this.process_code_2 = value;
            }
        }


        public int Vendor_Order_ID
        {
            get
            {
                return this.vendor_order_id;
            }
            set
            {
                this.vendor_order_id = value;
            }
        }

        public int TIM_Process_ID
        {
            get
            {
                return this.tim_process_id;
            }
            set
            {
                this.tim_process_id = value;
            }
        }

        public string Process_Code
        {
            get
            {
                return this.process_code.ToUpper();
            }
            set
            {
                this.process_code = value;
            }
        }

        public string TIM_Vendor_Code
        {
            get
            {
                return this.tim_vendor_code.ToUpper();
            }
            set
            {
                this.tim_vendor_code = value;
            }
        }


        public int GenerateXMLTimProcess(DataSet DS)
        {
            StringBuilder XMLStringBuilder;
            XmlDocument xmlDoc;
            Guid fileName;
            //int vendor_order_id=0;
            try
            {
                fileName = Guid.NewGuid();
                //int vendor_order_id;
                xmlDoc = new XmlDocument();
                XMLStringBuilder = new StringBuilder();
                XMLStringBuilder.Append(System.Configuration.ConfigurationManager.AppSettings["TIMProcessHeader"]);
                foreach (DataRow row in DS.Tables[0].Rows)
                {
                    if (row["tim_process_id"] != null)
                    {
                        XMLStringBuilder.AppendLine("<tim_process_id>" + row["tim_process_id"].ToString() + "</tim_process_id>");
                        TIM_Process_ID = int.Parse(row["tim_process_id"].ToString());
                    }
                    if (row["tim_vendor_order_id"] != null)
                    {
                        XMLStringBuilder.AppendLine("<tim_vendor_order_id>" + row["tim_vendor_order_id"].ToString() + "</tim_vendor_order_id>");
                        Vendor_Order_ID = int.Parse(row["tim_vendor_order_id"].ToString());
                    }
                    if (row["tim_process_type_code"] != null)
                    {
                        XMLStringBuilder.AppendLine("<tim_process_type_code>" + row["tim_process_type_code"].ToString() + "</tim_process_type_code>");
                    }
                    if (row["is_processed"] != null)
                    {
                        XMLStringBuilder.AppendLine("<is_processed>" + row["is_processed"].ToString() + "</is_processed>");
                    }
                    if (row["processed_date"] != null)
                    {
                        XMLStringBuilder.AppendLine("<processed_date>" + row["processed_date"].ToString() + "</processed_date>");
                    }
                    if (row["error_message"] != null)
                    {
                        XMLStringBuilder.AppendLine("<error_message>" + row["error_message"].ToString() + "</error_message>");
                    }
                    if (row["process_code_1"] != null)
                    {
                        XMLStringBuilder.AppendLine("<process_code_1>" + row["process_code_1"].ToString() + "</process_code_1>");
                        Process_Code = row["process_code_1"].ToString().ToUpper();
                    }
                    if (row["process_code_2"] != null)
                    {
                        XMLStringBuilder.AppendLine("<process_code_2>" + row["process_code_2"].ToString() + "</process_code_2>");
                        process_code_2 = row["process_code_2"].ToString();
                    }
                    if (row["process_attempt_no"] != null)
                    {
                        XMLStringBuilder.AppendLine("<process_attempt_no>" + row["process_attempt_no"].ToString() + "</process_attempt_no>");
                    }
                }
                XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["TIMProcessHeaderEnd"]);
                xmlDoc.LoadXml(XMLStringBuilder.ToString());
                xmlDoc.Save(System.Configuration.ConfigurationManager.AppSettings["TimProcessStoreFilePath"] + vendor_order_id.ToString() + "_" + TIM_Process_ID.ToString() + "_" + fileName.ToString() + ".xml");
                return vendor_order_id;

            }

            catch (Exception)
            {
                //return 0;
                throw;

            }

        }

        public void GenerateXMLOrderSync(DataSet DS)
        {
            StringBuilder XMLStringBuilder;
            //var sproc = System.Configuration.ConfigurationManager.AppSettings["sproc"];
            XmlDocument xmlDoc;
            Guid fileName;
            try
            {
                if (DS.Tables[0].Rows.Count > 0)
                {
                    fileName = Guid.NewGuid();
                    xmlDoc = new XmlDocument();
                    XMLStringBuilder = new StringBuilder();
                    //XMLStringBuilder.Append(System.Configuration.ConfigurationManager.AppSettings["MainHeaderOrderSync"]);
                    foreach (DataRow row in DS.Tables[0].Rows)
                    {
                        if (row["tim_vendor_code"] != null)
                        {
                            XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["MainHeaderOrderSync"] +
                            row["scope"].ToString() +
                            System.Configuration.ConfigurationManager.AppSettings["MiddleHeaderOrderSync"] +
                            row["tim_vendor_code"].ToString() +
                            System.Configuration.ConfigurationManager.AppSettings["EndHeaderOrderSync"]);
                        }
                    }
                    foreach (DataRow row in DS.Tables[1].Rows)
                    {
                        if (row["tim_vendor_order_id"] != null)
                        {
                            //XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["StartOrderSyncStr"]);
                            XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["StartSubOrderSyncStr"]);
                            XMLStringBuilder.AppendLine("<tim_vendor_order_id>" + row["tim_vendor_order_id"].ToString() + "</tim_vendor_order_id>");

                        }
                        if (row["actual_due_date"] != null)
                        {
                            XMLStringBuilder.AppendLine("<actual_due_date>" + Utility.ConvertSybaseDateTime(row["actual_due_date"].ToString()) + "</actual_due_date>");
                        }
                        if (row["requested_due_date"] != null)
                        {
                            XMLStringBuilder.AppendLine("<requested_due_date>" + Utility.ConvertSybaseDateTime(row["requested_due_date"].ToString()) + "</requested_due_date>");
                        }
                        //if (row["<order_status"] != null)
                        //{
                            //XMLStringBuilder.AppendLine("<order_status>" + row["order_status"].ToString() + "</order_status>");
                            XMLStringBuilder.AppendLine("<order_status>" + "</order_status>");
                        //}
                        XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["EndSubOrderSyncStr"]);
                        //XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["EndOrderSyncStr"]);
                    }
                    XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["MainHeaderEndOrderSync"]);
                    xmlDoc.LoadXml(XMLStringBuilder.ToString());
                    xmlDoc.Save(System.Configuration.ConfigurationManager.AppSettings["StoreFilePathOrderSync"] + vendor_order_id.ToString() + "_" + TIM_Process_ID.ToString() + "_" + fileName.ToString() + ".xml");
                }
                
            }
            catch (Exception)
            {
                throw;

            }

        }

        public void GenerateXMLCreateUpdateCancel(DataSet DS, string TypeTransaction)
        {
            StringBuilder XMLStringBuilder;
            //var sproc = System.Configuration.ConfigurationManager.AppSettings["sproc"];
            XmlDocument xmlDoc;
            Guid fileName;
            try
            {
                if (DS.Tables[0].Rows.Count > 0)
                {
                    fileName = Guid.NewGuid();
                    xmlDoc = new XmlDocument();
                    XMLStringBuilder = new StringBuilder();
                    if (TypeTransaction == "CREATE")
                    {
                        XMLStringBuilder.Append(System.Configuration.ConfigurationManager.AppSettings["MainHeaderCreateStr"]);
                    }
                    else if (TypeTransaction == "UPDATE")
                    {
                        XMLStringBuilder.Append(System.Configuration.ConfigurationManager.AppSettings["MainHeaderUpdateStr"]);
                    }
                    else if (TypeTransaction == "CANCEL")
                    {
                        XMLStringBuilder.Append(System.Configuration.ConfigurationManager.AppSettings["MainHeaderCancelStr"]);
                    }
                    foreach (DataRow row in DS.Tables[0].Rows)
                    {
                        if (row["tim_vendor_order_id"] != null)
                        {
                            XMLStringBuilder.AppendLine("<vendor_order_id>" + row["tim_vendor_order_id"].ToString() + "</vendor_order_id>");
                        }
                        if (row["tim_status_code"] != null)
                        {
                            XMLStringBuilder.AppendLine("<tim_status_code>" + Utility.ReplaceEscapeCharacter(row["tim_status_code"].ToString()) + "</tim_status_code>");
                        }
                        if (row["tim_status_desc"] != null)
                        {
                            XMLStringBuilder.AppendLine("<tim_status_desc>" + Utility.ReplaceEscapeCharacter(row["tim_status_desc"].ToString()) + "</tim_status_desc>");
                        }
                        if (row["parent_vendor_order_id"] != null)
                        {
                            XMLStringBuilder.AppendLine("<parent_vendor_order_id>" + row["parent_vendor_order_id"].ToString() + "</parent_vendor_order_id>");
                        }
                        if (row["tim_asset_id"] != null)
                        {
                            XMLStringBuilder.AppendLine("<tim_asset_id>" + row["tim_asset_id"].ToString() + "</tim_asset_id>");
                        }
                        if (row["asset_revision_no"] != null)
                        {
                            XMLStringBuilder.AppendLine("<asset_revision_no>" + row["asset_revision_no"].ToString() + "</asset_revision_no>");
                        }
                        if (row["tim_asset_code"] != null)
                        {
                            XMLStringBuilder.AppendLine("<tim_asset_code>" + Utility.ReplaceEscapeCharacter(row["tim_asset_code"].ToString()) + "</tim_asset_code>");
                        }
                        if (row["tim_asset_desc"] != null)
                        {
                            XMLStringBuilder.AppendLine("<tim_asset_desc>" + Utility.ReplaceEscapeCharacter(row["tim_asset_desc"].ToString()) + "</tim_asset_desc>");
                        }
                        if (row["tim_order_type_code"] != null)
                        {
                            XMLStringBuilder.AppendLine("<tim_order_type_code>" + Utility.ReplaceEscapeCharacter(row["tim_order_type_code"].ToString()) + "</tim_order_type_code>");
                        }
                        if (row["tim_order_type_desc"] != null)
                        {
                            XMLStringBuilder.AppendLine("<tim_order_type_desc>" + Utility.ReplaceEscapeCharacter(row["tim_order_type_desc"].ToString()) + "</tim_order_type_desc>");
                        }
                        if (row["tim_vendor_code"] != null)
                        {
                            XMLStringBuilder.AppendLine("<tim_vendor_code>" + Utility.ReplaceEscapeCharacter(row["tim_vendor_code"].ToString()) + "</tim_vendor_code>");
                            TIM_Vendor_Code = Utility.ReplaceEscapeCharacter(row["tim_vendor_code"].ToString()).ToUpper();
                        }
                        if (row["tim_vendor_desc"] != null)
                        {
                            XMLStringBuilder.AppendLine("<tim_vendor_desc>" + Utility.ReplaceEscapeCharacter(row["tim_vendor_desc"].ToString()) + "</tim_vendor_desc>");
                        }
                        if (row["vendor_reference"] != null)
                        {
                            XMLStringBuilder.AppendLine("<vendor_reference>" + Utility.ReplaceEscapeCharacter(row["vendor_reference"].ToString()) + "</vendor_reference>");
                        }
                        if (row["submitted_user_name"] != null)
                        {
                            XMLStringBuilder.AppendLine("<submitted_user_name>" + Utility.ReplaceEscapeCharacter(row["submitted_user_name"].ToString()) + "</submitted_user_name>");
                        }
                        if (row["submitted_date"] != null)
                        {
                            XMLStringBuilder.AppendLine("<submitted_date>" + Utility.ConvertSybaseDateTime(row["submitted_date"].ToString()) + "</submitted_date>");
                        }
                        if (row["actual_due_date"] != null)
                        {
                            XMLStringBuilder.AppendLine("<actual_due_date>" + Utility.ConvertSybaseDateTime(row["actual_due_date"].ToString()) + "</actual_due_date>");
                        }
                        if (row["requested_due_date"] != null)
                        {
                            XMLStringBuilder.AppendLine("<requested_due_date>" + Utility.ConvertSybaseDateTime(row["requested_due_date"].ToString()) + "</requested_due_date>");
                        }
                        if (row["original_due_date"] != null)
                        {
                            XMLStringBuilder.AppendLine("<original_due_date>" + Utility.ConvertSybaseDateTime(row["original_due_date"].ToString()) + "</original_due_date>");
                        }
                        if (row["is_completed"] != null)
                        {
                            XMLStringBuilder.AppendLine("<is_completed>" + row["is_completed"].ToString() + "</is_completed>");
                        }
                        if (row["completed_date"] != null)
                        {
                            XMLStringBuilder.AppendLine("<completed_date>" + Utility.ConvertSybaseDateTime(row["completed_date"].ToString()) + "</completed_date>");
                        }
                        if (row["is_under_review"] != null)
                        {
                            XMLStringBuilder.AppendLine("<is_under_review>" + row["is_under_review"].ToString() + "</is_under_review>");
                        }
                        if (row["is_estimate_only"] != null)
                        {
                            XMLStringBuilder.AppendLine("<is_estimate_only>" + row["is_estimate_only"].ToString() + "</is_estimate_only>");
                        }
                        if (row["estimate_cost"] != null)
                        {
                            XMLStringBuilder.AppendLine("<estimate_cost>" + row["estimate_cost"].ToString() + "</estimate_cost>");
                        }
                        if (row["rfq_code"] != null)
                        {
                            XMLStringBuilder.AppendLine("<rfq_code>" + Utility.ReplaceEscapeCharacter(row["rfq_code"].ToString()) + "</rfq_code>");
                        }
                        if (row["workflow_id"] != null)
                        {
                            XMLStringBuilder.AppendLine("<workflow_id>" + row["workflow_id"].ToString() + "</workflow_id>");
                        }
                        if (row["plant_code"] != null)
                        {
                            XMLStringBuilder.AppendLine("<plant_code>" + Utility.ReplaceEscapeCharacter(row["plant_code"].ToString()) + "</plant_code>");
                        }
                        if (row["plant_desc"] != null)
                        {
                            XMLStringBuilder.AppendLine("<plant_desc>" + Utility.ReplaceEscapeCharacter(row["plant_desc"].ToString()) + "</plant_desc>");
                        }
                        if (row["cost_centre_code"] != null)
                        {
                            XMLStringBuilder.AppendLine("<cost_centre_code>" + Utility.ReplaceEscapeCharacter(row["cost_centre_code"].ToString()) + "</cost_centre_code>");
                        }
                        if (row["cost_centre_desc"] != null)
                        {
                            XMLStringBuilder.AppendLine("<cost_centre_desc>" + Utility.ReplaceEscapeCharacter(row["cost_centre_desc"].ToString()) + "</cost_centre_desc>");
                        }
                        if (row["customer_code"] != null)
                        {
                            XMLStringBuilder.AppendLine("<customer_code>" + Utility.ReplaceEscapeCharacter(row["customer_code"].ToString()) + "</customer_code>");
                        }
                        if (row["customer_desc"] != null)
                        {
                            XMLStringBuilder.AppendLine("<customer_desc>" + Utility.ReplaceEscapeCharacter(row["customer_desc"].ToString()) + "</customer_desc>");
                        }
                        if (row["product_code"] != null)
                        {
                            XMLStringBuilder.AppendLine("<product_code>" + Utility.ReplaceEscapeCharacter(row["product_code"].ToString()) + "</product_code>");
                        }
                        if (row["product_desc"] != null)
                        {
                            XMLStringBuilder.AppendLine("<product_desc>" + Utility.ReplaceEscapeCharacter(row["product_desc"].ToString()) + "</product_desc>");
                        }
                        if (row["poq_product_id"] != null)
                        {
                            XMLStringBuilder.AppendLine("<poq_product_id>" + row["poq_product_id"].ToString() + "</poq_product_id>");
                        }
                        if (row["product_id"] != null)
                        {
                            XMLStringBuilder.AppendLine("<product_id>" + row["product_id"].ToString() + "</product_id>");
                        }
                        if (row["stereo_id"] != null)
                        {
                            XMLStringBuilder.AppendLine("<stereo_id>" + row["stereo_id"].ToString() + "</stereo_id>");
                        }
                        if (row["stereo_code"] != null)
                        {
                            XMLStringBuilder.AppendLine("<stereo_code>" + Utility.ReplaceEscapeCharacter(row["stereo_code"].ToString()) + "</stereo_code>");
                        }
                        if (row["forme_id"] != null)
                        {
                            XMLStringBuilder.AppendLine("<forme_id>" + row["forme_id"].ToString() + "</forme_id>");
                        }
                        if (row["forme_code"] != null)
                        {
                            XMLStringBuilder.AppendLine("<forme_code>" + Utility.ReplaceEscapeCharacter(row["forme_code"].ToString()) + "</forme_code>");
                        }
                        if (row["board_grade_code"] != null)
                        {
                            XMLStringBuilder.AppendLine("<board_grade_code>" + Utility.ReplaceEscapeCharacter(row["board_grade_code"].ToString()) + "</board_grade_code>");
                        }
                        if (row["board_grade_desc"] != null)
                        {
                            XMLStringBuilder.AppendLine("<board_grade_desc>" + Utility.ReplaceEscapeCharacter(row["board_grade_desc"].ToString()) + "</board_grade_desc>");
                        }
                        if (row["product_style_code"] != null)
                        {
                            XMLStringBuilder.AppendLine("<product_style_code>" + Utility.ReplaceEscapeCharacter(row["product_style_code"].ToString()) + "</product_style_code>");
                        }
                        if (row["product_style_desc"] != null)
                        {
                            XMLStringBuilder.AppendLine("<product_style_desc>" + Utility.ReplaceEscapeCharacter(row["product_style_desc"].ToString()) + "</product_style_desc>");
                        }
                        if (row["closure_code"] != null)
                        {
                            XMLStringBuilder.AppendLine("<closure_code>" + Utility.ReplaceEscapeCharacter(row["closure_code"].ToString()) + "</closure_code>");
                        }
                        if (row["closure_desc"] != null)
                        {
                            XMLStringBuilder.AppendLine("<closure_desc>" + Utility.ReplaceEscapeCharacter(row["closure_desc"].ToString()) + "</closure_desc>");
                        }
                        if (row["drawing_code"] != null)
                        {
                            XMLStringBuilder.AppendLine("<drawing_code>" + Utility.ReplaceEscapeCharacter(row["drawing_code"].ToString()) + "</drawing_code>");
                        }
                        if (row["internal_length_mm"] != null)
                        {
                            XMLStringBuilder.AppendLine("<internal_length_mm>" + row["internal_length_mm"].ToString() + "</internal_length_mm>");
                        }
                        if (row["internal_width_mm"] != null)
                        {
                            XMLStringBuilder.AppendLine("<internal_width_mm>" + row["internal_width_mm"].ToString() + "</internal_width_mm>");
                        }
                        if (row["internal_depth_mm"] != null)
                        {
                            XMLStringBuilder.AppendLine("<internal_depth_mm>" + row["internal_depth_mm"].ToString() + "</internal_depth_mm>");
                        }
                        if (row["number_up"] != null)
                        {
                            XMLStringBuilder.AppendLine("<number_up>" + row["number_up"].ToString() + "</number_up>");
                        }
                        if (row["ink_code_1"] != null)
                        {
                            XMLStringBuilder.AppendLine("<ink_code_1>" + Utility.ReplaceEscapeCharacter(row["ink_code_1"].ToString()) + "</ink_code_1>");
                        }
                        if (row["ink_desc_1"] != null)
                        {
                            XMLStringBuilder.AppendLine("<ink_desc_1>" + Utility.ReplaceEscapeCharacter(row["ink_desc_1"].ToString()) + "</ink_desc_1>");
                        }
                        if (row["ink_code_2"] != null)
                        {
                            XMLStringBuilder.AppendLine("<ink_code_2>" + Utility.ReplaceEscapeCharacter(row["ink_code_2"].ToString()) + "</ink_code_2>");
                        }
                        if (row["ink_desc_2"] != null)
                        {
                            XMLStringBuilder.AppendLine("<ink_desc_2>" + Utility.ReplaceEscapeCharacter(row["ink_desc_2"].ToString()) + "</ink_desc_2>");
                        }
                        if (row["ink_code_3"] != null)
                        {
                            XMLStringBuilder.AppendLine("<ink_code_3>" + Utility.ReplaceEscapeCharacter(row["ink_code_3"].ToString()) + "</ink_code_3>");
                        }
                        if (row["ink_desc_3"] != null)
                        {
                            XMLStringBuilder.AppendLine("<ink_desc_3>" + Utility.ReplaceEscapeCharacter(row["ink_desc_3"].ToString()) + "</ink_desc_3>");
                        }
                        if (row["ink_code_4"] != null)
                        {
                            XMLStringBuilder.AppendLine("<ink_code_4>" + Utility.ReplaceEscapeCharacter(row["ink_code_4"].ToString()) + "</ink_code_4>");
                        }
                        if (row["ink_desc_4"] != null)
                        {
                            XMLStringBuilder.AppendLine("<ink_desc_4>" + Utility.ReplaceEscapeCharacter(row["ink_desc_4"].ToString()) + "</ink_desc_4>");
                        }
                        if (row["ink_code_5"] != null)
                        {
                            XMLStringBuilder.AppendLine("<ink_code_5>" + Utility.ReplaceEscapeCharacter(row["ink_code_5"].ToString()) + "</ink_code_5>");
                        }
                        if (row["ink_desc_5"] != null)
                        {
                            XMLStringBuilder.AppendLine("<ink_desc_5>" + Utility.ReplaceEscapeCharacter(row["ink_desc_5"].ToString()) + "</ink_desc_5>");
                        }
                        if (row["ink_code_6"] != null)
                        {
                            XMLStringBuilder.AppendLine("<ink_code_6>" + Utility.ReplaceEscapeCharacter(row["ink_code_6"].ToString()) + "</ink_code_6>");
                        }
                        if (row["ink_desc_6"] != null)
                        {
                            XMLStringBuilder.AppendLine("<ink_desc_6>" + Utility.ReplaceEscapeCharacter(row["ink_desc_6"].ToString()) + "</ink_desc_6>");
                        }
                        if (row["ink_code_7"] != null)
                        {
                            XMLStringBuilder.AppendLine("<ink_code_7>" + Utility.ReplaceEscapeCharacter(row["ink_code_7"].ToString()) + "</ink_code_7>");
                        }
                        if (row["ink_desc_7"] != null)
                        {
                            XMLStringBuilder.AppendLine("<ink_desc_7>" + Utility.ReplaceEscapeCharacter(row["ink_desc_7"].ToString()) + "</ink_desc_7>");
                        }
                        if (row["ink_code_8"] != null)
                        {
                            XMLStringBuilder.AppendLine("<ink_code_8>" + Utility.ReplaceEscapeCharacter(row["ink_code_8"].ToString()) + "</ink_code_8>");
                        }
                        if (row["ink_desc_8"] != null)
                        {
                            XMLStringBuilder.AppendLine("<ink_desc_8>" + Utility.ReplaceEscapeCharacter(row["ink_desc_8"].ToString()) + "</ink_desc_8>");
                        }
                        if (row["ink_code_9"] != null)
                        {
                            XMLStringBuilder.AppendLine("<ink_code_9>" + Utility.ReplaceEscapeCharacter(row["ink_code_9"].ToString()) + "</ink_code_9>");
                        }
                        if (row["ink_desc_9"] != null)
                        {
                            XMLStringBuilder.AppendLine("<ink_desc_9>" + Utility.ReplaceEscapeCharacter(row["ink_desc_9"].ToString()) + "</ink_desc_9>");
                        }
                        if (row["plate_type_code"] != null)
                        {
                            XMLStringBuilder.AppendLine("<plate_type_code>" + Utility.ReplaceEscapeCharacter(row["plate_type_code"].ToString()) + "</plate_type_code>");
                        }
                        if (row["plate_type_desc"] != null)
                        {
                            XMLStringBuilder.AppendLine("<plate_type_desc>" + Utility.ReplaceEscapeCharacter(row["plate_type_desc"].ToString()) + "</plate_type_desc>");
                        }
                        if (row["plate_height_code"] != null)
                        {
                            XMLStringBuilder.AppendLine("<plate_height_code>" + Utility.ReplaceEscapeCharacter(row["plate_height_code"].ToString()) + "</plate_height_code>");
                        }
                        if (row["plate_height_desc"] != null)
                        {
                            XMLStringBuilder.AppendLine("<plate_height_desc>" + Utility.ReplaceEscapeCharacter(row["plate_height_desc"].ToString()) + "</plate_height_desc>");
                        }
                        if (row["no_of_colours"] != null)
                        {
                            XMLStringBuilder.AppendLine("<no_of_colours>" + row["no_of_colours"].ToString() + "</no_of_colours>");
                        }
                        if (row["is_preprint"] != null)
                        {
                            XMLStringBuilder.AppendLine("<is_preprint>" + row["is_preprint"].ToString() + "</is_preprint>");
                        }
                        if (row["is_proof_a3"] != null)
                        {
                            XMLStringBuilder.AppendLine("<is_proof_a3>" + row["is_proof_a3"].ToString() + "</is_proof_a3>");
                        }
                        if (row["is_proof_ao_plot"] != null)
                        {
                            XMLStringBuilder.AppendLine("<is_proof_ao_plot>" + row["is_proof_ao_plot"].ToString() + "</is_proof_ao_plot>");
                        }
                        if (row["is_proof_pdf"] != null)
                        {
                            XMLStringBuilder.AppendLine("<is_proof_pdf>" + row["is_proof_pdf"].ToString() + "</is_proof_pdf>");
                        }
                        if (row["is_proof_multiup"] != null)
                        {
                            XMLStringBuilder.AppendLine("<is_proof_multiup>" + row["is_proof_multiup"].ToString() + "</is_proof_multiup>");
                        }
                        if (row["is_proof_digital"] != null)
                        {
                            XMLStringBuilder.AppendLine("<is_proof_digital>" + row["is_proof_digital"].ToString() + "</is_proof_digital>");
                        }
                        if (row["is_proof_full_deckle"] != null)
                        {
                            XMLStringBuilder.AppendLine("<is_proof_full_deckle>" + row["is_proof_full_deckle"].ToString() + "</is_proof_full_deckle>");
                        }
                        if (row["screen_ruling_code"] != null)
                        {
                            XMLStringBuilder.AppendLine("<screen_ruling_code>" + Utility.ReplaceEscapeCharacter(row["screen_ruling_code"].ToString()) + "</screen_ruling_code>");
                        }
                        if (row["screen_ruling_desc"] != null)
                        {
                            XMLStringBuilder.AppendLine("<screen_ruling_desc>" + Utility.ReplaceEscapeCharacter(row["screen_ruling_desc"].ToString()) + "</screen_ruling_desc>");
                        }
                        if (row["barcode"] != null)
                        {
                            XMLStringBuilder.AppendLine("<barcode>" + Utility.ReplaceEscapeCharacter(row["barcode"].ToString()) + "</barcode>");
                        }
                        if (row["barcode_magnification"] != null)
                        {
                            XMLStringBuilder.AppendLine("<barcode_magnification>" + row["barcode_magnification"].ToString() + "</barcode_magnification>");
                        }
                        if (row["barcode_type_code"] != null)
                        {
                            XMLStringBuilder.AppendLine("<barcode_type_code>" + Utility.ReplaceEscapeCharacter(row["barcode_type_code"].ToString()) + "</barcode_type_code>");
                        }
                        if (row["cylinder_repeat_code"] != null)
                        {
                            XMLStringBuilder.AppendLine("<cylinder_repeat_code>" + Utility.ReplaceEscapeCharacter(row["cylinder_repeat_code"].ToString()) + "</cylinder_repeat_code>");
                        }
                        if (row["artwork_method_code"] != null)
                        {
                            XMLStringBuilder.AppendLine("<artwork_method_code>" + Utility.ReplaceEscapeCharacter(row["artwork_method_code"].ToString()) + "</artwork_method_code>");
                        }
                        if (row["artwork_request_code"] != null)
                        {
                            XMLStringBuilder.AppendLine("<artwork_request_code>" + Utility.ReplaceEscapeCharacter(row["artwork_request_code"].ToString()) + "</artwork_request_code>");
                        }
                        if (row["artwork_request_desc"] != null)
                        {
                            XMLStringBuilder.AppendLine("<artwork_request_desc>" + Utility.ReplaceEscapeCharacter(row["artwork_request_desc"].ToString()) + "</artwork_request_desc>");
                        }
                        if (row["film_no_up"] != null)
                        {
                            XMLStringBuilder.AppendLine("<film_no_up>" + row["film_no_up"].ToString() + "</film_no_up>");
                        }
                        if (row["no_cartons_across"] != null)
                        {
                            XMLStringBuilder.AppendLine("<no_cartons_across>" + row["no_cartons_across"].ToString() + "</no_cartons_across>");
                        }
                        if (row["no_cartons_around"] != null)
                        {
                            XMLStringBuilder.AppendLine("<no_cartons_around>" + row["no_cartons_around"].ToString() + "</no_cartons_around>");
                        }
                        if (row["preprint_code"] != null)
                        {
                            XMLStringBuilder.AppendLine("<preprint_code>" + Utility.ReplaceEscapeCharacter(row["preprint_code"].ToString()) + "</preprint_code>");
                        }
                        if (row["preprint_desc"] != null)
                        {
                            XMLStringBuilder.AppendLine("<preprint_desc>" + Utility.ReplaceEscapeCharacter(row["preprint_desc"].ToString()) + "</preprint_desc>");
                        }
                        if (row["film_comment"] != null)
                        {
                            XMLStringBuilder.AppendLine("<film_comment>" + Utility.ReplaceEscapeCharacter(row["film_comment"].ToString()) + "</film_comment>");
                        }
                        if (row["total_cost"] != null)
                        {
                            XMLStringBuilder.AppendLine("<total_cost>" + row["total_cost"].ToString() + "</total_cost>");
                        }
                        if (row["total_hours"] != null)
                        {
                            XMLStringBuilder.AppendLine("<total_hours>" + row["total_hours"].ToString() + "</total_hours>");
                        }
                        if (row["sqm"] != null)
                        {
                            XMLStringBuilder.AppendLine("<sqm>" + row["sqm"].ToString() + "</sqm>");
                        }
                        if (row["quote_order_due_date"] != null)
                        {
                            XMLStringBuilder.AppendLine("<quote_order_date>" + row["quote_order_due_date"].ToString() + "</quote_order_date>");
                        }
                        if (row["quote_order_qty"] != null)
                        {
                            XMLStringBuilder.AppendLine("<quote_order_qty>" + row["quote_order_qty"].ToString() + "</quote_order_qty>");
                        }
                        if (row["order_due_date"] != null)
                        {
                            XMLStringBuilder.AppendLine("<production_order_date>" + row["order_due_date"].ToString() + "</production_order_date>");
                        }
                        if (row["order_qty"] != null)
                        {
                            XMLStringBuilder.AppendLine("<production_order_qty>" + row["order_qty"].ToString() + "</production_order_qty>");
                        }
                        if (row["preprint_order_due_date"] != null)
                        {
                            XMLStringBuilder.AppendLine("<preprint_order_date>" + row["preprint_order_due_date"].ToString() + "</preprint_order_date>");
                        }
                        if (row["preprint_order_qty"] != null)
                        {
                            XMLStringBuilder.AppendLine("<preprint_order_qty>" + row["preprint_order_qty"].ToString() + "</preprint_order_qty>");
                        }
                        if (row["creation_date"] != null)
                        {
                            XMLStringBuilder.AppendLine("<creation_date>" + Utility.ConvertSybaseDateTime(row["creation_date"].ToString()) + "</creation_date>");
                        }
                        if (row["user_name"] != null)
                        {
                            XMLStringBuilder.AppendLine("<user_name>" + Utility.ReplaceEscapeCharacter(row["user_name"].ToString()) + "</user_name>");
                        }
                        if (row["last_updated_date"] != null)
                        {
                            XMLStringBuilder.AppendLine("<last_updated_date>" + Utility.ConvertSybaseDateTime(row["last_updated_date"].ToString()) + "</last_updated_date>");
                        }
                        if (row["last_updated_user_name"] != null)
                        {
                            XMLStringBuilder.AppendLine("<last_updated_user_name>" + Utility.ReplaceEscapeCharacter(row["last_updated_user_name"].ToString()) + "</last_updated_user_name>");
                        }
                        if (row["erection_method"] != null)
                        {
                            XMLStringBuilder.AppendLine("<erection_method>" + Utility.ReplaceEscapeCharacter(row["erection_method"].ToString()) + "</erection_method>");
                        }
                        if (row["cust_group_code"] != null)
                        {
                            XMLStringBuilder.AppendLine("<cust_group_code>" + Utility.ReplaceEscapeCharacter(row["cust_group_code"].ToString()) + "</cust_group_code>");
                        }
                        if (DS.Tables[1].Rows.Count > 0)
                        {
                            int RowIndexreference_items = 1;
                            XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["StartFirstSubHeaderStr"]);
                            foreach (DataRow row1 in DS.Tables[1].Rows)
                            {
                                XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["StartFirstSubHeaderStr1"]);
                                XMLStringBuilder.AppendLine("<sequence_no>" + RowIndexreference_items.ToString() + "</sequence_no>");
                                if (row1["tim_reference_item_id"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<tim_reference_item_id>" + row1["tim_reference_item_id"].ToString() + "</tim_reference_item_id>");
                                }
                                if (row1["tim_vendor_order_id"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<tim_vendor_order_id>" + row1["tim_vendor_order_id"].ToString() + "</tim_vendor_order_id>");
                                }
                                if (row1["attachment_item_id"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<attachment_item_id>" + row1["attachment_item_id"].ToString() + "</attachment_item_id>");
                                }
                                if (row1["file_path"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<file_path>" + Utility.ReplaceEscapeCharacter(row1["file_path"].ToString()) + "</file_path>");
                                }
                                if (row1["file_name"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<file_name>" + Utility.ReplaceEscapeCharacter(row1["file_name"].ToString()) + "</file_name>");
                                }
                                if (row1["zip_file_path"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<zip_file_path>" + Utility.ReplaceEscapeCharacter(row1["zip_file_path"].ToString()) + "</zip_file_path>");
                                }
                                if (row1["source_code"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<source_code>" + Utility.ReplaceEscapeCharacter(row1["source_code"].ToString()) + "</source_code>");
                                }
                                if (row1["description"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<description>" + Utility.ReplaceEscapeCharacter(row1["description"].ToString()) + "</description>");
                                }
                                //Added new code on 16-Dec-2014
                                if (row1["file_type"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<file_type>" + Utility.ReplaceEscapeCharacter(row1["file_type"].ToString()) + "</file_type>");
                                }
                                if (row1["size"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<size>" + row1["size"].ToString() + "</size>");
                                }
                                if (row1["is_reference"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<is_reference>" + row1["is_reference"].ToString() + "</is_reference>");
                                }
                                if (row1["creation_date"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<creation_date>" + Utility.ConvertSybaseDateTime(row1["creation_date"].ToString()) + "</creation_date>");
                                }
                                if (row1["user_name"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<user_name>" + Utility.ReplaceEscapeCharacter(row1["user_name"].ToString()) + "</user_name>");
                                }
                                XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["EndFirstSubHeaderStr1"]);
                                RowIndexreference_items++;
                            }
                            XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["EndFirstSubHeaderStr"]);
                        }

                        if (DS.Tables[4].Rows.Count > 0)
                        {
                            int RowIndexcomment = 1;
                            XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["StartSecondSubHeaderStr"]);
                            foreach (DataRow row2 in DS.Tables[4].Rows)
                            {
                                XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["StartSecondSubHeaderStr1"]);
                                XMLStringBuilder.AppendLine("<sequence_no>" + RowIndexcomment.ToString() + "</sequence_no>");
                                if (row2["tim_comment_id"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<tim_comment_id>" + row2["tim_comment_id"].ToString() + "</tim_comment_id>");
                                }
                                if (row2["comment"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<comment>" + Utility.ReplaceEscapeCharacter(row2["comment"].ToString()) + "</comment>");
                                }
                                if (row2["department_code"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<department_code>" + Utility.ReplaceEscapeCharacter(row2["department_code"].ToString()) + "</department_code>");
                                }
                                if (row2["user_name"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<user_name>" + Utility.ReplaceEscapeCharacter(row2["user_name"].ToString()) + "</user_name>");
                                }
                                if (row2["creation_date"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<creation_date>" + Utility.ConvertSybaseDateTime(row2["creation_date"].ToString()) + "</creation_date>");
                                }
                                XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["EndSecondSubHeaderStr1"]);
                                RowIndexcomment++;
                            }
                            XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["EndSecondSubHeaderStr"]);
                        }

                        if (DS.Tables[7].Rows.Count > 0)
                        {
                            int RowIndexwork_centres = 1;
                            XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["StartThirdSubHeaderStr"]);
                            foreach (DataRow row3 in DS.Tables[7].Rows)
                            {
                                XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["StartThirdSubHeaderStr1"]);
                                XMLStringBuilder.AppendLine("<sequence_no>" + RowIndexwork_centres.ToString() + "</sequence_no>");
                                if (row3["work_centre_code"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<work_centre_code>" + Utility.ReplaceEscapeCharacter(row3["work_centre_code"].ToString()) + "</work_centre_code>");
                                }
                                if (row3["work_centre_desc"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<work_centre_desc>" + Utility.ReplaceEscapeCharacter(row3["work_centre_desc"].ToString()) + "</work_centre_desc>");
                                }
                                if (row3["is_corrugator"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<is_corrugator>" + row3["is_corrugator"].ToString() + "</is_corrugator>");
                                }
                                if (row3["is_finisher"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<is_finisher>" + row3["is_finisher"].ToString() + "</is_finisher>");
                                }
                                if (row3["is_gluer"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<is_gluer>" + row3["is_gluer"].ToString() + "</is_gluer>");
                                }
                                if (row3["is_strapper"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<is_strapper>" + row3["is_strapper"].ToString() + "</is_strapper>");
                                }
                                if (row3["is_slitter"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<is_slitter>" + row3["is_slitter"].ToString() + "</is_slitter>");
                                }
                                if (row3["sheet_length_mm"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<sheet_length_mm>" + row3["sheet_length_mm"].ToString() + "</sheet_length_mm>");
                                }
                                if (row3["sheet_width_mm"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<sheet_width_mm>" + row3["sheet_width_mm"].ToString() + "</sheet_width_mm>");
                                }
                                if (row3["number_up_length"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<number_up_length>" + row3["number_up_length"].ToString() + "</number_up_length>");
                                }
                                if (row3["number_up_width"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<number_up_width>" + row3["number_up_width"].ToString() + "</number_up_width>");
                                }

                                if (row3["crease_position_1"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<crease_position_1>" + row3["crease_position_1"].ToString() + "</crease_position_1>");
                                }
                                /*if (row3["crease_position_1"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<crease_position_1>" + row3["crease_position_1"].ToString() + "</crease_position_1>");
                                }*/
                                if (row3["crease_position_2"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<crease_position_2>" + row3["crease_position_2"].ToString() + "</crease_position_2>");
                                }
                                if (row3["crease_position_3"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<crease_position_3>" + row3["crease_position_3"].ToString() + "</crease_position_3>");
                                }
                                if (row3["crease_position_4"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<crease_position_4>" + row3["crease_position_4"].ToString() + "</crease_position_4>");
                                }
                                if (row3["crease_position_5"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<crease_position_5>" + row3["crease_position_5"].ToString() + "</crease_position_5>");
                                }
                                if (row3["crease_position_6"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<crease_position_6>" + row3["crease_position_6"].ToString() + "</crease_position_6>");
                                }
                                if (row3["crease_position_7"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<crease_position_7>" + row3["crease_position_7"].ToString() + "</crease_position_7>");
                                }
                                if (row3["crease_position_8"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<crease_position_8>" + row3["crease_position_8"].ToString() + "</crease_position_8>");
                                }
                                if (row3["crease_position_9"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<crease_position_9>" + row3["crease_position_9"].ToString() + "</crease_position_9>");
                                }
                                if (row3["crease_position_10"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<crease_position_10>" + row3["crease_position_10"].ToString() + "</crease_position_10>");
                                }
                                if (row3["crease_position_11"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<crease_position_11>" + row3["crease_position_11"].ToString() + "</crease_position_11>");
                                }
                                if (row3["crease_position_12"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<crease_position_12>" + row3["crease_position_12"].ToString() + "</crease_position_12>");
                                }
                                if (row3["crease_position_13"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<crease_position_13>" + row3["crease_position_13"].ToString() + "</crease_position_13>");
                                }
                                if (row3["crease_position_14"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<crease_position_14>" + row3["crease_position_14"].ToString() + "</crease_position_14>");
                                }
                                if (row3["crease_position_15"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<crease_position_15>" + row3["crease_position_15"].ToString() + "</crease_position_15>");
                                }
                                if (row3["crease_position_16"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<crease_position_16>" + row3["crease_position_16"].ToString() + "</crease_position_16>");
                                }
                                if (row3["crease_position_17"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<crease_position_17>" + row3["crease_position_17"].ToString() + "</crease_position_17>");
                                }
                                if (row3["crease_position_18"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<crease_position_18>" + row3["crease_position_18"].ToString() + "</crease_position_18>");
                                }
                                if (row3["crease_position_19"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<crease_position_19>" + row3["crease_position_19"].ToString() + "</crease_position_19>");
                                }
                                if (row3["crease_position_20"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<crease_position_20>" + row3["crease_position_20"].ToString() + "</crease_position_20>");
                                }
                                if (row3["sequence_no"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<sequence_no>" + row3["sequence_no"].ToString() + "</sequence_no>");
                                }
                                if (row3["product_step_comment"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<product_step_comment>" + Utility.ReplaceEscapeCharacter(row3["product_step_comment"].ToString()) + "</product_step_comment>");
                                }
                                XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["EndThirdSubHeaderStr1"]);
                                RowIndexwork_centres++;
                            }
                            XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["EndThirdSubHeaderStr"]);
                        }

                        if (DS.Tables[8].Rows.Count > 0)
                        {
                            int RowIndexContact = 1;
                            XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["StartFourthSubHeaderStr"]);
                            foreach (DataRow row4 in DS.Tables[8].Rows)
                            {
                                XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["StartFourthSubHeaderStr1"]);
                                XMLStringBuilder.AppendLine("<sequence_no>" + RowIndexContact.ToString() + "</sequence_no>");
                                if (row4["contact_type"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<type>" + Utility.ReplaceEscapeCharacter(row4["contact_type"].ToString()) + "</type>");
                                }
                                if (row4["contact_name"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<name>" + Utility.ReplaceEscapeCharacter(row4["contact_name"].ToString()) + "</name>");
                                }
                                if (row4["contact_phone"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<phone>" + Utility.ReplaceEscapeCharacter(row4["contact_phone"].ToString()) + "</phone>");
                                }
                                if (row4["contact_email"] != null)
                                {
                                    XMLStringBuilder.AppendLine("<email>" + Utility.ReplaceEscapeCharacter(row4["contact_email"].ToString()) + "</email>");
                                }

                                XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["EndFourthSubHeaderStr1"]);
                                RowIndexContact++;
                            }
                            XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["EndFourthSubHeaderStr"]);
                        }

                        if (TypeTransaction == "CREATE")
                        {
                            XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["MainHeaderCreateEndStr"]);
                        }
                        else if (TypeTransaction == "UPDATE")
                        {
                            XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["MainHeaderUpdateEndStr"]);
                        }
                        else if (TypeTransaction == "CANCEL")
                        {
                            XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["MainHeaderCancelEndStr"]);
                        }


                        //XMLStringBuilder.AppendLine(System.Configuration.ConfigurationManager.AppSettings["MainHeaderCreateEndStr"]);

                        xmlDoc.LoadXml(XMLStringBuilder.ToString());
                        if (TIM_Vendor_Code == "KIRKS")
                        {
                            xmlDoc.Save(System.Configuration.ConfigurationManager.AppSettings["StoreFilePathKIRKS"] + vendor_order_id.ToString() + "_" + TIM_Process_ID.ToString() + "_" + fileName.ToString() + ".xml");
                        }
                        else
                        {
                            xmlDoc.Save(System.Configuration.ConfigurationManager.AppSettings["StoreFilePathVendorName"] + vendor_order_id.ToString() + "_" + TIM_Process_ID.ToString() + "_" + fileName.ToString() + ".xml");
                        }
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

    }
}
