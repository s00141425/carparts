<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CategoryProduct.ascx.cs" Inherits="WebApplication1.CategoryProduct" %>

<div class="well">
    <asp:Image runat="server" ID="imgProduct" CssClass="img-responsive" />
    <p class="text-center">
        <asp:Label runat="server" ID="lblDesc"></asp:Label>
    </p>
    <div class="row">
        <div class="col-md-6">
            <asp:LinkButton runat="server" ID="lbnView" OnClick="lbnView_OnClick" Text="" CssClass="btn btn-warning btnProduct">
            <span class="glyphicon glyphicon-search"></span>View
            </asp:LinkButton>
        </div>
        <div class="col-md-6">
            <asp:LinkButton runat="server" ID="lblAdd" OnClick="lblAdd_OnClick" CssClass="btn btn-info btnProduct">
                <span class="glyphicon glyphicon-shopping-cart"></span>Adds
            </asp:LinkButton>
        </div>
    </div>
</div>