using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Visy.Middleware.Administration.Web
{
    public partial class PDFOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!this.IsPostBack)
            //    BindGrid();

        }
        private void BindGrid() {
            grdView.DataSource = Visy.Middleware.Administration.Data.DataLookupHelper.GetPDFOrders();
            grdView.DataBind();
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
           

        }

        //protected void GrdView_SelectedIndexChanged(object sender, GridViewPageEventArgs e)
        //{
        //    grdView.PageIndex = e.NewPageIndex;
        //    grdView.DataSource = grdView.DataSource = Visy.Middleware.Administration.Data.DataLookupHelper.GetPDFOrders();
        //    grdView.DataBind();
        //}

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void grdView_SelectedIndexChanged(object sender, EventArgs e)
        {           
            txtEmailId.Text = grdView.SelectedRow.Cells[2].Text;
            txtCustomerCode.Text = grdView.SelectedRow.Cells[3].Text;
            txtCustomerName.Text = grdView.SelectedRow.Cells[4].Text;
            txtUnitPriceFactor.Text = grdView.SelectedRow.Cells[5].Text;
            txtCustomerEAN.Text = grdView.SelectedRow.Cells[6].Text;
            //btnDelete.Visible = true;
            mp2.Show();
            //string message = "Selected Item: ";
            //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", "alert('" + message + "');", true);
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            Clear();
            mp2.Show();
            //btnDelete.Visible = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (grdView.SelectedRow!=null)
                Visy.Middleware.Administration.Data.DataLookupHelper.SavePDFOrders(grdView.SelectedRow.Cells[1].Text, txtEmailId.Text, txtCustomerCode.Text, txtCustomerName.Text, txtUnitPriceFactor.Text, txtCustomerEAN.Text, "edbangs");
            else
                Visy.Middleware.Administration.Data.DataLookupHelper.SavePDFOrders("0", txtEmailId.Text, txtCustomerCode.Text, txtCustomerName.Text, txtUnitPriceFactor.Text, txtCustomerEAN.Text, "edbangs");
            Clear();
            grdView.DataBind();
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            var btn = (LinkButton)(sender);
            
            Visy.Middleware.Administration.Data.DataLookupHelper.DeletePDFOrder(btn.CommandArgument, "");
            Clear();
            grdView.DataBind();
        }

        private void Clear() {
            txtEmailId.Text = string.Empty;
            txtCustomerCode.Text = string.Empty;
            txtCustomerName.Text = string.Empty;
            txtUnitPriceFactor.Text = string.Empty;
            txtCustomerEAN.Text = string.Empty;
            //btnDelete.Visible = false;
        }
    }
}