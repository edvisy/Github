<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MiddlewareAdmin.Master" CodeBehind="PDFOrders.aspx.cs" Inherits="Visy.Middleware.Administration.Web.PDFOrders" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div style="font-family:Arial; font-size:12px;">
          
            <asp:GridView ID="grdView" runat="server" BackColor="White" AllowPaging="True" PageSize="30" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    AllowSorting="True" DataSourceID="PDFOrdersGet" AutoGenerateColumns="False" OnSelectedIndexChanged="grdView_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                     <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID">
                    <ItemStyle Width="20px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="from_email" HeaderText="From Email" SortExpression="from_email">
                    <ItemStyle Width="250px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="customer_code" HeaderText="Customer Code" SortExpression="customer_code">
                    <ItemStyle Width="200px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="customer_name" HeaderText="Customer Name" SortExpression="customer_name">
                    <ItemStyle Width="350px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="unit_price_factor" HeaderText="Unit Price Factor">
                    <ItemStyle Width="150px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="customer_ean" HeaderText="Customer EAN" SortExpression="customer_ean">
                    <ItemStyle Width="150px" />
                    </asp:BoundField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID = "lnkDelete" CommandArgument = '<%# Eval("from_email") %>' OnClick = "btnDelete_Click" runat = "server" Text = "Delete"></asp:LinkButton>
                            <cc1:ConfirmButtonExtender ID="cbe" runat="server" DisplayModalPopupID="mpe" TargetControlID="lnkDelete">
                            </cc1:ConfirmButtonExtender>
                            <cc1:ModalPopupExtender ID="mpe" runat="server" PopupControlID="pnlPopup" TargetControlID="lnkDelete" OkControlID = "btnYes"
                                CancelControlID="btnNo" BackgroundCssClass="modalBackground">
                            </cc1:ModalPopupExtender>
                            <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none">
                                <div class="header">
                                    Confirmation
                                </div>
                                <div class="body">
                                    Do you want to delete this customer?
                                </div>
                                <div class="footer" align="right">
                                    <asp:Button ID="btnYes" runat="server" Text="Yes" />
                                    <asp:Button ID="btnNo" runat="server" Text="No" />
                                </div>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>              
            <asp:ObjectDataSource ID="PDFOrdersGet" runat="server" SelectMethod="GetPDFOrders" TypeName="Visy.Middleware.Administration.Data.DataLookupHelper"></asp:ObjectDataSource>
            <br />
            <asp:Button ID="btnCreate" runat="server" Text="Create" OnClick="btnCreate_Click" />
        </div>
    <asp:LinkButton Text="" ID = "lnkFake" runat="server" />
   
    <cc1:ToolkitScriptManager runat="server">
    </cc1:ToolkitScriptManager>  
    <!-- ModalPopupExtender -->
    <cc1:ModalPopupExtender ID="mp2" runat="server" PopupControlID="Panel1" TargetControlID="lnkFake"
        CancelControlID="btnClose" BackgroundCssClass="modalBackground" ></cc1:ModalPopupExtender>
    
    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" Style="display: none">
        <div style="width:400px">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                  <table>
                      <tr>
                          <td>Email ID</td>
                          <td> <asp:TextBox Width="230px" ID="txtEmailId" runat="server"></asp:TextBox></td>
                      </tr>
                      <tr>
                          <td>Customer Code</td>
                          <td>
                              <asp:TextBox ID="txtCustomerCode" Width="230px" runat="server"></asp:TextBox></td>
                      </tr>
                      <tr>
                          <td>Customer name</td>
                          <td> <asp:TextBox TextMode="MultiLine" ID="txtCustomerName" Width="230px" runat="server"></asp:TextBox></td>
                      </tr>
                      <tr>
                          <td>Unit Price Factor</td>
                          <td>
                               
                              <asp:TextBox ID="txtUnitPriceFactor" Width="230px" runat="server" MaxLength="5"></asp:TextBox>
                              <cc1:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Numbers"
                                    TargetControlID="txtUnitPriceFactor" />
                          </td>
                      </tr>
                      <tr>
                          <td>Customer EAN</td>
                          <td> <asp:TextBox ID="txtCustomerEAN" Width="230px" runat="server"></asp:TextBox></td>
                      </tr>
                      <tr>
                          <td><asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" /></td>
                          <td>
                             <%-- <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" Visible="false" />--%>
                              <asp:Button ID="btnClose" runat="server" Text="Close" />
                          </td>
                      </tr>                     
                  </table>
                </ContentTemplate>
              
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnSave" />
                    <%--<asp:PostBackTrigger ControlID="btnDelete" />    --%>               
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>    
 </asp:Content>



