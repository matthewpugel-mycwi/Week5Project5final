<%--/********************************************************************/
/*  Date	Name	Description                                 */
/*  --------------------------------------------------------------- */
/*                                                                  */
/*  5/2/2019  Matthew Pugel   Initial deployed. Program accepts input. Checked Out items are not displayed    */
/********************************************************************/--%>
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceMain" Runat="Server">
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="476px" Width="1139px">
                 <Columns>
                     <asp:BoundField DataField="disk_name" HeaderText="disk_name" SortExpression="disk_name" />
                     <asp:BoundField DataField="fname" HeaderText="fname" SortExpression="fname" />
                     <asp:BoundField DataField="lname" HeaderText="lname" SortExpression="lname" />
                     <asp:BoundField DataField="borrowed_date" HeaderText="borrowed_date" SortExpression="borrowed_date" />
                     <asp:BoundField DataField="returned_date" HeaderText="returned_date" SortExpression="returned_date" />
                 </Columns>
             </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>" 
                 SelectCommand="SELECT [disk].disk_name, borrower.fname, borrower.lname, diskHasBorrower.borrowed_date, diskHasBorrower.returned_date FROM diskHasBorrower INNER JOIN [disk] ON diskHasBorrower.disk_id = [disk].disk_id INNER JOIN borrower ON diskHasBorrower.borrower_id = borrower.borrower_id WHERE (diskHasBorrower.returned_date IS NOT NULL)"></asp:SqlDataSource>
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceFooter" Runat="Server">
</asp:Content>

