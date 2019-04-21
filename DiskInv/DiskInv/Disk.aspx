<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Disk.aspx.cs" Inherits="Disk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceMain" Runat="Server">
   
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="disk_id" DataSourceID="SqlDataSource1" InsertItemPosition="LastItem">
        <AlternatingItemTemplate>
            <tr style="background-color: #FFFFFF;color: #284775;">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                </td>
                <td>
                    <asp:Label ID="disk_idLabel" runat="server" Text='<%# Eval("disk_id") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_nameLabel" runat="server" Text='<%# Eval("disk_name") %>' />
                </td>
                <td>
                    <asp:Label ID="releaseDateLabel" runat="server" Text='<%# Eval("releaseDate") %>' />
                </td>
                <td>
                    <asp:Label ID="genre_idLabel" runat="server" Text='<%# Eval("genre_id") %>' />
                </td>
                <td>
                    <asp:Label ID="status_idLabel" runat="server" Text='<%# Eval("status_id") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_type_idLabel" runat="server" Text='<%# Eval("disk_type_id") %>' />
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
                    <asp:Label ID="disk_idLabel1" runat="server" Text='<%# Eval("disk_id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="disk_nameTextBox" runat="server" Text='<%# Bind("disk_name") %>' />
                </td>
                <td>
                    <asp:TextBox ID="releaseDateTextBox" runat="server" Text='<%# Bind("releaseDate") %>' />
                </td>
                <td>
                    <asp:TextBox ID="genre_idTextBox" runat="server" Text='<%# Bind("genre_id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="status_idTextBox" runat="server" Text='<%# Bind("status_id") %>' />
                </td>
                <td>
                    <asp:TextBox ID="disk_type_idTextBox" runat="server" Text='<%# Bind("disk_type_id") %>' />
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
                    <asp:TextBox ID="disk_nameTextBox" runat="server" Text='<%# Bind("disk_name") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Enter Name of Disk" CssClass="text-danger" ControlToValidate="disk_nameTextBox" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    
                </td>
                <td>
                    <asp:TextBox ID="releaseDateTextBox" runat="server" Text='<%# Bind("releaseDate") %>' />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Enter the Day/Month/Year" CssClass="text-danger" ControlToValidate="releaseDateTextBox" ValidationGroup="Insert"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" CssClass="text-danger"
                    ControlToValidate="releaseDateTextBox" ValidationGroup="Insert" ErrorMessage="Date format in DD/MM/YYYY"
                    ValidationExpression="^(0[1-9]|1[012])[-/.](0[1-9]|[12][0-9]|3[01])[-/.](19|20)\d\d$"></asp:RegularExpressionValidator>
                </td>
                <td>
                  
                     <asp:DropDownList ID="ddlgenre_id" 
                        DataSourceID="SqlDataSource2"
                        DataTextField="description" DataValueField="genre_id"
                        SelectedValue='<%# Bind("genre_id") %>'
                        runat="server"></asp:DropDownList>
                </td>
                <td>
                   
                     <asp:DropDownList ID="ddlstatus_id" 
                        DataSourceID="SqlDataSource3"
                        DataTextField="description" DataValueField="status_id"
                        SelectedValue='<%# Bind("status_id") %>'
                        runat="server"></asp:DropDownList>
                </td>
                <td>
                   
                     <asp:DropDownList ID="DropDownList2" 
                        DataSourceID="SqlDataSource4"
                        DataTextField="description" DataValueField="disk_type_id"
                        SelectedValue='<%# Bind("disk_type_id") %>'
                        runat="server"></asp:DropDownList>
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
                    <asp:Label ID="disk_idLabel" runat="server" Text='<%# Eval("disk_id") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_nameLabel" runat="server" Text='<%# Eval("disk_name") %>' />
                </td>
                <td>
                    <asp:Label ID="releaseDateLabel" runat="server" Text='<%# Eval("releaseDate") %>' />
                </td>
                <td>
                    <asp:Label ID="genre_idLabel" runat="server" Text='<%# Eval("genre_id") %>' />
                </td>
                <td>
                    <asp:Label ID="status_idLabel" runat="server" Text='<%# Eval("status_id") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_type_idLabel" runat="server" Text='<%# Eval("disk_type_id") %>' />
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
                                <th runat="server">disk_id</th>
                                <th runat="server">disk_name</th>
                                <th runat="server">releaseDate</th>
                                <th runat="server">genre_id</th>
                                <th runat="server">status_id</th>
                                <th runat="server">disk_type_id</th>
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
                    <asp:Label ID="disk_idLabel" runat="server" Text='<%# Eval("disk_id") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_nameLabel" runat="server" Text='<%# Eval("disk_name") %>' />
                </td>
                <td>
                    <asp:Label ID="releaseDateLabel" runat="server" Text='<%# Eval("releaseDate") %>' />
                </td>
                <td>
                    <asp:Label ID="genre_idLabel" runat="server" Text='<%# Eval("genre_id") %>' />
                </td>
                <td>
                    <asp:Label ID="status_idLabel" runat="server" Text='<%# Eval("status_id") %>' />
                </td>
                <td>
                    <asp:Label ID="disk_type_idLabel" runat="server" Text='<%# Eval("disk_type_id") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>" 
        DeleteCommand="EXECUTE del_disk @disk_id" 
        InsertCommand="EXECUTE ins_disk @disk_name, @releaseDate, @genre_id, @status_id, @disk_type_id" 
        SelectCommand="SELECT * FROM [disk] ORDER BY [disk_name]" 
        UpdateCommand="EXECUTE upd_disk  @disk_id, @disk_name, @releaseDate, @genre_id, @status_id, @disk_type_id">
        <DeleteParameters>
            <asp:Parameter Name="disk_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="disk_name" Type="String" />
            <asp:Parameter Name="releaseDate" Type="DateTime" />
            <asp:Parameter Name="genre_id" Type="Int32" />
            <asp:Parameter Name="status_id" Type="Int32" />
            <asp:Parameter Name="disk_type_id" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="disk_name" Type="String" />
            <asp:Parameter Name="releaseDate" Type="DateTime" />
            <asp:Parameter Name="genre_id" Type="Int32" />
            <asp:Parameter Name="status_id" Type="Int32" />
            <asp:Parameter Name="disk_type_id" Type="Int32" />
            <asp:Parameter Name="disk_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
   <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>"
        SelectCommand="SELECT [genre_id], [description] FROM [genre]
        ORDER BY [description]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>"
        SelectCommand="SELECT [status_id], [description] FROM [status]
        ORDER BY [description]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:disk_inventoryConnectionString %>"
        SelectCommand="SELECT [disk_type_id], [description] FROM [disk_type]
        ORDER BY [description]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceFooter" Runat="Server">
</asp:Content>

