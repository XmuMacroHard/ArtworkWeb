<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<!--
Beyond Admin - Responsive Admin Dashboard Template build with Twitter Bootstrap 3
Version: 1.0.0
Purchase: http://wrapbootstrap.com
-->

<html xmlns="http://www.w3.org/1999/xhtml">
<!--Head-->
<head>
	<base href="<%=basePath%>">
	
    <meta charset="utf-8" />
    <title>Login Page</title>

    <meta name="description" content="login page" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="assets/img/favicon.png" type="image/x-icon">

    <!--Basic Styles-->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link id="bootstrap-rtl-link" href="" rel="stylesheet" />
    <link href="assets/css/font-awesome.min.css" rel="stylesheet" />

    <!--Fonts-->
    <link href="http://fonts.useso.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,600,700,300" rel="stylesheet" type="text/css">

    <!--Beyond styles-->
    <link id="beyond-link" href="assets/css/beyond.min.css" rel="stylesheet" />
    <link href="assets/css/demo.min.css" rel="stylesheet" />
    <link href="assets/css/animate.min.css" rel="stylesheet" />
    <link id="skin-link" href="" rel="stylesheet" type="text/css" />

    <!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
    <script src="assets/js/skins.min.js"></script>
    
    <script src="js/jquery.leanModal.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //$('#aOpen').leanModal({ top: 100, closeButton: ".modal_close" });
            $('a[rel*=leanModal]').leanModal({ top: 100});
        });
    </script>
    <style type="text/css">
        #lean_overlay { position: fixed; z-index: 100; top: 0px; left: 0px; height: 100%; width: 100%; background: #000; display: none; }
        #OpenWindow { background: none repeat scroll 0 0 #FFFFFF; border-radius: 5px 5px 5px 5px; box-shadow: 0 0 4px rgba(0, 0, 0, 0.7); display: none; padding-bottom: 2px; width: 404px; z-index: 11000; left: 50%; margin-left: -202px; opacity: 1; position: fixed; top: 200px; }
    </style>
</head>
<!--Head Ends-->
<!--Body-->
<body>
	<div>
		<a id="aOpen" href="jsp/login.jsp#OpenWindow" rel="leanModal">打开登陆窗口</a>
	</div>
	
	<div id="OpenWindow">
		<p>哈哈哈哈</p>
	</div>
	
    <div class="login-container">
        <div class="loginbox bg-white">
        	<form action=showTodayAuctionAction>
            <div class="loginbox-title">登录</div>
            <div class="loginbox-social">
                <div class="social-title ">使用第三方登录</div>
                <div class="social-buttons">
                    <a href="" class="button-facebook">
                        <i class="social-icon fa fa-facebook"></i>
                    </a>
                    <a href="" class="button-twitter">
                        <i class="social-icon fa fa-twitter"></i>
                    </a>
                    <a href="" class="button-google">
                        <i class="social-icon fa fa-google-plus"></i>
                    </a>
                </div>
            </div>
            <div class="loginbox-or">
                <div class="or-line"></div>
                <div class="or">OR</div>
            </div>
             
           <div class="loginbox-textbox">
                <s:textfield name="orderid" cssClass="form-control" placeholder="艺术品分类" />
            </div>
            <div class="loginbox-textbox">
                <s:password name="customization.commodity。introduction" cssClass="form-control" placeholder="定制描述" />
            </div>
            <div class="loginbox-textbox">
                <s:password name="customization。artist.realName" cssClass="form-control" placeholder="艺术家" />
            </div>
            <div class="loginbox-textbox">
                <s:password name="customization.shippingAddress" cssClass="form-control" placeholder="地址" />
            </div>
            
            <div class="loginbox-forgot">
                <a href="">忘记密码?</a>
            </div>
            <div class="loginbox-submit">
                <s:submit cssClass="btn btn-primary pull-right" value="登录"/>
            </div>
            </form>
        </div>
    </div>

</body>
<!--Body Ends-->
</html>

