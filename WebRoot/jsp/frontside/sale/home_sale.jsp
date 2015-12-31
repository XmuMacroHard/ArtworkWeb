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
          <li class="home"> <a href="index.html" title="Go to Home Page">Home</a><span>&raquo;</span></li>
          <li class=""> <a href="grid.html" title="Go to Home Page">Women</a><span>&raquo;</span></li>
          <li class="category13"><strong>Tops &amp; Tees</strong></li>
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
            <h1>Tops &amp; Tees</h1>
          </div>
          <div class="category-description std">
            <div class="slider-items-products">
              <div id="category-desc-slider" class="product-flexslider hidden-buttons">
                <div class="slider-items slider-width-col1"> 
                  
                  <!-- Item -->
                  <div class="item"> <a href="#x"><img alt="women_banner" src="images/women_banner.png"></a>
                    <div class="cat-img-title cat-bg cat-box">
                      <h2 class="cat-heading">Category Banner</h2>
                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                  </div>
                  <!-- End Item --> 
                  
                  <!-- Item -->
                  <div class="item"> <a href="#x"><img alt="women_banner" src="images/women_banner.png"></a> </div>
                  <!-- End Item --> 
                </div>
              </div>
            </div>
          </div>
          <div class="category-products">
            <div class="toolbar">
              <div>
               	<div class="btn-group">
			  		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			    		按类别<span class="caret"></span>
			  		</button>
			 		<ul class="dropdown-menu">
                      <li><a href="javascript:onload(1,'calligraphy')">书法</a></li>
                      <li><a href="javascript:onload(1,'painting')">绘画</a></li>
                      <li><a href="javascript:onload(1,'sculpture')">雕刻</a></li>
                      <li><a href="javascript:onload(1,'handicraft')">手工品</a></li>
                    </ul>

                  </div>
                  <span id="commoditysort"></span>
                 </div>
              <div class="pager">
                <div class="pages">
                  <label>Page:</label>
                  <ul class="pagination" id="page_list">
                  </ul>
                </div>
              </div>
            </div>
            <!-- commodity list -->
            <ul class="products-grid" id="commodity_list">             
	        </ul>
	        <!--end commodity list -->
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