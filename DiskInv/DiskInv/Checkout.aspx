<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceMain" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Select A Disc"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceFooter" Runat="Server">
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="disk_name" DataValueField="disk_id">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>" SelectCommand="SELECT [disk_id], disk_name FROM [disk]"></asp:SqlDataSource>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Select A Borrower"></asp:Label>
    <br />
    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="fname" DataValueField="borrower_id">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>" SelectCommand="SELECT [borrower_id], fname, lname FROM [borrower]"></asp:SqlDataSource>
    <br />
<asp:Label ID="Label3" runat="server" Text="Checkout Date"></asp:Label>
<br />
<asp:TextBox ID="TextBox1" runat="server" TextMode="Date"></asp:TextBox>
<br />
<br />
    <br />
<asp:Button ID="Button1" runat="server" Text="Checkout" OnClick="Button1_Click" />
</asp:Content>

