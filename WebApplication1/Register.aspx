<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WebApplication1.Register1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="form-horizontal">
            <div class="row">
                <br />
            </div>
            <div class="form-group">
                <div class="col-sm-10">
                    <h4>Register</h4>
                </div>
            </div>

            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="tbxUserName" CssClass="col-md-2 control-label" Text="Username"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="tbxUserName" CssClass="form-control" placeholder="UserName"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorUsername" CssClass="text-danger" Display="Dynamic"
                        ErrorMessage="Username field is required !" ControlToValidate="tbxUserName"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="tbxEmail" CssClass="col-md-2 control-label" Text="Email"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="tbxEmail" CssClass="form-control" TextMode="Email" placeholder="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorEmail" CssClass="text-danger" Display="Dynamic"
                        ErrorMessage="Email field is required !" ControlToValidate="tbxEmail"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="tbxPassword" CssClass="col-md-2 control-label" Text="Password"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="tbxPassword" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorPassword" CssClass="text-danger" Display="Dynamic"
                        ErrorMessage="Password field is required !" ControlToValidate="tbxPassword"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="tbxConfirmPassword" CssClass="col-md-2 control-label" Text="Confirm Password"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="tbxConfirmPassword" CssClass="form-control" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorConfirmPassword" CssClass="text-danger"
                        ErrorMessage="Confirm Password is required !" ControlToValidate="tbxConfirmPassword" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator runat="server" ID="CompareValidatorPassword" CssClass="text-danger" Operator="Equal" Display="Dynamic"
                        ErrorMessage="The Password doesn't match !" ControlToValidate="tbxConfirmPassword" ControlToCompare="tbxPassword"></asp:CompareValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="tbxPhone" CssClass="col-md-2 control-label" Text="Phone Number"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="tbxPhone" CssClass="form-control" TextMode="Phone" placeholder="Phone number"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorPhone" CssClass="text-danger" Display="Dynamic"
                        ErrorMessage="Phone field is required !" ControlToValidate="tbxPhone"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="tbxAddress" CssClass="col-md-2 control-label" Text="Address"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox runat="server" ID="tbxAddress" CssClass="form-control" placeholder="Address"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorAddress" CssClass="text-danger" Display="Dynamic"
                        ErrorMessage="Address field is required !" ControlToValidate="tbxAddress"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ddlCounty" CssClass="col-md-2 control-label" Text="County"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList runat="server" CssClass="form-control" ID="ddlCounty" placeholder="County" />
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidatorCounty" CssClass="text-danger" Display="Dynamic"
                        ErrorMessage="County field is required !" ControlToValidate="ddlCounty"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button runat="server" ID="btnRegister" Class="btn btn-success" Text="Register" OnClick="btnRegister_OnClick" />
                    <asp:Button runat="server" ID="btnCancel" CssClass="btn btn-info" Text="Cancel" PostBackUrl="/Home" CausesValidation="False" />
                    <asp:Label ID="lblMsg" runat="server" CssClass="text-danger"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" />
                </div>
            </div>
        </div>
    </div>






    <%--    <div class="center-page">
        
        <div class="row">
            <br />
        </div>
        <label class="col-xs-11">Username</label>
        <div class="col-xs-11">
            <asp:TextBox ID="tbUname" runat="server" Class="form-control" placeholder="Usename"></asp:TextBox>
        </div>
        <label class="col-xs-11">Password</label>
        <div class="col-xs-11">
            <asp:TextBox ID="tbPass" runat="server" Class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
        </div>

        <label class="col-xs-11">Confirm Password</label>
        <div class="col-xs-11">
            <asp:TextBox ID="tbCPass" runat="server" Class="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
        </div>

        <label class="col-xs-11">Name</label>
        <div class="col-xs-11">
            <asp:TextBox ID="tbName" runat="server" Class="form-control" placeholder="Name"></asp:TextBox>
        </div>

        <label class="col-xs-11">Email</label>
        <div class="col-xs-11">
            <asp:TextBox ID="tbEmail" runat="server" Class="form-control" placeholder="Email" TextMode="Email"></asp:TextBox>
        </div>

        <div class="col-xs-11 space-vert">
            <asp:Button ID="btSignup" runat="server" Class="btn btn-success" Text="Sign Up" OnClick="btSignup_Click" />
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>

    </div>--%>
</asp:Content>
