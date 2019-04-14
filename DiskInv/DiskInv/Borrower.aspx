<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Borrower.aspx.cs" Inherits="Borrower" %>


<%--/********************************************************************/
/*  Date	Name	Description                                 */
/*  --------------------------------------------------------------- */
/*                                                                  */
/*  4/13/2019  Matthew Pugel   Initial deployed. Program accepts input.    */
/********************************************************************/--%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceMain" Runat="Server">
    <div class="col-sm-8">
    Borrower's First Name: <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
     <asp:RequiredFieldValidator ID="rfvirstName" runat="server" 
      ControlToValidate="txtFirstName" text="First Name Required" CssClass="text-danger" Display="Dynamic">
     </asp:RequiredFieldValidator>
    <br />
    <br />
    </div>
    <div class="col-sm-8">
    Borrower&#39;s Last Name: <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
     <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
        ControlToValidate="txtLastName" text="Last Name Required" CssClass="text-danger" Display="Dynamic">
     </asp:RequiredFieldValidator>
    <br />
    <br /> </div>
     <div class="col-sm-8">
    Borrower&#39;s Phone Number: <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
     
                        <asp:RegularExpressionValidator ID="revPhone" runat="server" 
                            ControlToValidate="txtPhoneNumber" Text="Use this format: 999-999-9999"
                            Display="Dynamic" CssClass="text-danger" 
                            ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}">
                             </asp:RegularExpressionValidator>   
    <br />
    <br />
         </div>
          <div class="col-sm-8">
    <asp:Button ID="btnAdd" runat="server" Text="Add Borrower" OnClick="btnAdd_Click" />
    <asp:Label ID="lblmessage" runat="server" Text=""></asp:Label>
              </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceFooter" Runat="Server">
</asp:Content>

