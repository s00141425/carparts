﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="WebApplication1.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <hr />
        <div class="row">
            <div class="col-sm-12">
                <div class="well text-center" id="divSelectedProduct" runat="server">
                    <div class="col-sm-12 text-right">
                        <asp:LinkButton runat="server" ID="lbnShippingCart" CssClass="btn btn-primary" OnClick="lbnShippingCart_OnClick">
                                <span class="glyphicon glyphicon-shopping-cart"></span>
                        </asp:LinkButton>
                    </div>
                </div>

            </div>
        </div>

        <div class="row">
            <div class="col-sm-3">

                <div class="panel panel-default form-horizontal well">
                    <div class="form-group">
                        <div class="col-sm-12">
                            <asp:DropDownList runat="server" ID="ddlCategorySelector" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlCategorySelector_OnSelectedIndexChanged" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12 text-right">
                            <asp:LinkButton runat="server" ID="lbnReset" CssClass="btn btn-success" OnClick="lbnReset_OnClick">
                                <span class="glyphicon glyphicon-refresh"></span> Reset
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
                
                <div class="panel panel-default form-horizontal well">
                    <div class="form-group">
                        <div class="col-sm-12" id="divSelectedCategory" runat="server">

                            <%--<asp:Label runat="server" CssClass="form-control">Engine</asp:Label>
                            <asp:Label runat="server" CssClass="form-control">Exhuast</asp:Label>--%>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="panel panel-default form-horizontal well">
                    <div class="text-center">
                    </div>
                </div>
            </div>

            <div class="col-sm-3">
                <div class="panel panel-default form-horizontal well">
                    <div class="text-center">
                        Viewed Recently
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
