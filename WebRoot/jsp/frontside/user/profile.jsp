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
  <c:set var="server_path" value="http://localhost:8080/ArtworkWeb" scope="page"/>
  
  <!-- main-container -->
  <div class="main-container col2-right-layout">
    <div class="main container">
      <div class="row">
        <section class="col-main col-sm-9 wow">          
          <div class="static-contain">
		  <div class="page-title new_page_title">
            <h2>个人信息  
            </h2>
           <!-- <input id="user_choose" class="btn btn-default" style="margin-left:60%" type="button" value="修改密码" onclick="choose()"> -->
           <s:submit id="user_choose" cssClass="btn btn-primary pull-right" value="修改密码" onclick="choose()"/>
          </div>
          <div>
          <div  id="user_information" class="form-horizontal">
				<div class="form-group">
  				  	<label class="col-sm-2 control-label" >个人身份</label>
  				  	<div class="col-sm-10" style="width:80%">
  				  	<c:choose>
  				  		<c:when test="${sessionScope.rank == 'user'}">
  				  			<input name="rank" class="form-control" value="普通用户" readonly/>
  				  		</c:when>
  				  		<c:otherwise>
  				  			<input name="rank" class="form-control" value="艺术家" readonly/>	
  				  		</c:otherwise>
  				  	</c:choose>
  				  	</div>
  				  </div>
  				  
  				  <div class="form-group">
  				  	<label class="col-sm-2 control-label" >邮箱</label>
  				  	<div class="col-sm-10" style="width:80%">
  				  		<input class="form-control" name="user.email" placeholder="${sessionScope.user.email}" readonly/>
  				  	</div>
  				  </div>
  				  <div class="form-group">
  				  	<label class="col-sm-2 control-label" >余额</label>
  				  	<div class="col-sm-10" style="width:80%">
  				  		<input class="form-control" name="user.balance" value="${sessionScope.user.balance}" readonly/>
  				  	</div>
  				  </div>	
  				  <div class="form-group">
  				  	<label class="col-sm-2 control-label" >电话号码</label>
  				  	<div class="col-sm-10" style="width:80%">
  				  		<input class="form-control" name="user.phone" value="${sessionScope.user.phone}" onblur="checkphone()" readonly/>
  				  		<span class="text-danger" id="phoneTip"></span>
  				  	</div>
  				  </div>					
  				  <c:if test="${sessionScope.rank == 'artist'}">
					<div class="form-group">
  				  	<label class="col-sm-2 control-label" >真实照片</label>
  				  	<div class="col-sm-10" style="width:80%">
  				  		 <img width="40%" height="40%" src="${server_path}${sessionScope.user.portrait}" class="img-rounded"/>
  				  	</div>			
  				  	</div>		
					<div class="form-group">
  				  	<label class="col-sm-2 control-label" >真实姓名</label>
  				  	<div class="col-sm-10" style="width:80%">
  				  		 <input class="form-control" name="artist.realName" placeholder="${sessionScope.user.realName}" readonly/>
  				  	</div>
  				  	</div>
  				    <div class="form-group">
  				  	<label class="col-sm-2 control-label" >个人简介</label>
  				  	<div class="col-sm-10" style="width:80%">
  				  		 <textarea class="form-control" name="artist.introduction" rows="5" readonly>${sessionScope.user.introduction}</textarea>
  				  	</div>
  				  	</div>
  				  </c:if>
  				 <s:submit id="modifyButton" cssClass="btn btn-primary pull-right" value="修改信息" onclick="Checkmodifyinfo()"/>
   		  </div>
   		  </div>
   		  
   		  <div class="form-horizontal" style="display:none;" id="changepassword">
          <div class="form-group">
  				  	<label class="col-sm-2 control-label" >原密码</label>
  				  	<div class="col-sm-10" style="width:80%">
					<s:password name="user.password" cssClass="form-control" placeholder="原密码" onblur="Checkpass()"/>
                	<span class="text-danger" id="passwordTip"></span>
  				  	</div>
  				  </div>
  			<div class="form-group">
  				  	<label class="col-sm-2 control-label" >新密码</label>
  				  	<div class="col-sm-10" style="width:80%">
					<s:password name="newpassword" cssClass="form-control" placeholder="新密码" onblur="Checknewpass()"/>
                	<span class="text-danger" id="newpasswordTip"></span>
  				  	</div>
  				  </div>
  			<div class="form-group">
  				  	<label class="col-sm-2 control-label" >确认密码</label>
  				  	<div class="col-sm-10" style="width:80%">
					<s:password name="comfirmpassword" cssClass="form-control" placeholder="确认密码" onblur="Checkcomfirmpass()"/>
                	<span class="text-danger" id="comfirmpasswordTip"></span>
  				  	</div>
  				  </div>
  			<s:submit id="alterButton" cssClass="btn btn-primary pull-right" value="保存修改"/>
          </div>
          </div>
        </section>
        <aside class="col-right sidebar col-sm-3 wow">
          <div class="block block-company">
            <div class="block-title">Company </div>
            <div class="block-content">
              <ol id="recently-viewed-items">
                <li class="item odd"><a href="about_us.html">About Us</a></li>
                <li class="item even"><a href="sitemap.html">Sitemap</a></li>
                <li class="item  odd"><a href="#">Terms of Service</a></li>
                <li class="item even"><a href="#">Search Terms</a></li>
                <li class="item last"><strong>Contact Us</strong></li>
              </ol>
            </div>
          </div>
        </aside>
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
	<script src="js/frontside/user/user_information.js" ></script>
</body>
</html>