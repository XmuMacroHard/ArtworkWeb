<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Amaze, premium HTML5 &amp; CSS3 template</title>

<!-- Favicons Icon -->
<link rel="icon" href="http://demo.magikthemes.com/skin/frontend/base/default/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="http://demo.magikthemes.com/skin/frontend/base/default/favicon.ico" type="image/x-icon" />

<!-- Mobile Specific -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS Style -->

<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
<link rel="stylesheet" href="css/owl.theme.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.css" type="text/css">

<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Roboto:400,500,700' rel='stylesheet' type='text/css'>
</head>
<body>
<div class="page">
  <c:import url="../common/header.jsp"/>
  
  <!-- breadcrumbs -->
  
  <div class="breadcrumbs">
    <div class="container">
      <div class="row">
        <ul>
<%--           <li class="home"> <a title="Go to Home Page" href="http://www.magikcommerce.com/"></a><span>&mdash;›</span></li>
          <li class="category13"><strong></strong></li> --%>
        </ul>
      </div>
    </div>
  </div>
  <!-- main-container -->
  <div class="main-container col2-right-layout">
    <div class="main container">
      <div class="row">
        <section class="col-main col-sm-9 wow">          
          <div class="static-contain">
		  <div class="page-title new_page_title">
            <h2>艺术家认证</h2>
          </div>
          <div>
          	<c:choose>
          	<c:when test = "${sessionScope.rank == 'user'}">
			  <form class="form-horizontal" action="submitArtist" method="POST" enctype="multipart/form-data" onsubmit="return checkartistsubmit()">
  				  <div class="form-group">
  				  	<label class="col-sm-2 control-label" >真实姓名</label>
  				  	<div class="col-sm-10" >
  				  		<input class="form-control" name="artist.realName" onblur="checkartistname()"/>
  				  		<span class="text-danger" id="artistnameTip"></span>
  				  	</div>
  				  </div>
				  <div class="form-group">
  				  	<label class="col-sm-2 control-label">简短介绍</label>
  				  	<div class="col-sm-10">
  				  		<textarea class="form-control" name="artist.introduction" rows="5"></textarea>
  				  	</div>
  				  </div>
    			  <div class="form-group">
    			    <label class="col-sm-2 control-label">类别</label>
    			    <div class="col-sm-10">
	              	    <s:checkbox name="artist.identification" label="书法" fieldValue="calligraphy"/>
	    				<s:checkbox name="artist.identification" label="绘画" fieldValue="painting"/>
	    				<s:checkbox name="artist.identification" label="雕刻" fieldValue="sculpture"/>
	     				<s:checkbox name="artist.identification" label="手工品" fieldValue="handicraft"/>
     				</div>
     			  </div>
     			 <div class="form-group"><label class="col-sm-2 control-label">头像</label><s:file name="pic"/>
     			 <span class="text-danger" id="artistproTip"></span></div>   					
   				 <div class="form-group"><label class="col-sm-2 control-label">资料</label><s:file name="pic"/>
   				 <span class="text-danger" id="artistfileTip"></span></div>   					
   				 <div class="form-group"><label class="col-sm-2 control-label"></label><button class="btn btn-info" type="submit">认证</button></div>
   				</form>
   			</c:when>
   			<c:otherwise>
   				<div><label class="col-sm-2 control-label">认证状态</label><div class="col-sm-10"><span class="label label-success">认证成功</span></div></div>				
   			</c:otherwise>	
   			</c:choose>
   		  </div>
          </div>
        </section>

      </div>
    </div>
  </div>
  <!--End main-container --> 

<!-- JavaScript --> 
<script type="text/javascript" src="js/jquery.min.js"></script> 
<script type="text/javascript" src="js/bootstrap.min.js"></script> 
 
<script type="text/javascript" src="js/common.js"></script> 
<script type="text/javascript" src="js/owl.carousel.min.js"></script>
<script>
			new UISearch( document.getElementById( 'form-search' ) );
		</script>
</body>
</html>