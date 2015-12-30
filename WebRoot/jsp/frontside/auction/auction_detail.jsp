<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
<link rel="stylesheet" href="css/owl.theme.css" type="text/css">
<link rel="stylesheet" href="css/flexslider.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,300,700,800,400,600' rel='stylesheet' type='text/css'>
</head>
<body>
<div class="page">
 <c:set var="server_path" value="http://localhost:8080/ArtworkWeb" scope="page"/>
  <c:import url="../common/header.jsp"/>
  <!-- end breadcrumbs -->
  <div class="breadcrumbs">
    <div class="container">
      <div class="row">
        <ul>
          <li class="home"> <a href="index.html" title="Go to Home Page">Home</a><span>&raquo;</span></li>
          <li class=""> <a href="grid.html" title="Go to Home Page">Women</a><span>&raquo;</span></li>
          <li class="category13"><strong> Sample Product </strong></li>
        </ul>
      </div>
    </div>
  </div>
  <!-- end breadcrumbs -->
  <!-- main-container -->
  <section class="main-container col1-layout">
    <div class="main container">
      <div class="col-main">
        <div class="row">
          <div class="product-view">
            <div class="product-essential">
              <form action="#" method="post" id="product_addtocart_form">
                <input name="form_key" value="6UbXroakyQlbfQzK" type="hidden">
                <div class="product-img-box col-sm-4 col-xs-12">
                  <div class="new-label new-top-left"> New </div>
                  <div class="product-image">
                    <c:set var="urlsNum" scope="page" value="1"/>  
							<c:forEach items="${auction.commodity.commodityPices}" var="pic">   		 	
								<c:if test = "${urlsNum == 1}"> 
                    				<div class="large-image" style="height: 350px"> <a href="products-images/product1.jpg" class="cloud-zoom" id="zoom1" rel="useWrapper: false, adjustY:0, adjustX:20"> <img width="100%" height="100" alt="product-image" src="${server_path }${pic.url}"> </a> </div>
									<c:set var="urlsNum" scope="page" value="2"/> 		
								</c:if> 
	                     	</c:forEach>
	                <div class="flexslider flexslider-thumb">
                      <ul class="previews-list slides">
                      	<c:forEach items="${auction.commodity.commodityPices}" var="pic">
                        	<li><a href='products-images/product1.jpg' class='cloud-zoom-gallery' rel="useZoom: 'zoom1', smallImage: 'products-images/product1.jpg' "><img src="${server_path }${pic.url}" alt="Thumbnail 1"/></a></li>
                        </c:forEach>
                      </ul>
                    </div>
                  </div>
                  <!-- end: more-images -->
                  <div class="clear"></div>
                </div>
                <div class="product-shop col-sm-5 col-xs-12">
                  <div class="product-next-prev"> <a href="#" class="product-next"><span></span></a> <a href="#" class="product-prev"><span></span></a> </div>
                  <div class="product-name">
                    <h1><c:out value="${auction.commodity.name}"/></h1>
                  </div>
                  
                  <div class="ratings">
                    <span>距结束：</span>
                    <span id="t_d" style="color:red">00天</span>
                    <span id="t_h" style="color:red">00时</span>
                    <span id="t_m" style="color:red">00分</span>
                    <span id="t_s" style="color:red">00秒</span>
                  </div>
                  
                  <div class="short-description">
                    <h2>商品简介</h2>
                    <p><c:out value="${auction.commodity.introduction}"/></p>
                    <p>天然水晶肯定不像人造水晶那么完美</p>
                    <p>一般都会有冰裂、棉絮等甚至有手工打磨下的尺寸误差</p>
                    <p>水晶以天然印记记录千秋岁月、万古沧桑</p>
                  </div>
                  <div class="price-block">
                    <div class="price-box">
                      <p class="old-price"> <span class="price-label">起拍价:</span> <span id="old-price-48" class="price"> ￥<c:out value="${auction.startPrice}"/> </span> </p>
                      <p class="special-price"> <span class="price-label">当前价:</span> <span id="product-price-48" class="price" style="color:red"> ￥<c:out value="${auction.currentPrice}"/> </span> </p>
                    </div>
                  </div>
                  <div class="add-to-box">
                    <div class="add-to-cart">
                      <label for="qty">出价金额：</label>
                      <div class="pull-left">
                        <div class="custom pull-left">
                          <button onClick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 0 ) result.value--;return false;" class="reduced items-count" type="button"><i class="icon-minus">&nbsp;</i></button>
                          <input type="text" class="input-text qty" title="Qty" value="0" maxlength="12" id="qty" name="qty">
                          <button onClick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty )) result.value++;return false;" class="increase items-count" type="button"><i class="icon-plus">&nbsp;</i></button>
                        </div>
                      </div>
                      <button id="t_btn" onClick="alert('hello');" class="button btn-cart" title="叫价" type="button"><span><i class="icon-basket"></i> 参与竞价</span></button>
                    </div>
                  </div>
                </div>
              </form>
            </div>
            <div class="product-collateral">
              <ul id="product-detail-tab" class="nav nav-tabs product-tabs">
                <li class="active"> <a href="#product_tabs_description" data-toggle="tab">竞价记录</a> </li>
              </ul>
              <div id="productTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="product_tabs_description">
                  <div class="std">
                    <table class="data-table">
                      <tr>
                        <td><span class="small">￥2000</span></td>
                        <td><span class="small">竞价人</span></td>
                        <td><span class="small">2015/12/29 15:30:00</span></td>
                      </tr>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-sm-12">
              <div class="box-additional">
                <div class="related-pro wow bounceInUp animated">
                  <div class="slider-items-products">
                    <div class="new_title center">
                      <h2>Related Products</h2>
                    </div>
                    <div id="related-products-slider" class="product-flexslider hidden-buttons">
                      <div class="slider-items slider-width-col4">
                        <div class="item">
                          <div class="item-inner">
                            <div class="product-block">
                              <div class="product-image"> <a href="product_detail.html">
                                <figure class="product-display">
                                  <div class="sale-label sale-top-left">Sale</div>
                                  <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt="product-image" style="display: block;"> <img class="product-secondpic" alt="product-image" src="products-images/product1.jpg"> </figure>
                                </a> </div>
                              <div class="product-meta">
                                <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a> <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a> <a href="quick_view.html" class="quickview"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                              </div>
                            </div>
                            <div class="item-info">
                              <div class="info-inner">
                                <div class="item-title"> <a href="#" title="Retis lapen casen"> Sample Product </a> </div>
                                <div class="item-content">
                                  <div class="item-price">
                                    <div class="price-box"> <span class="regular-price" > <span class="price">$125.00</span> </span> </div>
                                  </div>
                                  <div class="rating">
                                    <div class="ratings">
                                      <div class="rating-box">
                                        <div class="rating" style="width:80%"></div>
                                      </div>
                                      <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="item">
                          <div class="item-inner">
                            <div class="item-img">
                              <div class="product-block">
                                <div class="product-image"> <a href="product_detail.html">
                                  <figure class="product-display">
                                    <div class="new-label new-top-left">New</div>
                                    <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt="product-image" style="display: block;"> <img class="product-secondpic" alt="product-image" src="products-images/product1.jpg"> </figure>
                                  </a> </div>
                                <div class="product-meta">
                                  <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a> <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a> <a href="quick_view.html" class="quickview"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                                </div>
                              </div>
                            </div>
                            <div class="item-info">
                              <div class="info-inner">
                                <div class="item-title"> <a href="#" title="Ut tincidunt tortor"> Sample Product </a> </div>
                                <div class="item-content">
                                  <div class="item-price">
                                    <div class="price-box">
                                      <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price" > $567.00 </span> </p>
                                      <p class="special-price"> <span class="price-label">Special Price</span> <span class="price" > $456.00 </span> </p>
                                    </div>
                                  </div>
                                  <div class="rating">
                                    <div class="ratings">
                                      <div class="rating-box">
                                        <div class="rating" style="width:50%"></div>
                                      </div>
                                      <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="item">
                          <div class="item-inner">
                            <div class="item-img">
                              <div class="product-block">
                                <div class="product-image"> <a href="product_detail.html">
                                  <figure class="product-display">
                                    <div class="new-label new-top-left">New</div>
                                    <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt="product-image" style="display: block;"> <img class="product-secondpic" alt="product-image" src="products-images/product1.jpg"> </figure>
                                  </a> </div>
                                <div class="product-meta">
                                  <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a> <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a> <a href="quick_view.html" class="quickview"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                                </div>
                              </div>
                            </div>
                            <div class="item-info">
                              <div class="info-inner">
                                <div class="item-title"> <a href="#" title="Ut tincidunt tortor"> Sample Product </a> </div>
                                <div class="item-content">
                                  <div class="item-price">
                                    <div class="price-box">
                                      <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price" > $567.00 </span> </p>
                                      <p class="special-price"> <span class="price-label">Special Price</span> <span class="price" > $456.00 </span> </p>
                                    </div>
                                  </div>
                                  <div class="rating">
                                    <div class="ratings">
                                      <div class="rating-box">
                                        <div class="rating" style="width:80%"></div>
                                      </div>
                                      <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="item">
                          <div class="item-inner">
                            <div class="product-block">
                              <div class="product-image"> <a href="product_detail.html">
                                <figure class="product-display">
                                  <div class="new-label new-top-left">New</div>
                                  <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt="product-image" style="display: block;"> <img class="product-secondpic" alt="product-image" src="products-images/product1.jpg"> </figure>
                                </a> </div>
                              <div class="product-meta">
                                <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a> <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a> <a href="quick_view.html" class="quickview"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                              </div>
                            </div>
                            <div class="item-info">
                              <div class="info-inner">
                                <div class="item-title"> <a href="#" title="Stablished fact reader"> Sample Product </a> </div>
                                <div class="item-content">
                                  <div class="item-price">
                                    <div class="price-box">
                                      <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price" > $100.00 </span> </p>
                                      <p class="special-price"> <span class="price-label">Special Price</span> <span class="price" > $90.00 </span> </p>
                                    </div>
                                  </div>
                                  <div class="rating">
                                    <div class="ratings">
                                      <div class="rating-box">
                                        <div class="rating" style="width:0%"></div>
                                      </div>
                                      <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="item">
                          <div class="item-inner">
                            <div class="product-block">
                              <div class="product-image"> <a href="product_detail.html">
                                <figure class="product-display">
                                  <div class="sale-label sale-top-left">Sale</div>
                                  <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt="product-image" style="display: block;"> <img class="product-secondpic" alt="product-image" src="products-images/product1.jpg"> </figure>
                                </a> </div>
                              <div class="product-meta">
                                <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a> <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a> <a href="quick_view.html" class="quickview"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                              </div>
                            </div>
                            <div class="item-info">
                              <div class="info-inner">
                                <div class="item-title"> <a href="#" title="Retis lapen casen"> Sample Product </a> </div>
                                <div class="item-content">
                                  <div class="item-price">
                                    <div class="price-box"> <span class="regular-price" > <span class="price">$125.00</span> </span> </div>
                                  </div>
                                  <div class="rating">
                                    <div class="ratings">
                                      <div class="rating-box">
                                        <div class="rating" style="width:80%"></div>
                                      </div>
                                      <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="item">
                          <div class="item-inner">
                            <div class="item-img">
                              <div class="product-block">
                                <div class="product-image"> <a href="product_detail.html">
                                  <figure class="product-display">
                                    <div class="new-label new-top-left">New</div>
                                    <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt="product-image" style="display: block;"> <img class="product-secondpic" alt="product-image" src="products-images/product1.jpg"> </figure>
                                  </a> </div>
                                <div class="product-meta">
                                  <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a> <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a> <a href="quick_view.html" class="quickview"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                                </div>
                              </div>
                            </div>
                            <div class="item-info">
                              <div class="info-inner">
                                <div class="item-title"> <a href="#" title="Ut tincidunt tortor"> Sample Product </a> </div>
                                <div class="item-content">
                                  <div class="item-price">
                                    <div class="price-box">
                                      <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price" > $567.00 </span> </p>
                                      <p class="special-price"> <span class="price-label">Special Price</span> <span class="price" > $456.00 </span> </p>
                                    </div>
                                  </div>
                                  <div class="rating">
                                    <div class="ratings">
                                      <div class="rating-box">
                                        <div class="rating" style="width:50%"></div>
                                      </div>
                                      <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="upsell-pro wow bounceInUp animated">
                  <div class="slider-items-products">
                    <div class="new_title center">
                      <h2>Upsell Products</h2>
                    </div>
                    <div id="upsell-products-slider" class="product-flexslider hidden-buttons">
                      <div class="slider-items slider-width-col4">
                        <div class="item">
                          <div class="item-inner">
                            <div class="product-block">
                              <div class="product-image"> <a href="product_detail.html">
                                <figure class="product-display">
                                  <div class="sale-label sale-top-left">Sale</div>
                                  <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt="product-image" style="display: block;"> <img class="product-secondpic" alt="product-image" src="products-images/product1.jpg"> </figure>
                                </a> </div>
                              <div class="product-meta">
                                <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a> <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a> <a href="quick_view.html" class="quickview"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                              </div>
                            </div>
                            <div class="item-info">
                              <div class="info-inner">
                                <div class="item-title"> <a href="#" title="Retis lapen casen"> Sample Product </a> </div>
                                <div class="item-content">
                                  <div class="item-price">
                                    <div class="price-box"> <span class="regular-price" > <span class="price">$125.00</span> </span> </div>
                                  </div>
                                  <div class="rating">
                                    <div class="ratings">
                                      <div class="rating-box">
                                        <div class="rating" style="width:80%"></div>
                                      </div>
                                      <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="item">
                          <div class="item-inner">
                            <div class="item-img">
                              <div class="product-block">
                                <div class="product-image"> <a href="product_detail.html">
                                  <figure class="product-display">
                                    <div class="new-label new-top-left">New</div>
                                    <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt="product-image" style="display: block;"> <img class="product-secondpic" alt="product-image" src="products-images/product1.jpg"> </figure>
                                  </a> </div>
                                <div class="product-meta">
                                  <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a> <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a> <a href="quick_view.html" class="quickview"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                                </div>
                              </div>
                            </div>
                            <div class="item-info">
                              <div class="info-inner">
                                <div class="item-title"> <a href="#" title="Ut tincidunt tortor"> Sample Product </a> </div>
                                <div class="item-content">
                                  <div class="item-price">
                                    <div class="price-box">
                                      <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price" > $567.00 </span> </p>
                                      <p class="special-price"> <span class="price-label">Special Price</span> <span class="price" > $456.00 </span> </p>
                                    </div>
                                  </div>
                                  <div class="rating">
                                    <div class="ratings">
                                      <div class="rating-box">
                                        <div class="rating" style="width:50%"></div>
                                      </div>
                                      <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="item">
                          <div class="item-inner">
                            <div class="item-img">
                              <div class="product-block">
                                <div class="product-image"> <a href="product_detail.html">
                                  <figure class="product-display">
                                    <div class="sale-label sale-top-right">Sale</div>
                                    <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt="product-image" style="display: block;"> <img class="product-secondpic" alt="product-image" src="products-images/product1.jpg"> </figure>
                                  </a> </div>
                                <div class="product-meta">
                                  <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a> <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a> <a href="quick_view.html" class="quickview"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                                </div>
                              </div>
                            </div>
                            <div class="item-info">
                              <div class="info-inner">
                                <div class="item-title"> <a href="#" title="Ut tincidunt tortor"> Sample Product </a> </div>
                                <div class="item-content">
                                  <div class="item-price">
                                    <div class="price-box">
                                      <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price" > $567.00 </span> </p>
                                      <p class="special-price"> <span class="price-label">Special Price</span> <span class="price" > $456.00 </span> </p>
                                    </div>
                                  </div>
                                  <div class="rating">
                                    <div class="ratings">
                                      <div class="rating-box">
                                        <div class="rating" style="width:80%"></div>
                                      </div>
                                      <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="item">
                          <div class="item-inner">
                            <div class="product-block">
                              <div class="product-image"> <a href="product_detail.html">
                                <figure class="product-display"> <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt="product-image" style="display: block;"> <img class="product-secondpic" alt="product-image" src="products-images/product1.jpg"> </figure>
                                </a> </div>
                              <div class="product-meta">
                                <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a> <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a> <a href="quick_view.html" class="quickview"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                              </div>
                            </div>
                            <div class="item-info">
                              <div class="info-inner">
                                <div class="item-title"> <a href="#" title="Stablished fact reader"> Sample Product </a> </div>
                                <div class="item-content">
                                  <div class="item-price">
                                    <div class="price-box">
                                      <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price" > $100.00 </span> </p>
                                      <p class="special-price"> <span class="price-label">Special Price</span> <span class="price" > $90.00 </span> </p>
                                    </div>
                                  </div>
                                  <div class="rating">
                                    <div class="ratings">
                                      <div class="rating-box">
                                        <div class="rating" style="width:0%"></div>
                                      </div>
                                      <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="item">
                          <div class="item-inner">
                            <div class="product-block">
                              <div class="product-image"> <a href="product_detail.html">
                                <figure class="product-display"> <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt="product-image" style="display: block;"> <img class="product-secondpic" alt="product-image" src="products-images/product1.jpg"> </figure>
                                </a> </div>
                              <div class="product-meta">
                                <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a> <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a> <a href="quick_view.html" class="quickview"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                              </div>
                            </div>
                            <div class="item-info">
                              <div class="info-inner">
                                <div class="item-title"> <a href="#" title="Retis lapen casen"> Sample Product </a> </div>
                                <div class="item-content">
                                  <div class="item-price">
                                    <div class="price-box"> <span class="regular-price" > <span class="price">$125.00</span> </span> </div>
                                  </div>
                                  <div class="rating">
                                    <div class="ratings">
                                      <div class="rating-box">
                                        <div class="rating" style="width:80%"></div>
                                      </div>
                                      <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="item">
                          <div class="item-inner">
                            <div class="item-img">
                              <div class="product-block">
                                <div class="product-image"> <a href="product_detail.html">
                                  <figure class="product-display">
                                    <div class="new-label new-top-left">New</div>
                                    <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt="product-image" style="display: block;"> <img class="product-secondpic" alt="product-image" src="products-images/product1.jpg"> </figure>
                                  </a> </div>
                                <div class="product-meta">
                                  <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a> <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a> <a href="quick_view.html" class="quickview"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                                </div>
                              </div>
                            </div>
                            <div class="item-info">
                              <div class="info-inner">
                                <div class="item-title"> <a href="product_detail.html" title="Ut tincidunt tortor"> Sample Product </a> </div>
                                <div class="item-content">
                                  <div class="item-price">
                                    <div class="price-box">
                                      <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price" > $567.00 </span> </p>
                                      <p class="special-price"> <span class="price-label">Special Price</span> <span class="price" > $456.00 </span> </p>
                                    </div>
                                  </div>
                                  <div class="rating">
                                    <div class="ratings">
                                      <div class="rating-box">
                                        <div class="rating" style="width:50%"></div>
                                      </div>
                                      <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Review</a> </p>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--End main-container -->
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
<script type="text/javascript" src="js/owl.carousel.min.js"></script>
<script type="text/javascript" src="js/jquery.flexslider.js"></script>
<script type="text/javascript" src="js/cloud-zoom.js"></script>
<script type="text/javascript" src="js/frontside/sale/addToCart.js"></script>
<script>
			new UISearch( document.getElementById( 'form-search' ) );
</script>
<script>
                  function GetRTime(){
                    var EndTime= new Date('2016/1/1 19:18:30');
                    var NowTime = new Date();
                    var t =EndTime.getTime() - NowTime.getTime();
                    if(t >= 0)
                    {
                      document.getElementById("t_btn").disabled = false;
                    
                      var d=Math.floor(t/1000/60/60/24);
                      var h=Math.floor(t/1000/60/60%24);
                      var m=Math.floor(t/1000/60%60);
                      var s=Math.floor(t/1000%60);

                      document.getElementById("t_d").innerHTML = d + "天";
                      document.getElementById("t_h").innerHTML = h + "时";
                      document.getElementById("t_m").innerHTML = m + "分";
                      document.getElementById("t_s").innerHTML = s + "秒";
                    }
                    else
                    {
                    	document.getElementById("t_btn").disabled = true;
                    }       
                  }
                  setInterval(GetRTime,0);
</script>
</body>
</html>

