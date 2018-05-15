<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="${pageContext.request.contextPath}"/>

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
    <link href="${basePath}/css/bootstrap.css" rel="stylesheet"/>
    <link href="${basePath}/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet"/>
    <link href="${basePath}/css/plugins/datapicker/bootstrap-datetimepicker.min.css" rel="stylesheet"/>
    <script src="${basePath}/js/jquery-1.10.2.min.js"></script>
    <script src="${basePath}/js/jquery-ui-1.9.2.custom.min.js"></script>
    <script src="${basePath}/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="${basePath}/js/jquery.validate.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript"
            src="${basePath}/js/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <style type="text/css">
        table td {
            text-align: center;
            vertical-align: middle
        }

        table th {
            text-align: center;
            vertical-align: middle
        }
        .orangeBorder{
            border: 1px #ff6000 solid;
        }
        .bottomBorder{
            border: none;
            border-bottom: 1px grey dotted;
        }

        .newBtn{
            float: right;
            cursor: pointer;
            color: #00457d;
        }
        .unableNewBtn{
            float: right;
            cursor: none;
            color: grey;
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


        <div class="panel-body" style="padding-bottom:0px;" id="mainPanel">
            <div class="panel panel-default">
                <div class="panel-heading" style="padding: 5px;background-color: white;color: #ff6000;border:none;">个人信息</div>
                <div class="panel-body" style="padding: 5px;">
                    <form id="formSearch" class="form-horizontal">
                        <input type="hidden" id="resumeInfoId" name="resumeInfoId"/>
                        <div class="form-group" style="margin-top:15px">
                            <label style="padding: 10px 0" class="control-label col-sm-1" for="name">姓名<span
                                    style="color: red">*</span></label>
                            <div class="col-sm-3" style="width: 20%;">
                                <input type="text" class="form-control" id="name" name="name" required="required">
                            </div>
                            <label style="padding: 10px 0" class="control-label col-sm-1" for="telephone">电话<span
                                    style="color: red">*</span></label>
                            <div class="col-sm-3" style="width: 20%;">
                                <input type="text" class="form-control" id="telephone" name="telephone" required="required">
                            </div>
                            <label style="padding: 10px 0" class="control-label col-sm-1" for="resumeName">简历名称<span
                                    style="color: red">*</span></label>
                            <div class="col-sm-3" style="width: 20%;">
                                <input type="text" class="form-control" id="resumeName" name="resumeName" required="required">
                            </div>
                        </div>
                        <div class="form-group" style="margin-top:15px">
                            <label style="padding: 10px 0" class="control-label col-sm-1" for="school">毕业学校<span
                                    style="color: red">*</span></label>
                            <div class="col-sm-3" style="width: 20%;">
                                <input type="text" class="form-control" id="school" name="school" required="required">
                            </div>
                            <label style="padding: 10px 0" class="control-label col-sm-1" for="major">专业<span
                                    style="color: red">*</span></label>
                            <div class="col-sm-3" style="width: 20%;">
                                <input type="text" class="form-control" id="major" name="major" required="required">
                            </div>
                            <label style="padding: 10px 0" class="control-label col-sm-1" for="graduateTime">毕业时间<span
                                    style="color: red">*</span></label>
                            <div class="col-sm-3" style="width: 20%;">

                                <input type="text" id="graduateTime" name="graduateTime" class="form_datetime form-control" required="required">
                            </div>
                        </div>
                        <div class="form-group" style="margin-top:15px">

                            <label style="padding: 10px 0" class="control-label col-sm-1" for="birthday">出生日期<span
                                    style="color: red">*</span></label>
                            <div class="col-sm-3" style="width: 20%;">

                                <input type="text" id="birthday" name="birthday" class="form_datetime form-control" required="required">
                            </div>
                        </div>
                        <div class="form-group" style="margin-top:15px">
                            <div class="col-sm-4" style="text-align:left;float: none;margin: 0 auto">
                                <button  type="button" style="margin-left:50px" id="saveInfoBtn" class="btn btn-primary" onclick="saveInfo()">保存</button>
                                <button  type="button" style="margin-left:50px" id="cancelEditBtn" class="btn btn-primary" onclick="hideEditView()">取消</button>
                                <button  type="button" style="margin-left:50px" id="editInfoBtn" class="btn btn-primary" onclick="showEditView()">编辑</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" style="padding: 5px;background-color: white;color: #ff6000;border:none;">
                    工作经验
                    <a class="newBtn" id="newWork" >新增工作</a>
                </div>
                <div class="panel-body" style="padding: 5px;border:none;" id="experienceDiv" >

                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" style="padding: 5px;background-color: white;color: #ff6000;border:none;">
                    个人技能
                    <a class="newBtn" id="newSkill" onclick="newSkill()">新增技能</a>
                </div>
                <div class="panel-body" style="padding: 5px;border:none;" id="skillDiv" >

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

<script src="${basePath}/js/bootstrap.min.js"></script>
<!-- bootstrap-table.min.js -->
<script src="${basePath}/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<!-- 引入中文语言包 -->
<script src="${basePath}/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="${basePath}/js/modernizr.min.js"></script>
<script src="${basePath}/js/jquery.nicescroll.js"></script>
<script src="${basePath}/layer/layer.js"></script>
<script src="${basePath}/js/common.js"></script>
<script src="${basePath}/js/scripts.js"></script>
<script src="${basePath}/js/sign/editResume.js?v=1"></script>

<script type="text/javascript">
    //用户类型
    var type = "${sessionScope.auser.utype}";
    $('#graduateTime').datetimepicker({
        format: 'yyyy-mm-dd', /*此属性是显示顺序，还有显示顺序是mm-dd-yyyy*/
        language: 'zh-CN',
        minView: "month"
    });
    $('#birthday').datetimepicker({
        format: 'yyyy-mm-dd', /*此属性是显示顺序，还有显示顺序是mm-dd-yyyy*/
        language: 'zh-CN',
        minView: "month"
    });
    var id = "${id}";

    //新增页面
    if(!id || id == "null"){
        showEditView();
        hideCancelBtn();
        disabledNewWork();
        disabledNewSkill();
    }else{
        <c:if test="${id != null && id > 0}">
            var resumeInfo = ${resumeInfo};
            var workList = ${workList};//工作经验
            var skillList = ${skillList};//个人技能
            hideEditView();
            ableNewWork();
            ableNewSkill();
    //        var resumeObj = JSON.parse(resumeInfo);
            //填充基本信息
            for(var name in resumeInfo){
                if($("#"+name)){
                    $("#"+name).val(resumeInfo[name]);
                }
            }
            if(workList){
                loadWork(workList);
            }
            if(skillList){
                loadSkill(skillList);
            }
            var isDetail = ${isDetail};
            if(isDetail){
                $("#mainPanel button").hide();
                $("#mainPanel a").hide();
            }

        </c:if>

    }
</script>

</body>
</html>
