<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="server_path" value="http://localhost:8080/ArtworkWeb" scope="page"/>

<!DOCTYPE html>
<html lang="en">
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
<link rel="stylesheet" href="css/revslider.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
<link rel="stylesheet" href="css/owl.theme.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/my_frontside.css" type="text/css">

<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,300,700,800,400,600' rel='stylesheet' type='text/css'>
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
  <div class="main-container col2-left-layout">
    <div class="main container">
      <div class="row">
        <section class="col-sm-9 col-sm-push-3">
        <div class="col-main">
         <div class="category-title">
            <h1 id = "orderTypeTitle">订单号<br/><span><c:out value="${purchaseOrder.orderid}"/></span></h1>
          </div> 
			
          <hr/>
          <!-- 买家 与卖家 -->
          <div>买家:<c:out value="${purchaseOrder.user.email}"/></div>
          <div>卖家:<c:out value="${purchaseOrder.artist.realName}"/></div>
          <!--end 买家  与卖家 -->
          <hr/>          
          <!-- 收货地址 -->
       	  <div>收获地址:<c:out value="${purchaseOrder.shippingAddress.province}${purchaseOrder.shippingAddress.city}${purchaseOrder.shippingAddress.region}"/></div>
          <div>收获人:<c:out value="${purchaseOrder.shippingAddress.consignee}"/></div>
          <div>收获人电话:<c:out value="${purchaseOrder.shippingAddress.phone}"/></div> 
          <!--end 收货地址 -->
          <hr/>
          
          <c:if test = "${purchaseOrder.state != '4'}">
          <!-- 买家付款状态 -->
            <div class="category-products">
          	        <div class="table-responsive">
             <!-- <input type="hidden" value="Vwww7itR3zQFe86m" name="form_key"/> -->
             <!-- <fieldset>  -->
              <table class="data-table cart-table" id="shopping-cart-table">
                
                <thead>
                  <tr class="first last">
                    <th rowspan="1">分期付款</th>
                    <th rowspan="1"><span class="nobr">付款金额</span></th>                    
                    <th colspan="1" class="a-center"><span class="nobr">付款状态</span></th>
                  </tr>
                </thead>
                <tbody>
                <c:set var="paymentNum" scope = "page" value="1"/>
                <c:forEach items="${purchaseOrder.payments}" var="payment" >
                  <tr class="first odd">
                    <td class="a-right"><span class="cart-price"> <span class="price">第<c:out value="${paymentNum}"/>次支付</span> </span></td>
                    <td class="a-right"><span class="cart-price"> <span class="price"><c:out value="${payment.money}"/></span> </span></td>
                    <td class="a-right">
                    	<span class="cart-price">
                    		<c:if test="${payment.state == 1}"> 
                    		<span class="price">已付款</span>
                    		</c:if>
							<c:if test="${payment.state == 0}"> 
                    		<span class="price">未付款</span>
                    		</c:if>
                    	</span>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
             <!-- </fieldset>  --> 
        	</div>        	
        	</div>
          <!-- 买家付款状态 -->          
          </c:if>
          <hr/>
          <!-- 商品详情 -->
          <div class="category-products">
          	        <div class="table-responsive">
             <!-- <input type="hidden" value="Vwww7itR3zQFe86m" name="form_key"/> -->
             <!-- <fieldset>  -->
              <table class="data-table cart-table" id="shopping-cart-table">
                
                <thead>
                  <tr class="first last">
                    <th rowspan="1">艺术品图</th>
                    <th rowspan="1"><span class="nobr">艺术品名</span></th>                    
                    <th colspan="1" class="a-center"><span class="nobr">价格</span></th>
                  </tr>
                </thead>
                <tfoot>
                  <tr class="first last">
                    <td class="a-right last" colspan="50">
                      <button onClick="{location.href='jsp/frontside/artist/my_purchase_order.jsp'}" class="button btn-continue" title="Continue Shopping" type="button"><span><span>返回</span></span></button>
					  <c:choose>
					  	<c:when test="${purchaseOrder.state == '0'}">
					  	</c:when> 
						<c:when test="${purchaseOrder.state == '1'}">
							<button id="empty_cart_button" class="button btn-empty" onClick="{location.href='dispatch'}" title="Clear Cart" value="empty_cart" name="update_cart_action" type="submit"><span><span>发货</span></span></button> 
					  	</c:when>
					  	<c:when test="${purchaseOrder.state == '2'}">
					  	</c:when> 		
					  	<c:when test="${purchaseOrder.state == '3'}">
					  	</c:when>
						<c:when test="${purchaseOrder.state == '4'}">	<!-- 待接受 -->
							<button id="" class="button btn-empty" onClick="{location.href=''}" title="Clear Cart" value="empty_cart" name="update_cart_action" type="submit"><span><span>拒绝订单</span></span></button>
							<button id="" class="button btn-empty" onClick="{location.href=''}" title="Clear Cart" value="empty_cart" name="update_cart_action" type="submit"><span><span>接受订单</span></span></button>
					  	</c:when> 							  				  	 
					  </c:choose>                   
                  </tr>
                </tfoot>
                <tbody>
                <c:forEach items="${purchaseOrder.commodity}" var="commodity">
                  <tr class="first odd">
                    <td class="image">
                     	<a class="product-image" title="Sample Product" href="product_detail.html">
							         <c:set var="urlsNum" scope="page" value="1"/>  
							         <c:forEach items="${commodity.commodityPices}" var="pic">   		 	
								          <c:if test = "${urlsNum == 1}">
									         <img width="75" alt="Sample Product" src="${server_path}${pic.url}"> 
									         <c:set var="urlsNum" scope="page" value="2"/>		
								          </c:if>
	                     	</c:forEach> 
                    	</a> 
                    </td>
                    <td><h2 class="product-name"> <a href="getDetailedCommodity?commodity.id=${commodity.id}"><c:out value="${commodity.name}"/></a> </h2></td>
                    <td class="a-right"><span class="cart-price"> <span id="${commodity.id}" class="price"><c:out value="${commodity.price}"/></span> </span></td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
             <!-- </fieldset>  --> 
        </div>
			
          </div>
           <!--end 商品详情 -->
           
           <!-- 按钮 -->
           
           <!--end 按钮 -->
           
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
<script type="text/javascript" src="js/slider.js"></script> 
<script type="text/javascript" src="js/owl.carousel.min.js"></script>
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