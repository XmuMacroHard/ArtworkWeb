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
<link rel="stylesheet" href="css/my_frontside.css" type="text/css">

<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Roboto:400,500,700' rel='stylesheet' type='text/css'>
</head>
<body>
<div class="page">
  <c:import url="../common/header.jsp"/>
  <c:set var="server_path" value="http://192.168.199.196:8080/ArtworkWeb" scope="page"/>
  
  <!-- breadcrumbs -->
  
  <div class="breadcrumbs">
    <div class="container">
      <div class="row">
        <ul>
          <li class="home"> <a title="Go to Home Page" href="http://www.magikcommerce.com/">Home</a><span>&mdash;›</span></li>
          <li class="category13"><strong>About Us</strong></li>
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
            <h2>上传定制</h2>
          </div>
          <div>
			  <form class="form-horizontal" action="CustomizationSubmitAction" method="POST" enctype="multipart/form-data" onsubmit="return checkusercustomization()">								
				<div class="form-group">
					<div class="form-group">
  				  	<label class="col-sm-2 control-label" >艺术家</label>
  				  	<div class="col-sm-10" style="width:80%">
  				  		  <input id="artistrm" class="form-control"  placeholder="${artist.realName}"  readonly/>
  				  		  <input id="artistid" class="form-control" name="artist.id" value="${artist.id}" type="hidden"/>
  				  	</div>
  				  	</div>
  				  	
  				  	<div>
  				  	<label class="col-sm-2 control-label" >地址选择</label>
  				  	<div id="address" class="row">
        	 			<c:forEach items="${addressList}" var="address">
        					<div id="${address.id}"  class="col-md-1  wrap"><div><c:out value="${address.province}${address.city}${address.region}"/>(<c:out value="${address.consignee}"/>)</div><hr/><div><c:out value="${address.detailedAdress}"/></div></div>
        	 			</c:forEach>
        	 			<span class="text-danger" id="addressTip"></span>
						<!--hidden input  -->
                      	<input id="addressid" type="hidden" name="address.id" value=""/>
                      	<!--end hidden input  -->
        			</div>
					</div>
					<div class="form-group">
  				  	<label class="col-sm-2 control-label" >定制标题</label>
  				  	<div class="col-sm-10" style="width:80%">
  				  		  <input class="form-control" name="commodity.name" onblur="checkcustitle()"/>
  				  		  <span class="text-danger" id="custitleTip"></span>
  				  	</div>			
  				  	</div>		
					<div class="form-group">
  				  	<label class="col-sm-2 control-label" >商品类别</label>
  				  	<div class="col-sm-10" style="width:80%">
  				  		 <s:radio list="#{'calligraphy':'书法','painting':'绘画','sculpture':'雕刻','handicraft':'手工品'}" name="commodity.type" value="'calligraphy'"/>
  				  	</div>
  				  	</div>
					<div class="form-group">
  				  	<label class="col-sm-2 control-label" >定制价格</label>
  				  	<div class="col-sm-10" style="width:80%">
  				  		 <input class="form-control" name="commodity.price" onblur="checkcusprice()"/>
  				  		 <span class="text-danger" id="cuspriceTip"></span>
  				  	</div>
  				  	</div>
  				    <div class="form-group">
  				  	<label class="col-sm-2 control-label" >详细说明</label>
  				  	<div class="col-sm-10" style="width:80%">
  				  		 <textarea class="form-control" name="commodity.introduction" rows="5" ></textarea>
  				  	</div>
  				  	</div>
  					</div>
  					<label class="col-sm-2 control-label" ></label>  					
  					<div class="form-group">
  						<button id="submitOrderBtn" class="btn btn-info" type="submit">发起定制</button>
  					</div>
   				</form>
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
<script type="text/javascript" src="js/frontside/pay/pay.js"></script> 
<script>
			new UISearch( document.getElementById( 'form-search' ) );
		</script>
</body>
</html>