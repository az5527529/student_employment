<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pintuer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/layer/skin/default/layer.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/layer/layer.js"></script>
<script type="text/javascript">
 
	 
 function nullOrEmpt(filepath){
		var flag = false;
		if(filepath == "" || filepath == undefined || filepath == null){
			 return flag;
		}
		return true;
	}
 
	function checkAll(){
		var flag=false;
		var username = $("#username").val();
		var txtPwd=$("#txtPwd").val();
		var tname=$("#tname").val();
		var age=$("#age").val();
		
		var username1 = nullOrEmpt(username);
		 var txtPwd1 = nullOrEmpt(txtPwd);
		 var tname1 = nullOrEmpt(tname);
		 var age1 = nullOrEmpt(age);
		 if(!username1 || !txtPwd1 || !tname1 || !age1){
			 layer.alert('注册信息不完整',{icon: 5}); 
			 return false;
		 }
		 var fd = new FormData(document.getElementById("subform"));
		 $.ajax({
		       type: "POST",
		       url:"${pageContext.request.contextPath}/admin/addUser2.do",
		       data:$( '#subform').serialize(),
		       dataType:"json",
		       success: function(data) {
		       	 if(data=='1'){
		       		 location.href="${pageContext.request.contextPath}/toLogin.do"; 
		       	 }else{
		       		 layer.alert('注册失败',{icon: 5}); 
		       	 }
		       }
		   });
	}
</script>
</head>

<body>
<div class="panel admin-panel">
  <div class="panel-head" id="add"><strong><span class="icon-pencil-square-o"></span>企业注册</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="" id="subform" >  
      <div class="form-group">
        <div class="label">
          <label>账号：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50"  name="uname"  id="username"/>
          <div id='checku' class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" name="pwd"  id="txtPwd" />
          <div id='prompt_pwd'  class="tips"></div>
        </div>
      </div>
     <div class="form-group">
        <div class="label">
          <label>企业名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50"  name="tname" id="tname" />
          <div id='checkud' class="tips"></div>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>公司简介：</label>
        </div>
        <div class="field">
          <input type="text" class="input w50"  name="age" id="age" />
          <div id='checkud' class="tips"></div>
        </div>
      </div>
        
        <div class="form-group">
          <div class="label">
            <label>身份：</label>
          </div>
          <div class="field" style="padding-top:8px;"> 
            <select name="utype" class="input w50">
              <option value="3">企业公司</option>
             <!--  <option value="老师">老师</option>
              <option value="管理员">管理员</option> -->
             </select>
          </div>
        </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="button" onclick="checkAll()"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>

</body></html>