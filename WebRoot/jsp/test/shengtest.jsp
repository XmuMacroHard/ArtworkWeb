<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'shengtest.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<!-- Favicons Icon -->
<link rel="icon" href="http://demo.magikthemes.com/skin/frontend/base/default/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="http://demo.magikthemes.com/skin/frontend/base/default/favicon.ico" type="image/x-icon" />

<!-- Mobile Specific -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS Style -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/revslider.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
<link rel="stylesheet" href="css/owl.theme.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">

<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,300,700,800,400,600' rel='stylesheet' type='text/css'>

  </head>
  
  <body>
    This is my JSP page. <br>
    <a href="ShowAllUserList.action">用户列表</a><br>
    <a href="ShowAllInfoList.action">资讯列表</a><br>
    <a href="ShowAllArtistList.action">艺术家列表</a><br><br><br>
    
    <a href="ShowAllAddressList.action">地址列表</a><br><br><br>
    
    <a href="showArtist.action">艺术家列表</a><br>
    <a href="findArtist.action?user.id=3">艺术家1</a><br>
     <a href="getArtistBySort.action?artist.identification=4">艺术家列表(类别包含4)</a><br>
      <a href="getArtistByName.action?artist.realName=1">艺术家列表(名字包含1)</a><br>
      <a href="jsp/test/shengsubmitArtist.jsp">艺术家认证</a><br>
      <a href="jsp/test/shengusercustomization.jsp?artist.id=3">我要定制</a><br>
      <a href="jsp/test/shengaffirmorder.jsp">确认订单</a><br>
      <a href="jsp/test/shengrecharge.jsp">我要充值</a><br>
      <a href="jsp/test/shengpayment.jsp">我要付款</a><br>
      
      <div class="btn-group">
			  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    Action <span class="caret"></span>
			  </button>
			  <ul class="dropdown-menu">
                      <li><a href="javascript:onload(1,'calligraphy')">书法</a></li>
                      <li><a href="javascript:onload(1,'painting')">绘画</a></li>
                      <li><a href="javascript:onload(1,'sculpture')">雕刻</a></li>
                      <li><a href="javascript:onload(1,'handicraft')">手工品</a></li>
                    </ul>

                </div>
                <!-- JavaScript --> 
<script type="text/javascript" src="js/jquery.min.js"></script> 
<script type="text/javascript" src="js/bootstrap.min.js"></script> 
<script type="text/javascript" src="js/common.js"></script> 
<script type="text/javascript" src="js/slider.js"></script> 
<script type="text/javascript" src="js/owl.carousel.min.js"></script>
<script type="text/javascript" src="js/frontside/user/home_sale.js"></script> 
<script type="text/javascript">
    //<![CDATA[
	jQuery(function() {
		jQuery(".slideshow").cycle({
			fx: 'scrollHorz', easing: 'easeInOutCubic', timeout: 10000, speedOut: 800, speedIn: 800, sync: 1, pause: 1, fit: 0, 			pager: '#home-slides-pager',
			prev: '#home-slides-prev',
			next: '#home-slides-next'
		});
	});
    //]]>
    </script> 
<script>
			new UISearch( document.getElementById( 'form-search' ) );
		</script>
  </body>
  
</html>
