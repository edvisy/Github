<%@ Page Title="" Language="C#" MasterPageFile="~/MiddlewareAdmin.Master" AutoEventWireup="true" CodeBehind="OrderTracking.aspx.cs" Inherits="Visy.Middleware.Administration.Web.OrderTracking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p></p>
    <div>
        <asp:DropDownList ID="ddlCustomers" runat="server" OnSelectedIndexChanged="ddlCustomers_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>
    </div>
    <p></p>
    <div style="font-family:Arial; font-size:12px;">
          
            <asp:GridView ID="grdView" runat="server" BackColor="White" AllowPaging="True" PageSize="50" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    AllowSorting="True" AutoGenerateColumns="False" OnPageIndexChanging="gridView_PageIndexChanging" Font-Size="8pt" OnSorting="gridView_Sorting">
                <Columns>
                    <asp:BoundField DataField="po_number" HeaderText="PO Number" SortExpression="po_number">
                    <ItemStyle Width="200px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="biztalk_id" HeaderText="Reference ID" SortExpression="biztalk_id">
                    <ItemStyle Width="300px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="customer_code" HeaderText="Customer Code" SortExpression="customer_code">
                    <ItemStyle Width="150px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="created_date" HeaderText="Created Date" SortExpression="created_date">
                    <ItemStyle Width="150px" />
                    </asp:BoundField>    
                    <asp:BoundField DataField="customer_name" HeaderText="Customer Name">
                    <ItemStyle Width="150px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="order_status" HeaderText="Order Status" SortExpression="order_status">
                    <ItemStyle Width="200px" />
                    </asp:BoundField>                  
                    <asp:HyperLinkField DataNavigateUrlFields="archive_path" DataNavigateUrlFormatString="~/DownloadHandler.ashx?filename={0}&path=LGXArchivePath" HeaderText="Order XML" Text="Download" Target="_blank" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" Font-Size="10pt" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>              
            <%--<asp:ObjectDataSource ID="GetOrderTrackingList" runat="server" SelectMethod="GetOrderTrackingList" TypeName="Visy.Middleware.Administration.Data.DataLookupHelper"></asp:ObjectDataSource>--%>           
        </div>
</asp:Content>
