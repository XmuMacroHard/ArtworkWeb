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
    <!-- Loading Container -->
    <div class="loading-container">
        <div class="loading-progress">
            <div class="rotator">
                <div class="rotator">
                    <div class="rotator colored">
                        <div class="rotator">
                            <div class="rotator colored">
                                <div class="rotator colored"></div>
                                <div class="rotator"></div>
                            </div>
                            <div class="rotator colored"></div>
                        </div>
                        <div class="rotator"></div>
                    </div>
                    <div class="rotator"></div>
                </div>
                <div class="rotator"></div>
            </div>
            <div class="rotator"></div>
        </div>
    </div>
    <!--  /Loading Container -->
    <!-- Navbar -->
	<c:import url="common/header.jsp"/>
    <!-- /Navbar -->
    <!-- Main Container -->
    <div class="main-container container-fluid">
        <!-- Page Container -->
        <div class="page-container">
            <!-- Page Sidebar -->
				<c:import url="common/slider.jsp"/>
            <!-- /Page Sidebar -->
            <!-- Page Content -->
            <div class="page-content">
                <!-- Page Body -->
                <div class="page-body">
                    <div class="row">
                        <div class="col-lg-12 col-sm-12 col-xs-12">
                            <div class="widget flat radius-bordered">
                                <div class="widget-header bordered-bottom bordered-themeprimary">
                                    <i class="widget-icon fa fa-text-width"></i>
                                    <span class="widget-caption">艺术家详情</span>
                                    <div class="widget-buttons">
                                        <a href="#" data-action="refresh">
                                            <i class="fa fa-undo"></i>
                                        </a>
                                        <a href="#" data-toggle="config">
                                            <i class="fa fa-cog"></i>
                                        </a>
                                        <a href="#" data-toggle="maximize">
                                            <i class="fa fa-expand"></i>
                                        </a>
                                        <a href="#" data-toggle="collapse">
                                            <i class="fa fa-minus"></i>
                                        </a>
                                        <a href="#" data-toggle="dispose">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </div><!--Widget Buttons-->
                                </div><!--Widget Header-->
                                <div class="widget-body">
                                    <div class="widget-main no-padding">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th width="30%">类型</th>
                                                    <th>信息</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                                                                                                                                        基本信息<br/>
                                                        <img src="/images/german.png"/>
                                                    </td>
                                                    <td>
                                                    	<h1> ${artist.email}</h1>
                                                        <p>姓名： ${artist.realName}</p>
                                                        <p>身份证： ${artist.identification}</p>
                                                        <p>联系方式： ${artist.phone}</p>
                                                        <p>账户余额： ${artist.balance}</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>个人简介</td>
                                                    <td>
                                                        <p>${artist.introduction}</p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>认证资料</td>
                                                    <td>
                                                        <a href="<s:url value='download.action'><s:param name='fileName'>test.txt</s:param> </s:url>">下载</a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div><!--Widget Main Container-->
                                </div><!--Widget Body-->
                            </div><!--Widget-->
                            <a onClick="javascript:history.back(-1);" class="btn btn-info" style="float:right">返回</a>
                        </div>
                    </div>
                </div>
                <!-- /Page Body -->
            </div>
            <!-- /Page Content -->
            
        </div>
        <!-- /Page Container -->
        <!-- Main Container -->

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
