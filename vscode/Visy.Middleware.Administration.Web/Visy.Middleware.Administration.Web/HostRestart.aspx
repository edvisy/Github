<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MiddlewareAdmin.Master" CodeBehind="HostRestart.aspx.cs" Inherits="Visy.Middleware.Administration.Web.HostRestart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <table>
            <tr>
                <td>
                <asp:DropDownList ID="ddApplicationList" runat="server">
                    <asp:ListItem>SAP</asp:ListItem>
                    <asp:ListItem>LGX</asp:ListItem>
                    <asp:ListItem>Manhattan</asp:ListItem>
                    <asp:ListItem>AS2</asp:ListItem>
                </asp:DropDownList>
                    </td>
                 <td> <asp:Button ID="btnExec" runat="server" Text="Start" OnClick="btnExec_Click" /> </td>

                <td><asp:Button ID="btnStop" runat="server" Text="Stop" OnClick="btnExec_Click_Stop" /></td>
           
            </tr>
          
        </table>
        <p></p>
        <div style="font-family:Arial; font-size:12px;">
          
            <asp:GridView ID="grdView" runat="server" BackColor="White" OnRowDataBound="grdView_RowDataBound" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
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
        </div>    

</asp:Content>