using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Visy.Middleware.Administration.Web
{
    public partial class OrderTracking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindGridView();                
                getUniqueColumns();
            }
        }

        private void getUniqueColumns() {
            DataTable dtUsers = (DataTable)ViewState["grdView"];
            var result = dtUsers.Select()
                .Where(r => r[4] != null)
                .Select(r => r[4])
                .GroupBy(id => id)
                    .OrderBy (id => id.Count())
                    .Select(g => new { Id = g.Key, Count = g.Count() }).OrderBy(p=>p.Id);
            
            ddlCustomers.DataSource = result;
            ddlCustomers.DataTextField = "id";
            ddlCustomers.DataBind();
        }

        protected void ddlCustomers_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataTable dtUsers = (DataTable)ViewState["fullGrdView"];
            DataView dvUsers = new DataView(dtUsers);
            dvUsers.RowFilter = "customer_name like '%" + ddlCustomers.Text + "%' ";                   
            grdView.DataSource = dvUsers;   
            grdView.DataBind();

            ViewState["grdView"] = dvUsers.ToTable();
        }

        protected void BindGridView() {
            grdView.DataSource = Visy.Middleware.Administration.Data.DataLookupHelper.GetOrderTrackingList();
            ViewState["grdView"] = grdView.DataSource;
            ViewState["fullGrdView"] = grdView.DataSource;
            grdView.DataBind();
        }

        protected void gridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdView.DataSource = ViewState["grdView"];          
            grdView.PageIndex = e.NewPageIndex;
            grdView.DataBind();
        }
        protected void gridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtUsers = (DataTable)ViewState["fullGrdView"];
            dtUsers.DefaultView.Sort = e.SortExpression;
            grdView.DataSource = dtUsers;
            grdView.DataBind();
        }
    }
}