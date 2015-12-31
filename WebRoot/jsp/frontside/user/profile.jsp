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

        </ul>
      </div>
    </div>
  </div>
  <!-- End breadcrumbs --> 
  <!-- Two columns content -->
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
  				  		<c:when test="${sessionScope.rank == 'artist'}">
  				  			<input name="rank" class="form-control" value="艺术家" readonly/>	
  				  		</c:when>
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
      </div>
    </div>
  </div>
  <!-- End Two columns content --> 
  
</div>
<div class="help_slider">
  <div class="text alignleft">Need Help?</div>
  <div class="icons"> <a class="show_hide" id="questionbox-side-phonebutton" href="javascript:void(0)"><i class="icon-phones">&nbsp;</i></a> <a class="show_hide1" id="questionbox-side-emailbutton" href="javascript:void(0)"><i class="icon-email">&nbsp;</i></a> </div>
</div>
<div id="hideShow" class="right-side-content" style="display: none">
  <!--Contact Static Block -->
  <div class="slider-phone active">
    <h2 class="">Talk To Us</h2>
    <h3 class="">Available 24/7</h3>
    <p class="textcenter"> Want to speak to someone? We're here 24/7 to answer any questions. Just call!<br>
      <br>
      <span class="phone-number"> +1 800 123 1234</span></p>
    <a id="hideDiv" class="slider-close" href="javascript:void(0)"></a> </div>
  <div class="slider-email hidden">
    <h2 class="">Let us know how we can help you.</h2>
    <form action="#" enctype="application/x-www-form-urlencoded" method="post" id="form-contact-help_slider">
      <div class="column sixty">
        <div class="">
          <ul>
            <li>
              <label>First Name</label>
              <input type="text" name="FirstName" class="required-entry">
              <div class="clearfix"></div>
            </li>
            <li>
              <label>Last Name</label>
              <input type="text" name="LastName" class="required-entry">
              <div class="clearfix"></div>
            </li>
            <li>
              <label>Email Address</label>
              <input type="email" name="Email" class="required-entry">
              <div class="clearfix"></div>
            </li>
            <li>
              <label>Phone Number</label>
              <input type="text" name="Phone">
              <div class="clearfix"></div>
            </li>
          </ul>
        </div>
      </div>
      <div class="column fourty last">
        <div class="padding">
          <textarea name="Contact_Form_Message__c" class="required-entry">How can we help you?</textarea>
          <div class="textright">
            <button class="button btn-sent" title="Add to Cart" type="button"><span>Send</span></button>
          </div>
        </div>
      </div>
    </form>
    <div class="clearfix"></div>
    <a class="slider-close" href="#"></a></div>
</div>
<div id="hideShow1" style="display: none;">
  <div class="right-side-content hidden1">
    <div class="slider-email active">
      <div id="messages_product_view"></div>
      <div id="formSuccess" style="display:none;">Your inquiry was submitted and will be responded to as soon as possible. Thank you for contacting us.</div>
      <form id="contactForm1" method="post">
        <div class="column sixty">
          <h2>TALK TO US</h2>
          <ul>
            <li>
              <label>Name<em class="required">*</em></label>
              <input name="name" id="name" title="Name" value="" class="input-text required-entry" type="text">
            </li>
            <li>
              <label>Email<em class="required">*</em></label>
              <input name="email" id="email" title="Email" value="" class="input-text required-entry validate-email" type="text">
            </li>
            <li>
              <label>Telephone</label>
              <input name="telephone" id="telephone" title="Telephone" value="" class="input-text" type="text">
            </li>
          </ul>
		  <p class="required">* Required Fields</p>
        </div>
        <!--column sixty-->
        <div class="column fourty last">
          <div class="padding">
            <label>Comment<em class="required">*</em></label>
            <textarea name="comment" title="Comment" class="required-entry input-text" cols="5" rows="3"></textarea>
            <div class="textright">
              <input type="text" name="hideit" value="" style="display:none !important;">
              <button type="submit" title="Submit" class="button btn-sent"><span>Submit</span></button>
              <img src="images/mgkloading1.gif" alt="loader" id="loader" style="display:none;"> </div>
            <!--textright-->
          </div>
          <!--padding-->
        </div>
        <!--column fourty last-->
      </form>
      <a href="javascript:void(0)" id="hideDiv1" class="slider-close"></a> </div>
    <!--slider-email active-->
  </div>
  <!--right-side-content hidden1-->
</div>
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