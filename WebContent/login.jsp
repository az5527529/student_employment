<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="basePath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
    <title>学生就业管理信息系统</title>
    
    <link href="${basePath}/css/style.css" rel="stylesheet">
    <link href="${basePath}/css/style-responsive.css" rel="stylesheet">
    
    <link rel="stylesheet" href="${basePath}/layer/skin/default/layer.css">
    <script src="${basePath}/js/jquery.min.js"></script>
    <script src="${basePath}/layer/layer.js"></script>
    <script src="${basePath}/js/modernizr.min.js"></script>
</head>

<body class="login-body">

<div class="container">

    <form class="form-signin" action="login.do" id="subForm">
        <div class="form-signin-heading text-center">
            <h1 class="sign-title">学生就业管理信息系统</h1>
            <img src="${basePath}/css/images/login-logo.png" alt=""/>
        </div>
        <div class="login-wrap">
            <input type="text" class="form-control" id="uname" name="uname" placeholder="请输入用户名" autofocus>
            <input type="password" class="form-control" id="pwd"name="pwd" placeholder="请输入密码">
            <select class="form-control m-bot15" id="utype">
                 <option selected="selected" value="1">管理员</option>
                 <option value="2">学生</option>
                 <option value="3">企业单位</option>
             </select>
            <button class="btn btn-lg btn-login btn-block" type="button" onclick="submitUpload()">
                <i class="fa" style="font-size:22px">登录</i>
            </button>
            <button class="btn btn-lg btn-login btn-block" type="button" onclick="window.location.href='add_user4.jsp'">
                <i class="fa" style="font-size:22px"><a style="color:#fff" href="sign/add_user.jsp">学生注册</a></i>
            </button>
            <button class="btn btn-lg btn-login btn-block" type="button" onclick="window.location.href='add_user1.jsp'">
                <i class="fa" style="font-size:22px"><a style="color:#fff" href="sign/add_user1.jsp">企业注册</a></i>
            </button>
			<button class="btn btn-lg btn-login btn-block" type="button" onclick="window.location.href='add_user2.jsp'">
                <i class="fa" style="font-size:22px"><a style="color:#fff" href="sign/add_user2.jsp">管理员注册</a></i>
            </button>
        <!-- <div class="registration">
                <a class="" onclick="forgetPwd()">
                    忘记密码?
                </a>
            </div> -->
        </div>

        <!-- Modal -->
        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Forgot Password ?</h4>
                    </div>
                    <div class="modal-footer">
                        <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
                        <button class="btn btn-primary" type="button">Submit</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- modal -->

    </form>

</div>
<script type="text/javascript">

$(function () {
	 
	//撑开浏览器
	 if (window != top) {
			top.location.href = location.href;
	}
	 
   $(document).keydown(function(event){
		if(event.keyCode == 13){
			submitUpload();
		}
	});
 });

function validateForm(){
	 var userAccount = $("#uname").val().trim();
	 var password = $("#pwd").val().trim();
	 if(userAccount.length == 0){
		 layer.alert('用户名不能为空！',{icon: 0});
		 return false;
	 }
	 if(password.length == 0){
		 layer.alert('密码不能为空！',{icon: 0});
		 return false;
	 }
	  return true;
};

function submitUpload(){
	if(validateForm()){
		 var userAccount = $("#uname").val().trim();
		 var password = $("#pwd").val().trim();
		 var utype = $("#utype").find("option:selected").val();
		$.ajax({
	       type: "POST",
	       url:"${pageContext.request.contextPath}/login.do",
	       data:{"uname":userAccount,"pwd":password,'utype':utype},
	       dataType:"json",
	       success: function(data) {
	       	 if(data=='1'){
	       		 location.href="${pageContext.request.contextPath}/index.do"; 
	       	 }else{
	       		 layer.alert('帐号或者密码有误',{icon: 5}); 
	       	 }
	       }
	   }); 
	}
};

	
</script>
</body>
</html>
