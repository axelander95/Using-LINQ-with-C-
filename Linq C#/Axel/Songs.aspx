<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Songs.aspx.cs" Inherits="Axel.Songs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .style1
    {
        height: 21px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
    <tr>
        <td colspan="3" 
            style="text-align: center; font-size: xx-large; font-family: 'Arabic Typesetting'; font-weight: 700">
            Axel&#39;s songs</td>
    </tr>
    <tr>
        <td colspan="3" style="text-align: center">
            Add all album&#39;s songs. A lot of music is waiting for you.</td>
    </tr>
    <tr>
        <td>
            Code:</td>
        <td>
            <asp:TextBox ID="txtCodigo" runat="server" Enabled="False" MaxLength="10"></asp:TextBox>
        </td>
        <td style="font-weight: 700; text-align: center">
            Songs</td>
    </tr>
    <tr>
        <td>
            Album:</td>
        <td>
            <asp:DropDownList ID="ddlAbum" runat="server" onload="ddlAbum_Load">
            </asp:DropDownList>
        </td>
        <td rowspan="3" style="text-align: center">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                CellPadding="3" onload="GridView1_Load" 
                onrowcommand="GridView1_RowCommand">
                <Columns>
                    <asp:ButtonField CommandName="M" HeaderText="Modify" Text="Modify" />
                    <asp:BoundField DataField="cod_cancion" HeaderText="Código" />
                    <asp:BoundField DataField="cod_album" HeaderText="Album" />
                    <asp:BoundField DataField="nombre" HeaderText="Name of song" />
                    <asp:BoundField DataField="cantantes" HeaderText="Singer(s)" />
                    <asp:ButtonField CommandName="E" HeaderText="Delete" Text="Delete" />
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
        </td>
    </tr>
    <tr>
        <td>
            Name:</td>
        <td>
            <asp:TextBox ID="txtNombre" runat="server" MaxLength="50"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Singer(s):</td>
        <td>
            <asp:TextBox ID="txtCantantes" runat="server" MaxLength="50"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style1" colspan="3" style="text-align: center">
            <asp:Label ID="lblMensaje" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style1" colspan="3" style="text-align: center">
            <asp:Button ID="btnAceptar" runat="server" Text="Accept" Width="63px" 
                onclick="btnAceptar_Click" />
&nbsp;
            <asp:Button ID="btnClean" runat="server" Text="Clean" Width="63px" 
                onclick="btnClean_Click" />
        </td>
    </tr>
</table>
</asp:Content>
