<%@ Page Title="Página principal" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Axel._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style1
        {
            width: 387px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <table style="width: 100%; background-color: #FFFFCC;">
        <tr>
            <td colspan="3" 
                style="text-align: center; font-size: xx-large; font-family: 'Angsana New'; font-weight: 700">
                Recopilatorio de canciones usando LINQ</td>
        </tr>
        <tr>
            <td class="style1" style="font-weight: 700">
                Create your own compilation of songs here!</td>
            <td>
                <asp:Button ID="btnAlbum" runat="server" style="font-family: 'Arial Black'" 
                    Text="Nuevo álbum" Width="152px" onclick="btnAlbum_Click1" />
            </td>
            <td style="font-weight: 700">
                The best program using LINQ</td>
        </tr>
        <tr>
            <td class="style1" style="font-weight: 700">
                Axel&#39;s songs are here!</td>
            <td>
                <asp:Button ID="btnCanciones" runat="server" 
                    style="font-family: 'Arial Black'; background-color: #FFFF00" 
                    Text="Nuevas canciones" Width="152px" onclick="btnCanciones_Click1" />
            </td>
            <td style="font-weight: 700">
                Visit our statistics
                <asp:LinkButton ID="lkConsulta" runat="server" onclick="lkConsulta_Click">here.</asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
