<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="keywords" content="admin, dashboard, bootstrap, template, flat, modern, theme, responsive, fluid, retina, backend, html5, css, css3">
  <meta name="description" content="">
  <meta name="author" content="ThemeBucket">
  <link rel="shortcut icon" href="#" type="image/png">

  <title>学生就业管理信息系统</title>

  <!--icheck-->
  <link href="${basePath}/js/iCheck/skins/minimal/minimal.css" rel="stylesheet">
  <link href="${basePath}/js/iCheck/skins/square/square.css" rel="stylesheet">
  <link href="${basePath}/js/iCheck/skins/square/red.css" rel="stylesheet">
  <link href="${basePath}/js/iCheck/skins/square/blue.css" rel="stylesheet">

  <!--dashboard calendar-->
  <link href="${basePath}/css/clndr.css" rel="stylesheet">

  <!--Morris Chart CSS -->
  <link rel="stylesheet" href="${basePath}/js/morris-chart/morris.css">

  <!--common-->
  <link href="${basePath}/css/style.css" rel="stylesheet">
  <link href="${basePath}/css/style-responsive.css" rel="stylesheet">
</head>

<body class="sticky-header">

<section>
    <!-- left side start-->
    <div class="left-side sticky-left-side">

        <!--logo and iconic logo start-->
        <div class="logo">
            <a ><img src="${basePath}/css/images/logo.png" alt=""></a>
        </div>

        <div class="logo-icon text-center">
            <a ><img src="${basePath}/css/images/logo_icon.png" alt=""></a>
        </div>
        <!--logo and iconic logo end-->

        <div class="left-side-inner">

            <!-- visible to small devices only -->
            <div class="visible-xs hidden-sm hidden-md hidden-lg">
                <div class="media logged-user">
                    <img alt="" src="${basePath}/css/images/photos/user-avatar.png" class="media-object">
                    <div class="media-body">
                        <h4><a href="#">John Doe</a></h4>
                        <span>"Hello There..."</span>
                    </div>
                </div>

                <h5 class="left-nav-title">Account Information</h5>
                <ul class="nav nav-pills nav-stacked custom-nav">
                  <li><a href="#"><i class="fa fa-user"></i> <span>Profile</span></a></li>
                  <li><a href="#"><i class="fa fa-cog"></i> <span>Settings</span></a></li>
                  <li><a href="#"><i class="fa fa-sign-out"></i> <span>Sign Out</span></a></li>
                </ul>
            </div>

            <!--sidebar nav start-->
            
            <%@ include file="urlList.jsp"%>
            <!--sidebar nav end-->

        </div>
    </div>
    <!-- left side end-->
    
    <!-- main content start-->
    <div class="main-content" >

        <!-- header section start-->
        <div class="header-section">

            <!--toggle button start-->
            <a class="toggle-btn"><i class="fa fa-bars"></i></a>
            <!--toggle button end-->

            <!--notification menu start -->
            <div class="menu-right">
                <ul class="notification-menu">
                    <li>
                        <a href="#" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                          	  欢迎您！<span style="color:red">${sessionScope.auser.tname }</span>
                        </a>
                    </li>

                </ul>
            </div>
            <!--notification menu end -->

        </div>
        <!-- header section end-->

        <!-- page heading start-->
        <div class="page-heading">
            <h3>
                欢迎来到  学生就业管理信息系统！
            </h3>
            <ul class="breadcrumb">
                <li class="active">本团队为您倾情打造 </li>
            </ul>
        </div>
        <!-- page heading end-->

        <!--body wrapper start-->
        <div class="wrapper" >
            <div class="row" >
                <div class="col-md-12">
                    <!--statistics start-->
                     <div class="row state-overview">
                        <div class="col-md-12 col-xs-12 col-sm-12">
                             <img style="width:80%;padding-left:10%"src="${basePath}/img/aa.jpg" alt="" />
                        </div>
                    </div>
                    <!--statistics end-->
                </div>
            </div>

        </div>
        <!--body wrapper end-->

        <!--footer section start-->
        <footer>
            2018 &copy; 学生就业管理信息系统
        </footer>
        <!--footer section end-->


    </div>
    <!-- main content end-->
</section>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="${basePath}/js/jquery-1.10.2.min.js"></script>
<script src="${basePath}/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${basePath}/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${basePath}/js/bootstrap.min.js"></script>
<script src="${basePath}/js/modernizr.min.js"></script>
<script src="${basePath}/js/jquery.nicescroll.js"></script>
<script src="${basePath}/js/scripts.js"></script>



</body>
</html>
