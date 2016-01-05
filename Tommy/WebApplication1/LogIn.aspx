<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LogIn.aspx.cs" Inherits="WebApplication1.LogIn" %>

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
                    <h4>Log In</h4>
                </div>
            </div>
            <div class="form-group">
                <asp:Label AssociatedControlID="txtUserName" runat="server" CssClass="col-md-2 control-label" Text="User Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server" placeholder="User Name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ErrorMessage="Username is required!"
                        Display="Dynamic" ControlToValidate="txtUserName" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label AssociatedControlID="txtPassword" runat="server" CssClass="col-md-2 control-label" Text="Password"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" CssClass="text-danger" runat="server" ErrorMessage="The Password field is Required !" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:CheckBox ID="chkBoxRememberMe" runat="server" />
                    <asp:Label AssociatedControlID="chkBoxRememberMe" runat="server" CssClass="control-label" Text="Remember me?"></asp:Label>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Button ID="btnLogin" runat="server" Text="Log In" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
                    <asp:LinkButton ID="LinkRegister" runat="server" PostBackUrl="/Register" Text="Register" CssClass="btn btn-info" CausesValidation="False"></asp:LinkButton>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-2"></div>
                <div class="col-md-6">
                    <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
