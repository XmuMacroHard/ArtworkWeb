<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
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

<body>
<div class="page">
<c:import url="../common/header.jsp"/>
<c:set var="server_path" value="http://localhost:8080/ArtworkWeb" scope="page"/>
  
<section class="main-container col1-layout">
  <div class="main container">
    <div class="col-main">
      <div class="cart">     
      
        <div class="page-title">
          <h2>购物车</h2>
        </div>
        
		 <form method="post" action="placeOrder" onsubmit="return checkplaceOrder()">
        <div class="table-responsive">
            <!-- <input type="hidden" value="Vwww7itR3zQFe86m" name="form_key"/> -->
             <!-- <fieldset>  -->
              <table class="data-table cart-table" id="shopping-cart-table">
                
                <thead>
                  <tr class="first last">
                  	<th rowspan="1"><input  id="chooseallcard" type="checkbox" value="全选"/>全选</th>
                    <th rowspan="1">艺术品图</th>
                    <th rowspan="1"><span class="nobr">艺术品名</span></th>                    
                    <th colspan="1" class="a-center"><span class="nobr">价格</span></th>
                    <th class="a-center" rowspan="1">&nbsp;</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr class="first last">
                    <td class="a-right last" colspan="50"><button onClick="{location.href='jsp/frontside/sale/home_sale.jsp'}" class="button btn-continue" title="Continue Shopping" type="button"><span><span>继续购物</span></span></button>
                      <!-- <button class="button btn-update" title="Update Cart" value="update_qty" name="update_cart_action" type="submit"><span><span>刷新购物车</span></span></button></td> -->
                      <!-- <button id="place_order_button" class="button btn-proceed-checkout" title="Proceed to Checkout" type="submit"><span>结算</span></button> -->
                  </tr>
                </tfoot>
                <tbody>
                <c:forEach items="${shoppingCart}" var="cartItem">
                  <tr class="first odd">
					          <td class="a-center"><input  name="commodityid" type="checkbox" value="${cartItem.commodity.id}"/></td>
                    <td class="image">
                     	<a class="product-image" title="Sample Product" href="getDetailedCommodity?commodity.id=${cartItem.commodity.id}">
							         <c:set var="urlsNum" scope="page" value="1"/>  
							         <c:forEach items="${cartItem.commodity.commodityPices}" var="pic">   		 	
								          <c:if test = "${urlsNum == 1}">
									         <img width="75" alt="Sample Product" src="${server_path}${pic.url}"> 
									         <c:set var="urlsNum" scope="page" value="2"/>		
								          </c:if>
	                     	</c:forEach> 
                    	</a> 
                    </td>
                    <td><h2 class="product-name"> <a href="getDetailedCommodity?commodity.id=${cartItem.commodity.id}"><c:out value="${cartItem.commodity.name}"/></a> </h2></td>
                    <td class="a-right"><span class="cart-price"> <span id="${cartItem.commodity.id}" class="price"><c:out value="${cartItem.commodity.price}"/></span> </span></td>
                    <td class="a-center last"><a class="button remove-item" title="Remove item" href="deleteFromCart.action?commodity.id=${cartItem.commodity.id}" onclick="return confirm('确定删除该商品？');">
                    <span><span>Remove item</span></span></a></td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
             <!-- </fieldset>  --> 
        </div>
        <!-- <button id="place_order_button" class="button btn-proceed-checkout" title="Proceed to Checkout" type="submit"><span>结算</span></button> -->
        <!-- BEGIN CART COLLATERALS -->
        <div class="cart-collaterals row">
          <div class="totals col-sm-4">
            <h3>总计</h3>
            <div class="inner">
              <table class="table shopping-cart-table-total" id="shopping-cart-totals-table">
               
                <tfoot>
                  <tr>
                    <td colspan="1" class="a-left" style=""><strong>合计</strong></td>
                    <td class="a-right" style=""><strong><span id="total_price" class="price">0</span>&nbsp;(元)</strong></td>
                  </tr>
				        	<tr>
                    <td colspan="1" class="a-left" style=""><strong>数量</strong></td>
                    <td class="a-right" style=""><strong><span id="total_num" class="price">0</span>&nbsp;(件)</strong></td>
                  </tr>
                </tfoot>
              </table>    
            </div>
            <!--inner-->           
          </div>
        </div>
        <button id="place_order_button" class="button btn-proceed-checkout" title="Proceed to Checkout" type="submit"><span>结算</span></button>
		</form> 
       
      </div>
    </div>
  </div>
</section>

</div>
<div class="help_slider">
  <div class="text alignleft">Need Help?</div>
  <div class="icons"> <a class="show_hide" id="questionbox-side-phonebutton" href="javascript:void(0)"><i class="icon-phones">&nbsp;</i></a> <a class="show_hide1" id="questionbox-side-emailbutton" href="javascript:void(0)"><i class="icon-email">&nbsp;</i></a> </div>
</div>
<div id="hideShow" class="right-side-content" style="display: none;">
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
      <form action="#" id="contactForm1" method="post">
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
<script type="text/javascript" src="js/frontside/user/shopping_cart.js"></script>
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