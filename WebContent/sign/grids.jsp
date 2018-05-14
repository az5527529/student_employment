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
  <%-- <link href="${basePath}/js/iCheck/skins/minimal/minimal.css" rel="stylesheet">
  <link href="${basePath}/js/iCheck/skins/square/square.css" rel="stylesheet">
  <link href="${basePath}/js/iCheck/skins/square/red.css" rel="stylesheet">
  <link href="${basePath}/js/iCheck/skins/square/blue.css" rel="stylesheet"> --%>

  <!--dashboard calendar-->
<%--   <link href="${basePath}/css/clndr.css" rel="stylesheet"> --%>

  <!--Morris Chart CSS -->
<%--   <link rel="stylesheet" href="${basePath}/js/morris-chart/morris.css"> --%>

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
                信息管理
            </h3>
            <ul class="breadcrumb">
                <li>信息管理</li>
                <li class="active">人员信息</li>
            </ul>
        </div>
        <!-- page heading end-->

        <!--body wrapper start-->
        <div class="wrapper" >
            <div class="row" >
                <div class="col-sm-12">
        <section class="panel">
        <header class="panel-heading">
            人员信息列表
            <span class="tools pull-right">
                <a href="javascript:;" class="fa fa-chevron-down"></a>
             </span>
        </header>
        <div class="panel-body">
        <div class="adv-table">
        <!-- <div class="clearfix">
                    <div class="btn-group">
                        <button id="" class="btn btn-primary">
                            <a style="color:#fff" href="sign/add_user3.jsp">新增学生</a>
                        </button>
                    </div>
                </div> -->
        <table  class="display table table-bordered table-striped" id="dynamic-table">
        <thead>
        <tr>
        	<th>姓名</th>
            <th>性别</th>
	        <th >密码</th>
	        <th>年龄</th>
	        <th>专业</th>
	        <c:if test="${sessionScope.auser.utype != 3 }">
	        <th>操作</th>
	        </c:if>
        </tr>
        </thead>
        <tbody>
       <c:forEach items="${list }" var="u">
        <tr class="gradeX">
          <td >${u.uname }</td>
          <td>${u.sex }</td>
          <td >${u.pwd }</td>
          <td>${u.age }</td>
          <td>${u.major}</td>
          <td>
          	<c:if test="${sessionScope.auser.utype == 1 }">
          	<a onclick="dele(${u.uid })">删除</a>
          	</c:if>
          	<c:if test="${sessionScope.auser.utype != 3 }">
          	<a style="padding-left:10px" onclick="edit('${u.uid }','${u.uname }','${u.pwd }','${u.age }' ,'${u.major}')">修改</a>
          	</c:if>
          </td>
        </tr>
        </c:forEach> 
     	
      <c:if test="${sessionScope.auser.utype == 1 }">
      <tr>
		<td colspan="6" class="center" style="text-align:center;vertical-align:middle;"> <c:if test="${page.page>1}">
              <a href="infoManage.do?page=1" >首页</a>
             <a href="infoManage.do?page=${page.page-1 }"> 上一页</a> 
             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="infoManage.do?page=${page.page+1 }">下一页</a>
			<a href="infoManage.do?page=${page.totalPage }">末页</a>
		    </c:if> 
		</td>
      </tr>
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
            2018 &copy; 学生就业管理信息系统
        </footer>
        <!--footer section end-->


    </div>
    <!-- main content end-->
</section>
<div style="width:80%;height:50%;display:none;padding-top:5px;" id="inputDiv">
	<form class="form-horizontal" role="form" id="subForm">
		<input type="hidden" value="" id="userid">
      <div class="form-group">
        <label class="col-sm-4 control-label"> 
				姓名：
			</label>
			<div class="col-sm-8">
          <input type="text" class="form-control" readonly="readonly"  name="uname"  id="username"/>
			</div>
      </div>
      <div class="form-group">
        <label class="col-sm-4 control-label"> 
				密码：
			</label>
			<div class="col-sm-8">
          <input type="password" class="form-control" name="pwd"  id="txtPwd" />
			</div>
      </div>
      <div class="form-group">
        <label class="col-sm-4 control-label"> 
				年龄：
			</label>
			<div class="col-sm-8">
          <input type="text" class="form-control"  name="age" id="age" />
			</div>
      </div>
        <div class="form-group">
          <label class="col-sm-4 control-label"> 
				专业：
			</label>
			<div class="col-sm-8">
           <input  type="text" name="major" class="form-control"  id="major"/>
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

function edit(id,name,pwd,age,major){
	$("#txtPwd").val(pwd);
	$("#age").val(age);
	$("#major").val(major);
	$("#userid").val(id);
	$("#username").val(name);
	layer.open({
		type: 1,//层的类型。0：信息框（默认），1：页面层，2：iframe层，3：加载层，4：tips层。
		area: ['50%', '7	0%'],//控制层宽高 [宽度, 高度]
	  	content: $("#inputDiv"),
	  	offset:['100px','300px'],
	  	title:'新增',
	  	scrollbar: false
	});
}

function dele(id){
	$.ajax({
	       type: "POST",
	       url:"${pageContext.request.contextPath}/admin/deleForStudent.do",
	       data:{'id':id},
	       dataType:"json",
	       success: function(data) {
	       	 if(data=='1'){
	       		layer.alert('操作成功',{icon: 6}); 
	       		closeAllLayer();
	       	 }else{
	       		 layer.alert('操作失败',{icon: 5}); 
	       	 }
	       }
	   });
}

function subMit(){
	//var formData = new FormData($('#subForm')[0]);
	var txtPwd = $("#txtPwd").val();
	var age = $("#age").val();
	var major = $("#major").val();
	var userid = $("#userid").val();
	
	var age1 = nullOrEmpt(txtPwd);
	 var number1 = nullOrEmpt(age);
	 var major1 = nullOrEmpt(major);
	 if(!age1 || !number1 || !major1 ){
		 layer.alert('请填写完每一项信息',{icon: 0});
		 return;
	 }
	
	$.ajax({
	       type: "POST",
	       url:"${pageContext.request.contextPath}/editUser.do",
	       data:{'major':major,'age':age,txtPwd:txtPwd,'id':userid},
	       dataType:"json",
	       success: function(data) {
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
