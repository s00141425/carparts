﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="WebApplication1.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Index</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--    <div class="container">
        <h4>Index pages</h4>
    </div>--%>

    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <hr />
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                    </ol>

                    <div class="carousel-inner" role="listbox">
                        <div class="item active">
                            <img src="Images/01.jpg" alt="..." />
                            <div class="carousel-caption">
                                <h3>GTA 1</h3>
                                <p>Godfather Car</p>
                                <p><a class="btn btn-lg btn-primary btn-xs" href="Register.aspx" role="button">Join.Us.Today</a></p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="Images/02.jpg" alt="..." />
                            <div class="carousel-caption">
                                <h3>GTA 2</h3>
                                <p>Gangster Car</p>
                                <p><a class="btn btn-lg btn-success btn-xs" href="Register.aspx" role="button">Hurry.Up.To.Join</a></p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="Images/03.jpg" alt="..." />
                            <div class="carousel-caption">
                                <h3>GTA 3</h3>
                                <p>Mafia Wife's Car</p>
                                <p><a class="btn btn-lg btn-info btn-xs" href="Register.aspx" role="button">Buy.1.Get.1.Free</a></p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="Images/04.jpg" alt="..." />
                            <div class="carousel-caption">
                                <h3>GTA 4</h3>
                                <p>Auto Rickshaw</p>
                                <p><a class="btn btn-lg btn-warning btn-xs" href="Register.aspx" role="button">Hop.In.</a></p>
                            </div>
                        </div>
                        <div class="item">
                            <img src="Images/05.jpg" alt="..." />
                            <div class="carousel-caption">
                                <h3>WARNING</h3>
                                <p>Garda is watching you</p>
                                <p><a class="btn btn-lg btn-danger btn-xs" href="Register.aspx" role="button">We.Want.You!</a></p>
                            </div>
                        </div>
                    </div>

                    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
                <hr />
            </div>
            <hr />








            <!-- Blog Sidebar Widgets Column -->
            <div class="col-md-4">


                <div class="panel panel-default form-horizontal well">
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="ddlMaker" CssClass="col-sm-3 control-label">Maker</asp:Label>
                        <div class="col-sm-9">
                            <asp:DropDownList runat="server" ID="ddlMaker" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlMaker_OnSelectedIndexChanged" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="ddlModel" CssClass="col-sm-3 control-label">Model</asp:Label>
                        <div class="col-sm-9">
                            <asp:DropDownList runat="server" ID="ddlModel" CssClass="form-control" AutoPostBack="True" Enabled="False" OnSelectedIndexChanged="ddlModel_OnSelectedIndexChanged" />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="ddlYear" CssClass="col-sm-3 control-label">Year</asp:Label>
                        <div class="col-sm-9">
                            <asp:DropDownList runat="server" ID="ddlYear" CssClass="form-control" Enabled="False" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12 text-right">
                            <asp:LinkButton runat="server" ID="lbnSearch" CssClass="btn btn-success" OnClick="lbnSearch_OnClick">
                                <span class="glyphicon glyphicon-search"></span> Search
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>








                <%--<!-- Blog Search Well -->
                <div class="well">
                    <h4>Blog Search</h4>
                    <div class="input-group">
                        <input type="text" class="form-control" />
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button">
                                <span class="glyphicon glyphicon-search"></span>
                            </button>
                        </span>
                    </div>
                    <!-- /.input-group -->
                </div>--%>

                <!-- Blog Categories Well -->
                <div class="well">
                    <h4>Blog Categories</h4>
                    <div class="row">
                        <div class="col-lg-6">
                            <ul class="list-unstyled">
                                <li><a href="#">Category Name</a>
                                </li>
                                <li><a href="#">Category Name</a>
                                </li>
                                <li><a href="#">Category Name</a>
                                </li>
                                <li><a href="#">Category Name</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-6">
                            <ul class="list-unstyled">
                                <li><a href="#">Category Name</a>
                                </li>
                                <li><a href="#">Category Name</a>
                                </li>
                                <li><a href="#">Category Name</a>
                                </li>
                                <li><a href="#">Category Name</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- /.row -->
                </div>

                <!-- Side Widget Well -->
                <div class="well">
                    <h4>Side Widget Well</h4>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore, perspiciatis adipisci accusamus laudantium odit aliquam repellat tempore quos aspernatur vero.</p>
                </div>
            </div>
        </div>
    </div>

</asp:Content>