<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="WebApplication1.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <hr />
        <div class="row">

            <div class="col-sm-12">
                <div class="well text-center" id="divSelectedProduct" runat="server">
                    <div class="text-right">
                        <asp:LinkButton runat="server" ID="lbnShippingCart" CssClass="btn btn-primary" OnClick="lbnShippingCart_OnClick">
                                <span class="glyphicon glyphicon-shopping-cart">Basket</span>
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
                            <asp:LinkButton runat="server" ID="lbnReset" CssClass="btn btn-success btnProduct" OnClick="lbnReset_OnClick">
                                <span class="glyphicon glyphicon-refresh"></span> Reset
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>

                <div class="panel panel-default form-horizontal well">
                    <div class="form-group">
                        <div class="col-sm-12" id="divSelectedCategory" runat="server">

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="panel panel-default form-horizontal well">

                    <div class="row">
                        <div class="col-md-6">
                            <asp:PlaceHolder runat="server" ID="PlaceHolder1"></asp:PlaceHolder>
                        </div>
                        <div class="col-md-6">
                            <asp:PlaceHolder runat="server" ID="PlaceHolder2"></asp:PlaceHolder>
                        </div>
                    </div>

                </div>
            </div>

            <div class="col-sm-3">
                <div class="panel panel-default form-horizontal well">
                    <div class="text-center">
                        <h4><label class="label label-info">Viewed Recently</label></h4>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:GridView runat="server" ID="grdMostView" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="ProductName" HeaderText="Product Name" ItemStyle-HorizontalAlign="Center" />
                                        <asp:BoundField DataField="ViewCounts" HeaderText="Counts" ItemStyle-HorizontalAlign="Center" />
                                    </Columns>
                                    <FooterStyle BackColor="#CCCC99" />
                                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                                    <RowStyle BackColor="#F7F7DE" />
                                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                                    <SortedAscendingHeaderStyle BackColor="#848384" />
                                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                                    <SortedDescendingHeaderStyle BackColor="#575357" />
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

