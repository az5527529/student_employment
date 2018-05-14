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
<footer>
            2018 &copy; 学生就业管理信息系统
        </footer>

</html>
