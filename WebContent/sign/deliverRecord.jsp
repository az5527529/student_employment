<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>
<%
    String userId = request.getParameter("userId");//用户id
    if(userId == null || "null".equals(userId)){
        userId = "";
    }
    String jobInfoId = request.getParameter("jobInfoId");//职位id
    if(jobInfoId == null || "null".equals(jobInfoId)){
        jobInfoId = "";
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="keywords"
          content="admin, dashboard, bootstrap, template, flat, modern, theme, responsive, fluid, retina, backend, html5, css, css3">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">

    <title>学生就业管理信息系统</title>


    <link href="${basePath}/css/style.css" rel="stylesheet">
    <link href="${basePath}/css/style-responsive.css" rel="stylesheet">
    <link rel="stylesheet" href="${basePath}/layer/skin/default/layer.css">
    <link href="${basePath}/css/bootstrap.css" rel="stylesheet" />
    <link href="${basePath}/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet" />
    <style type="text/css">
        table td {
            text-align: center;
            vertical-align: middle
        }

        table th {
            text-align: center;
            vertical-align: middle
        }
    </style>
</head>

<body class="sticky-header">

<section>
    <!-- left side start-->
    <div class="left-side sticky-left-side">

        <!--logo and iconic logo start-->
        <div class="logo">
            <a><img src="${basePath}/css/images/logo.png" alt=""></a>
        </div>

        <div class="logo-icon text-center">
            <a><img src="${basePath}/css/images/logo_icon.png" alt=""></a>
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
            <%@ include file="urlList.jsp" %>
            <!--sidebar nav end-->

        </div>
    </div>
    <!-- left side end-->

    <!-- main content start-->
    <div class="main-content">

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
                        <a style="cursor: pointer;color: black;" href="${basePath}/logout.do">注销</a>
                    </li>

                </ul>
            </div>
            <!--notification menu end -->

        </div>
        <!-- header section end-->


        <div class="panel-body" style="padding-bottom:0px;">
            <div class="panel panel-default">
                <div class="panel-heading">查询条件</div>
                <div class="panel-body">
                    <form id="formSearch" class="form-horizontal">
                        <input type="hidden" id="userId" value="<%=userId%>">
                        <input type="hidden" id="jobInfoId" value="<%=jobInfoId%>">
                        <%--<div class="form-group" style="margin-top:15px">--%>

                            <%--<div class="col-sm-4" style="text-align:left;">--%>
                                <%--<button  type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    </form>
                </div>
            </div>

            <div id="toolbar" class="btn-group">

            </div>
            <table id="deliverRecord"></table>
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
<!-- bootstrap-table.min.js -->
<script src="${basePath}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<!-- 引入中文语言包 -->
<script src="${basePath}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"
<script src="${basePath}/js/modernizr.min.js"></script>
<script src="${basePath}/js/jquery.nicescroll.js"></script>
<script src="${basePath}/layer/layer.js"></script>
<script src="${basePath}/js/common.js"></script>
<script src="${basePath}/js/scripts.js"></script>


<script type="text/javascript">
    //用户类型
    var userType = "${sessionScope.auser.utype}";

</script>
<script src="${basePath}/js/sign/deliverRecord.js"></script>
</body>
</html>
