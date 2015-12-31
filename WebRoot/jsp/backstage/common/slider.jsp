<%@page import="cn.edu.xmu.artwork.entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--
BeyondAdmin - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.2.0
Version: 1.0.0
Purchase: http://wrapbootstrap.com
-->

<html xmlns="http://www.w3.org/1999/xhtml">
<!-- Head -->
<head>
	<base href="<%=basePath%>">
    <meta charset="utf-8" />
    <title>Data Tables</title>

    <meta name="description" content="data tables" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">

    <!--Basic Styles-->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link id="bootstrap-rtl-link" href="" rel="stylesheet" />
    <link href="assets/css/font-awesome.min.css" rel="stylesheet" />
    <link href="assets/css/weather-icons.min.css" rel="stylesheet" />

    <!--Fonts-->
    <link href="http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,600,700,300" rel="stylesheet" type="text/css">

    <!--Beyond styles-->
    <link id="beyond-link" href="assets/css/beyond.min.css" rel="stylesheet" />
    <link href="assets/css/demo.min.css" rel="stylesheet" />
    <link href="assets/css/typicons.min.css" rel="stylesheet" />
    <link href="assets/css/animate.min.css" rel="stylesheet" />
    <link id="skin-link" href="" rel="stylesheet" type="text/css" />

    <!--Page Related styles-->
    <link href="assets/css/dataTables.bootstrap.css" rel="stylesheet" />

    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
    <script src="assets/js/skins.min.js"></script>
    
    <!-- Ajax Script -->
    <script type="text/javascript" src="js/ajax.admin.js"></script>
</head>
<!-- /Head -->
<!-- Body -->
<body>       
            <!-- Page Sidebar -->
            <div class="page-sidebar" id="sidebar">
                <!-- Page Sidebar Header-->
                <div class="sidebar-header-wrapper">
                    <input type="text" class="searchinput" />
                    <i class="searchicon fa fa-search"></i>
                    <div class="searchhelper"></div>
                </div>
                <!-- /Page Sidebar Header -->
                <!-- Sidebar Menu -->
                <ul class="nav sidebar-menu">
                	<c:choose>
                	<c:when test="${sessionScope.rank == 'editor'}">
                    <!--Dashboard-->
                    <li class="active open">
                        <a href="/ArtworkWeb/jsp/backstage/admin_submitAdvertise.jsp">
                            <i class="menu-icon glyphicon glyphicon-home"></i>
                            <span class="menu-text"> 广告上传 </span>
                            
                        </a>
                    </li>
                    <!--Databoxes-->
                    <li>
                        <a href="/ArtworkWeb/jsp/backstage/admin_submitInfo.jsp">
                            <i class="menu-icon glyphicon glyphicon-tasks"></i>
                            <span class="menu-text"> 资讯上传 </span>
                        </a>
                    </li>
					<li class="active open">
                        <a href="getInfoListByEditorId">
                            <i class="menu-icon glyphicon glyphicon-tasks"></i>
                            <span class="menu-text"> 我的资讯 </span>
                        </a>
                    </li>  
                    </c:when> 
                    <c:when test="${sessionScope.rank == 'admin'}">
                    <!--Dashboard-->
                    <li>
                        <a href="ShowAllUserList.action">
                            <i class="menu-icon glyphicon glyphicon-home"></i>
                            <span class="menu-text"> 用户管理 </span>
                            
                        </a>
                    </li>
                    <!--Databoxes-->
                    <li>
                        <a href="ShowAllArtistList.action">
                            <i class="menu-icon glyphicon glyphicon-tasks"></i>
                            <span class="menu-text"> 艺术家管理 </span>
                        </a>
                    </li>
                    <!--Widgets-->
                    <li>
                        <a href="ShowAllItemList.action">
                            <i class="menu-icon fa fa-th"></i>
                            <span class="menu-text"> 商品管理 </span>
                        </a>
                    </li> 
                    <!--Widgets-->
                    <li class="active open">
                        <a href="ShowAllInfoList.action">
                            <i class="menu-icon fa fa-th"></i>
                            <span class="menu-text"> 资讯管理 </span>
                        </a>
                    </li>      
                    </c:when>
                    
                    </c:choose>    
               </ul>
            </div> 

    <!--Basic Scripts-->
    <script src="assets/js/jquery-2.0.3.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!--Beyond Scripts-->
    <script src="assets/js/beyond.min.js"></script>

    <!--Page Related Scripts-->
    <script src="assets/js/datatable/jquery.dataTables.min.js"></script>
    <script src="assets/js/datatable/ZeroClipboard.js"></script>
    <script src="assets/js/datatable/dataTables.tableTools.min.js"></script>
    <script src="assets/js/datatable/dataTables.bootstrap.min.js"></script>
    <script src="assets/js/datatable/datatables-init.js"></script>
    <script>
        InitiateSimpleDataTable.init();
        InitiateEditableDataTable.init();
        InitiateExpandableDataTable.init();
        InitiateSearchableDataTable.init();
    </script>
    <!--Google Analytics::Demo Only-->
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', 'http://www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-52103994-1', 'auto');
        ga('send', 'pageview');

    </script>
</body>
<!--  /Body -->
</html>
