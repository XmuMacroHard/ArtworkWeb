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
            <h2>修改商品信息
            </h2>
           <!-- <input id="user_choose" class="btn btn-default" style="margin-left:60%" type="button" value="修改密码" onclick="choose()"> -->
           <s:submit cssClass="btn btn-primary pull-right" value="返回列表" onclick="returnlist()"/>
          </div>
          <div>
          <div  id="user_information" class="form-horizontal">
          <input name="commodity.id" value="${commodity.id}" type="hidden"/>
				<div class="form-group">
  				  	<label class="col-sm-2 control-label" >商品名称</label>
  				  	<div class="col-sm-10" style="width:80%">
  				  	<input name="commodity.name" class="form-control" value="${commodity.name}" onblur="checkcommodityname()" readonly/>	
  				  	<span class="text-danger" id="commoditynameTip"></span>
  				  	</div>
  				  </div>
  				  
  				  <div class="form-group">
  				  	<label class="col-sm-2 control-label" >商品类别</label>
  				  	<div class="col-sm-10" style="width:80%">
  				  	<select title="Country" class="validate-select" id="country" name="commodity.type">
                          <option value="calligraphy" ${commodity.type=='calligraphy'?"selected":""}>书法</option>
                          <option value="painting" ${commodity.type=='painting'?"selected":""}>绘画</option>
                          <option value="sculpture" ${commodity.type=='sculpture'?"selected":""}>雕刻</option>
                          <option value="handicraft" ${commodity.type=='handicraft'?"selected":""}>手工品</option>
                        </select>
                        </div>
  				  </div>	
  				  
  				  <div class="form-group">
  				  	<label class="col-sm-2 control-label" >商品价格</label>
  				  	<div class="col-sm-10" style="width:80%">
  				  		<input class="form-control" name="commodity.price" value="${commodity.price}" onblur="checkcommodityprice()" readonly/>
  				  		<span class="text-danger" id="commoditypriceTip"></span>
  				  	</div>
  				  </div>					
				   <div class="form-group">
  				  	<label class="col-sm-2 control-label" >商品图片</label>
  				  	<div class="col-sm-10" style="width:80%">
  				  	<c:set var="urlsNum" scope="page" value="1"/>  
  				  		 <c:forEach items="${commodity.commodityPices}" var="pic">   		 	
								<c:if test = "${urlsNum == 1}">
									<img width="240" height="180" alt="Softwear Women's Designer" src="${server_path}${pic.url}"> 
									<c:set var="urlsNum" scope="page" value="2"/>		
								</c:if>
	                     	</c:forEach> 
  				  	</div>			
  				  	</div>
  				  	
  				    <div class="form-group">
  				  	<label class="col-sm-2 control-label" >商品介绍</label>
  				  	<div class="col-sm-10" style="width:80%">
  				  		 <textarea class="form-control" name="commodity.introduction" rows="5" onblur="checkcommodityintroduction()" readonly>${commodity.introduction}</textarea>
  				  		<span class="text-danger" id="commodityintroductionTip"></span>
  				  	</div>
  				  	</div>
  				 <s:submit id="modifyButton" cssClass="btn btn-primary pull-right" value="修改信息" onclick="changecommodity()"/>
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
<script type="text/javascript" src="js/frontside/artist/commodity_detail.js"></script> 
<script type="text/javascript" src="js/owl.carousel.min.js"></script>
<script>
			new UISearch( document.getElementById( 'form-search' ) );
		</script>
	<script src="js/frontside/user/user_information.js" ></script>
</body>
</html>