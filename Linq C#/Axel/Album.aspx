<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Album.aspx.cs" Inherits="Axel.Album" %>
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
            style="font-weight: 700; font-size: xx-large; font-family: 'Angsana New'; text-align: center">
            Add new albums here.</td>
    </tr>
    <tr>
        <td class="style1" colspan="3" style="text-align: center">
            Great songs are coming right now, add new albums and take a trip visiting our 
            webpage.</td>
    </tr>
    <tr>
        <td>
            Code:</td>
        <td>
            <asp:TextBox ID="txtCodigo" runat="server" Enabled="False" MaxLength="100"></asp:TextBox>
&nbsp;</td>
        <td style="font-weight: 700; text-align: center">
            Albums</td>
    </tr>
    <tr>
        <td>
            Name:</td>
        <td>
            <asp:TextBox ID="txtNombre" runat="server" MaxLength="50"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="rfvNombre" runat="server" 
                ControlToValidate="txtNombre" ErrorMessage="*Se requiere el nombre del álbum." 
                ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
        <td rowspan="3" style="text-align: center">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" 
                CellPadding="3" CellSpacing="1" GridLines="None" onload="GridView1_Load" 
                onrowcommand="GridView1_RowCommand">
                <Columns>
                    <asp:ButtonField CommandName="M" HeaderText="Modify" Text="Modify" />
                    <asp:BoundField DataField="cod_album" HeaderText="Code" />
                    <asp:BoundField DataField="nombre" HeaderText="Name" />
                    <asp:BoundField DataField="año" HeaderText="Year" />
                    <asp:BoundField DataField="descripcion" HeaderText="Description" />
                    <asp:ButtonField CommandName="E" HeaderText="Delete" Text="Delete" />
                </Columns>
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#594B9C" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#33276A" />
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
            Year:</td>
        <td>
            <asp:TextBox ID="txtAño" runat="server" MaxLength="4"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="rfvNombre0" runat="server" ControlToValidate="txtAño" 
                ErrorMessage="*Se requiere el año de producción." ForeColor="Red"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            Description:</td>
        <td>
            <asp:TextBox ID="txtDescripcion" runat="server" MaxLength="50"></asp:TextBox>
&nbsp;(opcional).</td>
    </tr>
    <tr>
        <td colspan="3" style="text-align: center">
            <asp:Label ID="lblMensaje" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="text-align: center">
            <asp:Button ID="btnProcesar" runat="server" Text="Ok" Width="58px" 
                onclick="btnProcesar_Click" />
&nbsp;&nbsp;
            <asp:Button ID="btnLimpiar" runat="server" CausesValidation="False" 
                Text="Clean" Width="58px" onclick="btnLimpiar_Click" />
        </td>
    </tr>
</table>
</asp:Content>
