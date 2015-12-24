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
	
    <div class="login-container">
        <div class="loginbox bg-white">
<<<<<<< HEAD:WebRoot/jsp/login.jsp
        	
=======
        	<!-- <form action="loginAction"> -->
>>>>>>> e7b17987db58c98cf21917e069d0ad84c7606ea2:WebRoot/jsp/frontside/user/login.jsp
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
            <form action="loginAction" method="post" id="registrationForm" class="form-horizontal"
                                                  data-bv-message="This value is not valid"
                                                  data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
                                                  data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
                                                  data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
            <div class="loginbox-textbox">
<<<<<<< HEAD:WebRoot/jsp/login.jsp
                <input type="text" name="user.email" class="form-control" placeholder="账户" 
                data-bv-notempty="true"
                data-bv-notempty-message="The first name is required and cannot be empty"/>
=======
                <s:textfield id="email" name="user.email" cssClass="form-control" placeholder="账户" />
>>>>>>> e7b17987db58c98cf21917e069d0ad84c7606ea2:WebRoot/jsp/frontside/user/login.jsp
            </div>
            <div class="loginbox-textbox">
                <s:password id="password" name="user.password" cssClass="form-control" placeholder="密码" />
            </div>
            <div class="loginbox-forgot">
                <a href="">忘记密码?</a>
            </div>
            <div class="loginbox-submit">
                <s:submit id="loginButton" cssClass="btn btn-primary pull-right" value="登录"/>
            </div>
            <!-- </form> -->
        </div>
    </div>

    <!--Basic Scripts-->
    <script src="assets/js/jquery-2.0.3.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <!--Beyond Scripts-->
    <script src="assets/js/beyond.js"></script>

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
<<<<<<< HEAD:WebRoot/jsp/login.jsp
    
    <!--Page Related Scripts-->
    <script src="assets/js/validation/bootstrapValidator.js"></script>

    <script>
        $(document).ready(function () {

            $("#registrationForm").bootstrapValidator();

        });
    </script>
=======
    <script src="js/frontside/user/login.js" ></script>
>>>>>>> e7b17987db58c98cf21917e069d0ad84c7606ea2:WebRoot/jsp/frontside/user/login.jsp
</body>
<!--Body Ends-->
</html>

