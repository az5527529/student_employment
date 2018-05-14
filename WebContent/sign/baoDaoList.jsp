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
                <li><a href="${basePath}/payList.do"><i class="fa fa-globe"></i> <span>缴费信息查询</span></a></li>
                <li class="active"><a href="${basePath}/baoDaoList.do"><i class="fa fa-retweet"></i> <span>报道流程管理</span></a></li>
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
            <th>序号</th>
	        <th>学生姓名</th>
	        <th>性别</th>
	        <th>学号</th>
	        <th>专业</th>
	        <th>宿舍</th>
	        <th>班级</th>
	        <th>状态</th>
	        <th>操作</th>
        </tr>
        </thead>
        <tbody>
       <c:forEach items="${list }" var="u" varStatus="s">
        <tr class="gradeX">
          <td>${s.index+1}</td>
          <td >${u.uname }</td>
          <td>${u.sex }</td>
          <td>${u.mbanswer }</td>
          <td >${u.major }</td>
          <td>${u.roomname }</td>
          <td>${u.clazzName }</td>
          <c:if test="${u.status==1}">
          	<td>未缴费</td>
          	<td><button type="button" class="btn btn-success" onclick="payMoney(${u.uid },2)">确定缴费</button></td>
          </c:if>
          <c:if test="${u.status==2}">
          	<td>未分宿舍</td>
          	<td><button type="button" class="btn btn-success" onclick="sushe(${u.uid },3)">分宿舍</button></td>
          </c:if>
          <c:if test="${u.status==3}">
          	<td>未分班</td>
          	<td><button type="button" class="btn btn-success" onclick="fenban(${u.uid },4)">分班</button></td>
          </c:if>
          <c:if test="${u.status==4}">
          	<td>流程结束</td>
          	<td>无需操作</td>
          </c:if>
	        </tr>
      
        </c:forEach> 
     
      <tr>
		<td colspan="9" class="center" > <c:if test="${page.page>1}">
              <a href="${basePath}/baoDaoList.do?page=1" >首页</a>
             <a href="${basePath}/baoDaoList.do?page=${page.page-1 }"> 上一页</a> 
             </c:if>
    	     <c:if test="${page.page<page.totalPage}">
			<a href="${basePath}/baoDaoList.do?page=${page.page+1 }">下一页</a>
			<a href="${basePath}/baoDaoList.do?page=${page.totalPage }">末页</a>
		    </c:if> 
		</td>
      </tr>
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

<div style="width:80%;height:50%;display:none;padding-top:5px;" id="inputDiv">
	<form class="form-horizontal" role="form" id="subForm">
		<div class="panel-body">
        <div class="adv-table">
        <table  class="display table table-bordered table-striped" id="roomTable">
        <thead>
        <tr>
            <th>选择</th>
	        <th>宿舍</th>
	        <th>总人数</th>
	        <th>剩余床位</th>
        </tr>
        </thead>
        <tbody id="roomBody">
        
        </tbody>
        </table>
        </div>
        </div>
		<div class="form-group">
			<div class="col-sm-offset-6 ">
				<button type="button" onclick="roomSubMit()" class="btn btn-success">确定</button>
				<button type="button" class="btn btn-success" onclick="closeAllLayer()">取消</button>
			</div>
		</div>
	</form>
</div>

<div style="width:80%;height:50%;display:none;padding-top:5px;" id="clazzDiv">
	<form class="form-horizontal" role="form" id="clazzDivForm">
		<div class="panel-body">
        <div class="adv-table">
        <table  class="display table table-bordered table-striped" id="clazzTable">
        <thead>
        <tr>
            <th>选择</th>
	        <th>班级</th>
        </tr>
        </thead>
        <tbody id="clazzBody">
        
        </tbody>
        </table>
        </div>
        </div>
		<div class="form-group">
			<div class="col-sm-offset-6 ">
				<button type="button" onclick="clazzSubMit()" class="btn btn-success">确定</button>
				<button type="button" class="btn btn-success" onclick="closeAllLayer()">取消</button>
			</div>
		</div>
	</form>
</div>

