<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Borrower.aspx.cs" Inherits="Borrower" %>


<%--/********************************************************************/
/*  Date	Name	Description                                 */
/*  --------------------------------------------------------------- */
/*                                                                  */
/*  4/19/2019  Matthew Pugel   Initial deployed. Program accepts input.    */
/********************************************************************/--%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceMain" Runat="Server">
    
        <br />
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="borrower_id" 
            DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
            <AlternatingItemTemplate>
                <tr style="background-color: #FFFFFF;color: #284775;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="borrower_idLabel" runat="server" Text='<%# Eval("borrower_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="fnameLabel" runat="server" Text='<%# Eval("fname") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lnameLabel" runat="server" Text='<%# Eval("lname") %>' />
                    </td>
                    <td>
                        <asp:Label ID="phone_numbLabel" runat="server" Text='<%# Eval("phone_numb") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color: #999999;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="borrower_idLabel1" runat="server" Text='<%# Eval("borrower_id") %>' />
                        
                    </td>
                    <td>
                        <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' />
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ErrorMessage="RequiredFieldValidator" 
                            ValidationGroup="Edit" ControlToValidate="fnameTextBox" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ErrorMessage="RequiredFieldValidator" 
                            ValidationGroup="Edit" ControlToValidate="lnameTextBox" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="phone_numbTextBox" runat="server" Text='<%# Bind("phone_numb") %>' />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ErrorMessage="RegularExpressionValidator" ValidationGroup="Edit" ControlToValidate="phone_numbTextBox" EnableTheming="False" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" ValidationGroup="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="First Name required" ControlToValidate="fnameTextBox" CssClass="text-danger" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                        
                    </td>
                    <td>
                        <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ErrorMessage="Last Name Required" CssClass="text-danger" ControlToValidate="lnameTextBox" ValidationGroup="Insert"></asp:RequiredFieldValidator>
 
                    </td>
                    <td>
                        <asp:TextBox ID="phone_numbTextBox" runat="server" Text='<%# Bind("phone_numb") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Phone Number Required" CssClass="text-danger" ControlToValidate="phone_numbTextBox" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ErrorMessage="Use this format 999-999-9999" ControlToValidate="phone_numbTextBox"  CssClass="text-danger" ValidationGroup="Insert" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
     
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color: #E0FFFF;color: #333333;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="borrower_idLabel" runat="server" Text='<%# Eval("borrower_id") %>' />

                    </td>
                    <td>
                        <asp:Label ID="fnameLabel" runat="server" Text='<%# Eval("fname") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lnameLabel" runat="server" Text='<%# Eval("lname") %>' />
                    </td>
                    <td>
                        <asp:Label ID="phone_numbLabel" runat="server" Text='<%# Eval("phone_numb") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color: #E0FFFF;color: #333333;">
                                    <th runat="server"></th>
                                    <th runat="server">Borrower ID</th>
                                    <th runat="server">First Name</th>
                                    <th runat="server">Last Name</th>
                                    <th runat="server">Phone Number</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color: #E2DED6;font-weight: bold;color: #333333;">
                    <td>
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                    </td>
                    <td>
                        <asp:Label ID="borrower_idLabel" runat="server" Text='<%# Eval("borrower_id") %>' />
                    </td>
                    <td>
                        <asp:Label ID="fnameLabel" runat="server" Text='<%# Eval("fname") %>' />
                    </td>
                    <td>
                        <asp:Label ID="lnameLabel" runat="server" Text='<%# Eval("lname") %>' />
                    </td>
                    <td>
                        <asp:Label ID="phone_numbLabel" runat="server" Text='<%# Eval("phone_numb") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>" 
            DeleteCommand="EXECUTE del_borrower @borrower_id" 
            InsertCommand="EXECUTE ins_borrower @fname, @lname, @phone_numb" 
            SelectCommand="SELECT * FROM [borrower] ORDER BY [lname]" 
            UpdateCommand="EXECUTE upd_borrower @borrower_id, @fname, @lname, @phone_numb ">
            <DeleteParameters>
                <asp:Parameter Name="borrower_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="fname" Type="String" />
                <asp:Parameter Name="lname" Type="String" />
                <asp:Parameter Name="phone_numb" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="fname" Type="String" />
                <asp:Parameter Name="lname" Type="String" />
                <asp:Parameter Name="phone_numb" Type="String" />
                <asp:Parameter Name="borrower_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
  
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceFooter" Runat="Server">
</asp:Content>

