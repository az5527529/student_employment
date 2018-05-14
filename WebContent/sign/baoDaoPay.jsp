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

  <title>新生报到系统管理</title>

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
  <link rel="stylesheet" href="${basePath}/layer/skin/default/layer.css">
  <style type="text/css">
  	table td{
	text-align:center;
	vertical-align:middle
}
table th{
	text-align:center;
	vertical-align:middle
}
  </style>
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
            <c:if test="${sessionScope.auser.utype == 1 }">
            <ul class="nav nav-pills nav-stacked custom-nav">
                <li><a href="${basePath}/infoManage.do"><i class="fa fa-comments"></i> <span>信息管理</span></a></li>
                <li><a href="${basePath}/roomList.do"><i class="fa fa-home"></i> <span>宿舍管理</span></a></li>
                <li><a href="${basePath}/clazzList.do"><i class="fa fa-glass"></i> <span>班级管理</span></a></li>
                <li class="active"><a href="${basePath}/payList.do"><i class="fa fa-globe"></i> <span>缴费信息查询</span></a></li>
                <li><a href="${basePath}/baoDaoList.do"><i class="fa fa-retweet"></i> <span>报道流程管理</span></a></li>
                <!-- <li><a href=""><i class="fa fa-gears"></i> <span>权限控制管理</span></a></li> -->
            </ul>
            </c:if>
            <c:if test="${sessionScope.auser.utype == 2 }">
            <ul class="nav nav-pills nav-stacked custom-nav">
                <li><a href="${basePath}/infoManage.do?uid=${sessionScope.auser.uid}"><i class="fa fa-comments"></i> <span>个人信息</span></a></li>
                <li><a href="${basePath}/baoDaoPay.do?uid=${sessionScope.auser.uid}"><i class="fa fa-home"></i> <span>报道缴费</span></a></li>
            </ul>
            </c:if>
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
                缴费信息
            </h3>
            <ul class="breadcrumb">
                <li> 缴费信息</li>
                <li class="active"> 缴费详细信息</li>
            </ul>
        </div>
        <!-- page heading end-->

        <!--body wrapper start-->
        <div class="wrapper" >
            <div class="row" >
                <div class="col-sm-12">
        <section class="panel">
        <header class="panel-heading">
           缴费信息列表
            <span class="tools pull-right">
                <a href="javascript:;" class="fa fa-chevron-down"></a>
             </span>
        </header>
        <div class="panel-body">
        <div class="adv-table">
        <table  class="display table table-bordered table-striped" id="dynamic-table">
        <thead>
        <tr>
	        <th >学生姓名</th>
	        <th>培养费/元</th>
	        <th>住宿费/元</th>
	        <th>书本费/元</th>
	        <th>合计/元</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${status != 1 }">
        <tr class="gradeX">
          <td >${payInfo.uname }</td>
          <td >${payInfo.peiyang }</td>
          <td>${payInfo.book }</td>
          <td>${payInfo.zhusu }</td>
          <td>${payInfo.total }</td>
        </tr>
      </c:if>
      <c:if test="${status == 1 }">
      	<td colspan="5" class="center" >
      		还未缴费 <a onclick="pay()">请点击缴费</a>
      	</td>
      </c:if>
        </tbody>
        </table>
        </div>
        </div>
        </section>
        </div>
            </div>

        </div>
        <!--body wrapper end-->

        <!--footer section start-->
        <footer>
            2018 &copy; 新生报到系统管理 
        </footer>
        <!--footer section end-->


    </div>
    <!-- main content end-->
</section>
<input type="hidden" value="${sessionScope.auser.uid }" id="userid">
<div style="width:80%;height:50%;display:none;padding-top:5px;" id="inputDiv">
	<form class="form-horizontal" role="form" id="subForm">
		<div class="form-group" style="margin-top: 30px;">
			<label class="col-sm-4 control-label"> 
				书本费：
			</label>
			<div class="col-sm-8">
				<input class="form-control" value="200元" readonly="readonly"/>
			</div>
		</div>
		<div class="form-group" style="margin-top: 30px;">
			<label class="col-sm-4 control-label"> 
				培养费：
			</label>
			<div class="col-sm-8">
				<input class="form-control" value="3000元" readonly="readonly"/>
			</div>
		</div>
		<div class="form-group" style="margin-top: 30px;">
			<label class="col-sm-4 control-label"> 
				住宿费：
			</label>
			<div class="col-sm-8">
				<input class="form-control" value="1000元" readonly="readonly"/>
			</div>
		</div>
		<div class="form-group" style="margin-top: 30px;">
			<label class="col-sm-4 control-label"> 
				合计：
			</label>
			<div class="col-sm-8">
				<input class="form-control" value="42000元" readonly="readonly"/>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-6 ">
				<button type="button" onclick="subMit()" class="btn btn-success">确定</button>
				<button type="button" class="btn btn-success" onclick="closeAllLayer()">取消</button>
			</div>
		</div>
	</form>
</div>
<!-- Placed js at the end of the document so the pages load faster -->
<script src="${basePath}/js/jquery-1.10.2.min.js"></script>
<script src="${basePath}/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${basePath}/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${basePath}/js/bootstrap.min.js"></script>
<script src="${basePath}/js/modernizr.min.js"></script>
<script src="${basePath}/js/jquery.nicescroll.js"></script>
<script src="${basePath}/layer/layer.js"></script>
<script src="${basePath}/js/common.js"></script>
<script src="${basePath}/js/scripts.js"></script>


<script type="text/javascript">
	function pay(){
		layer.open({
			type: 1,//层的类型。0：信息框（默认），1：页面层，2：iframe层，3：加载层，4：tips层。
			area: ['50%', '7	0%'],//控制层宽高 [宽度, 高度]
		  	content: $("#inputDiv"),
		  	offset:['100px','300px'],
		  	title:'新增',
		  	scrollbar: false
		});
	}
	
	function subMit(){
		var userid = $("#userid").val();
		
		$.ajax({
		       type: "POST",
		       url:"${pageContext.request.contextPath}/addPayInfo.do",
		       data:{'userid':userid},
		       dataType:"json",
		       success: function(data) {
		    	   if(data=='-1'){
		    		   layer.alert('已经缴过费，请等待管理员确定',{icon: 6}); 
		    		}else 
		       	 if(data=='1'){
		       		layer.alert('操作成功',{icon: 6}); 
		       		closeAllLayer();
		       	 }else{
		       		 layer.alert('操作失败',{icon: 5}); 
		       	 }
		       }
		   }); 
	}
	
</script>
</body>
</html>