<input type="hidden" id="subId">
<input type="hidden" id="subStatus">

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
$(function(){
	$("#subId").val("");
	$("#subStatus").val("");
	
	$.ajax({
	    type: "POST",
	    url:"${pageContext.request.contextPath}/getRoom.do",
	    data:{},
	    dataType:"json",
	    success: function(data) {
	 	   var jsonObject = data;
	 	   var room;
	 	   for (var i = 0; i < jsonObject.length; i++) {
	 		  room+=addHtml(jsonObject[i]);
			}
	 	   $("#roomBody").append(room);
	    }
	});
	
	$.ajax({
	    type: "POST",
	    url:"${pageContext.request.contextPath}/getClazzName.do",
	    data:{},
	    dataType:"json",
	    success: function(data) {
	 	   var jsonObject = data;
	 	   var room;
	 	   for (var i = 0; i < jsonObject.length; i++) {
	 		  room+=addHtmlForClazz(jsonObject[i]);
			}
	 	   $("#clazzBody").append(room);
	    }
	});
});


function payMoney(id,status){
	$.ajax({
	       type: "POST",
	       url:"${pageContext.request.contextPath}/payMoney.do",
	       data:{'id':id,'status':status},
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

function sushe(id,status){
	$("#subId").val(id);
	$("#subStatus").val(status);
	add();
}

function fenban(id,status){
	$("#subId").val(id);
	$("#subStatus").val(status);
	addForClazz();
}

function addHtml(jsonObject){
	var html="";
	html+='<tr class="gradeX">'
	html+='  <td><input type="checkbox" name="danxuan" value="'+jsonObject.uid+'"></td>'
	html+='      <td >'+jsonObject.roomname+'</td>'
	html+='      <td>'+jsonObject.total+'</td>'
	html+='      <td>'+jsonObject.surplus+'</td>'
	html+='</tr>'
	return html;
}

function addHtmlForClazz(jsonObject){
	var html="";
	html+='<tr class="gradeX">'
	html+='  <td><input type="checkbox" name="clazzXZ" value="'+jsonObject.uid+'"></td>'
	html+='      <td >'+jsonObject.clazzName+'</td>'
	html+='</tr>'
	return html;
}


	function add(){
		layer.open({
			type: 1,//层的类型。0：信息框（默认），1：页面层，2：iframe层，3：加载层，4：tips层。
			area: ['50%', '70%'],//控制层宽高 [宽度, 高度]
		  	content: $("#inputDiv"),
		  	offset:['100px','300px'],
		  	title:'安排宿舍',
		  	scrollbar: false
		});
	}
	
	function addForClazz(){
		layer.open({
			type: 1,//层的类型。0：信息框（默认），1：页面层，2：iframe层，3：加载层，4：tips层。
			area: ['50%', '70%'],//控制层宽高 [宽度, 高度]
		  	content: $("#clazzDiv"),
		  	offset:['100px','300px'],
		  	title:'分班',
		  	scrollbar: false
		});
	}
	
	function clazzSubMit(){
		var a = $("input[name='clazzXZ']:checked").length;
		if(a<1){
			layer.alert('请选择一条数据',{icon: 0});
			return;
		}else if(a>1){
			layer.alert('只能选择一条数据',{icon: 0});
			return;
		}
		var aa = $("input[name='clazzXZ']:checked");
		var tr = aa.parent().parent();
	    //获取tr的所有td元素
	    var b = tr.children("td");
	    //取得第三列元素
	    var u1 = b.eq(0).find("input").val().trim();
	    
		var id = $("#subId").val();
		var status = $("#subStatus").val();
		
		 $.ajax({
		       type: "POST",
		       url:"${pageContext.request.contextPath}/addRoomOrClazz.do",
		       data:{'id':id,'status':status,'clazzid':u1,type:1},
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
	
	function roomSubMit(){
		var a = $("input[name='danxuan']:checked").length;
		if(a<1){
			layer.alert('请选择一条数据',{icon: 0});
			return;
		}else if(a>1){
			layer.alert('只能选择一条数据',{icon: 0});
			return;
		}
		var aa = $("input[name='danxuan']:checked");
		var tr = aa.parent().parent();
	    //获取tr的所有td元素
	    var b = tr.children("td");
	    //取得第三列元素
	    var u1 = b.eq(0).find("input").val().trim();
	    var u4 = b.eq(3).text().trim();
	    if(u4==0){
	    	layer.alert('该房间已无房间可分配',{icon: 0});
			return;
	    }
	    
		var id = $("#subId").val();
		var status = $("#subStatus").val();
		 $.ajax({
		       type: "POST",
		       url:"${pageContext.request.contextPath}/addRoomOrClazz.do",
		       data:{'id':id,'status':status,'clazzid':u1,type:2},
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
