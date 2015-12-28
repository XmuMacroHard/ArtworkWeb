<%@page import="cn.edu.xmu.artwork.entity.InforPics"%>
<%@page import="cn.edu.xmu.artwork.entity.Information"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
<link rel="stylesheet" href="css/slider.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
<link rel="stylesheet" href="css/owl.theme.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/my_frontside.css" type="text/css">
<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<!-- <script type="text/javascript" src="js/frontside/home/home.js"></script> -->
<!-- JavaScript -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<%-- <script type="text/javascript" src="js/frontside/home/home.js"></script> --%>
</head>
<body>
<div class="page">
  <%-- <c:import url="/jsp/support/constant.jsp"/> --%>
  <c:import url="/jsp/frontside/common/header.jsp"/> 
   
  <!-- Slider -->
  <div class="slider-section">
    <div class="container">
      <div class="row">
        <aside class="cat-block pro-block col-xs-12 col-sm-12 col-md-5">
          <div class="pro1-block">
            <ul id="info_location_1" class="top-cat-box">           		
           		<c:forEach items="${informationList}" var="information" varStatus="i">
	           		<c:if test = "${i.index < 4}"> 
	           		<li>
 							<div>
  	               		 	<c:set var="urlsNum" scope="page" value="1"/>  
							<c:forEach items="${information.inforPicses}" var="pic">   		 	
								<c:if test = "${urlsNum == 1}">
									<img height="100%" width="100%" src="${server_path }${pic.url}"/>
									<c:set var="urlsNum" scope="page" value="2"/>		
								</c:if>
	                     	</c:forEach> 	                     	   
	               		 	</div>
	               		 	<p><h2><c:out value="${information.title}"/></h2></p>   		 	
	               		 	<a href="getDetailInfo?information.id=${information.id}">详情</a>  
	               	</li>
	               	</c:if> 	               	
           		</c:forEach>           			
            </ul>
          </div>
          <!-- //showcase-right -->
        </aside>
        <div class="slider-intro col-lg-7 col-sm-12 col-md-7">
          <div class="the-slideshow slideshow-wrapper">
            <ul id="info_location_2" style="overflow: hidden;" class="slideshow">
            	<c:forEach items="${informationList}" var="information" varStatus = "i">
              		<c:if test="${i.index >= 4 && i.index < 7 }">
              		<li class="slide">
              			<c:set var="urlsNum2" scope="page" value="1"/>
              			<c:forEach items="${information.inforPicses}" var="pic">   		 	
							<c:if test = "${urlsNum2 == 1}">
								<p><a href="#"> <img height="100%" width="100%" src="${server_path}${pic.url}" alt="banner-img"></a></p>
								<c:set var="urlsNum2" scope="page" value="2"/>		
							</c:if>
	               		 </c:forEach>                		                		
            		</li>
            		</c:if>
           		</c:forEach> 
            </ul>
            <a href="#" id="home-slides-prev" class="backward browse-button">previous</a> <a href="#" id="home-slides-next" class="forward browse-button">next</a>
            <div id="home-slides-pager" class="tab-pager tab-pager-img tab-pager-ring-lgray"></div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- end Slider -->
  <!-- offer banner section -->
  <div class="offer-banner-section">
    <div class="container">
      <div class="row">
        <div class="newsletter-wrap">
          <div class="newsletter">
            <form action="#" method="post" id="newsletter-validate-detail">
              <div>
                <h4><span>艺术家推荐</span></h4>
                <button type="submit" title="Subscribe" class="subscribe"><span>艺术品定制</span></button>
              </div>
            </form>
          </div>
        </div>
        <c:forEach items="${artistList}" var = "artist">
        <div class="col-lg-3 col-sm-3 col-xs-12">
          <div class="col" >
          	<img class="img-circle" src="${server_path}${artist.portrait}" alt="offer banner">
          	<div class="textcenter"><span class="label label-default"><c:out value="${artist.realName}"/></span></div>
          </div>
        </div>
        </c:forEach>
      </div>
    </div>
  </div>
  <!-- end banner section -->
  <!-- main container -->
  <section class="main-container col1-layout home-content-container">
    <div class="container">
      <div class="std">
        <div class="best-seller-pro wow bounceInUp animated">
          <div class="slider-items-products">
            <div class="new_title center">
              <h2>艺术品推荐</h2>
            </div>
            <div id="best-seller-slider" class="product-flexslider hidden-buttons">
              <div class="slider-items slider-width-col4">
                
                <c:forEach items="${commodityList}" var="commodity">
                <div class="item">
                  <div class="item-inner">
                    <div class="product-block">
                      <div class="product-image"> <a href="product_detail.html">
                        <figure class="product-display">
                          <div class="new-label new-top-left">New</div>
							<c:set var="urlsNum" scope="page" value="1"/>  
							<c:forEach items="${commodity.commodityPices}" var="pic">   		 	
								<c:if test = "${urlsNum == 1}"> 
									<img src="${server_path}${pic.url}" class="lazyOwl product-mainpic" alt="Product image" style="display: block;"/>
									<c:set var="urlsNum" scope="page" value="2"/> 		
								</c:if> 
	                     	</c:forEach> 
                          
                          <!-- <img class="product-secondpic" alt="Product image" src="products-images/product1.jpg"/> --> 
                        </figure>
                        </a> </div>
                      <div class="product-meta">
                        <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a> <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a> <a href="quick_view.html" class="quickview"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                      </div>
                    </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title"> <a href="product_detail.html" title="Stablished fact reader"> <c:out value="${commodity.name }"/></a> </div>
                        <div class="item-content">
                          <div class="item-price">
                            <div class="price-box">
                              <p class="special-price"> <span class="price-label">Special Price</span> <span class="price"> <c:out value="${ commodity.price}"/> </span> </p>
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
                </c:forEach>
                
              </div>
            </div>
          </div>
        </div>
        <!-- Featured Slider -->
        <div class="featured-pro">
          <div class="slider-items-products">
            <div class="title col-lg-6">
              <div class="new_title center">
                <h2><span>Featured Products</span></h2>
              </div>
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pharetra tristique eros dignissim venenatis. Nam et dolor id arcu efficitur tincidunt quis non nisi. Duis commodo pellentesque quam, id mollis ligula dictum id. Morbi cursus consectetur magna a egestas. Sed eu sagittis leo. Mauris euismod dapibus nisl, at euismod nunc commodo vel. Nulla semper non nisi in placerat. Aenean at nisl eu odio ullamcorper varius non ac ante. Quisque dictum, felis lobortis faucibus ornare, enim mi mollis ex, ac vestibulum neque nibh at nisi. </p>
              <a title="Subscribe" class="view-all" href="#"><span>View All Products</span></a> </div>
            <div id="featured-slider" class="product-flexslider hidden-buttons col-lg-6">
              <div class="slider-items slider-width-col4">
                <div class="item">
                  <div class="item-inner">
                    <div class="item-img">
                      <div class="product-block">
                        <div class="product-image"> <a href="product_detail.html">
                          <figure class="product-display">
                            <div class="new-label new-top-left">New</div>
                            <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt="Product image" style="display: block;"> <img class="product-secondpic" alt="Product image" src="products-images/product1.jpg"> </figure>
                          </a> </div>
                        <div class="product-meta">
                          <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a> <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a> <a href="quick_view.html" class="quickview"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                        </div>
                      </div>
                    </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title"> <a href="product_detail.html" title="Ut tincidunt tortor"> Sample Product</a> </div>
                        <div class="item-content">
                          <div class="item-price">
                            <div class="price-box">
                              <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price"  > $567.00 </span> </p>
                              <p class="special-price"> <span class="price-label">Special Price</span> <span class="price"  > $456.00 </span> </p>
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
                            <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt="Product image" style="display: block;"> <img class="product-secondpic" alt="Product image" src="products-images/product1.jpg"> </figure>
                          </a> </div>
                        <div class="product-meta">
                          <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a> <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a> <a href="quick_view.html" class="quickview"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                        </div>
                      </div>
                    </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title"> <a href="product_detail.html" title="Ut tincidunt tortor"> Sample Product</a> </div>
                        <div class="item-content">
                          <div class="item-price">
                            <div class="price-box">
                              <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price"  > $567.00 </span> </p>
                              <p class="special-price"> <span class="price-label">Special Price</span> <span class="price"  > $456.00 </span> </p>
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
                          <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt="Product image" style="display: block;"> <img class="product-secondpic" alt="Product image" src="products-images/product1.jpg"> </figure>
                        </a> </div>
                      <div class="product-meta">
                        <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a> <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a> <a href="quick_view.html" class="quickview"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                      </div>
                    </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title"> <a href="product_detail.html" title="Stablished fact reader"> Sample Product</a> </div>
                        <div class="item-content">
                          <div class="item-price">
                            <div class="price-box">
                              <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price"  > $100.00 </span> </p>
                              <p class="special-price"> <span class="price-label">Special Price</span> <span class="price"  > $90.00 </span> </p>
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
                          <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt="Product image" style="display: block;"> <img class="product-secondpic" alt="Product image" src="products-images/product1.jpg"> </figure>
                        </a> </div>
                      <div class="product-meta">
                        <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a> <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a> <a href="quick_view.html" class="quickview"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                      </div>
                    </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title"> <a href="product_detail.html" title="Retis lapen casen"> Sample Product</a> </div>
                        <div class="item-content">
                          <div class="item-price">
                            <div class="price-box"> <span class="regular-price"> <span class="price">$125.00</span> </span> </div>
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
                            <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt="Product image" style="display: block;"> <img class="product-secondpic" alt="Product image" src="products-images/product1.jpg"> </figure>
                          </a> </div>
                        <div class="product-meta">
                          <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a> <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a> <a href="quick_view.html" class="quickview"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                        </div>
                      </div>
                    </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title"> <a href="product_detail.html" title="Ut tincidunt tortor"> Sample Product</a> </div>
                        <div class="item-content">
                          <div class="item-price">
                            <div class="price-box">
                              <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price"  > $567.00 </span> </p>
                              <p class="special-price"> <span class="price-label">Special Price</span> <span class="price"  > $456.00 </span> </p>
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
                            <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt="Product image" style="display: block;"> <img class="product-secondpic" alt="Product image" src="products-images/product1.jpg"> </figure>
                          </a> </div>
                        <div class="product-meta">
                          <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a> <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a> <a href="quick_view.html" class="quickview"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                        </div>
                      </div>
                    </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title"> <a href="product_detail.html" title="Ut tincidunt tortor"> Sample Product</a> </div>
                        <div class="item-content">
                          <div class="item-price">
                            <div class="price-box">
                              <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price"  > $567.00 </span> </p>
                              <p class="special-price"> <span class="price-label">Special Price</span> <span class="price"  > $456.00 </span> </p>
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
                          <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt="Product image" style="display: block;"> <img class="product-secondpic" alt="Product image" src="products-images/product1.jpg"> </figure>
                        </a> </div>
                      <div class="product-meta">
                        <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a> <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a> <a href="quick_view.html" class="quickview"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                      </div>
                    </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title"> <a href="product_detail.html" title="Stablished fact reader"> Sample Product</a> </div>
                        <div class="item-content">
                          <div class="item-price">
                            <div class="price-box">
                              <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price"  > $100.00 </span> </p>
                              <p class="special-price"> <span class="price-label">Special Price</span> <span class="price"  > $90.00 </span> </p>
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
              </div>
            </div>
          </div>
        </div>
        <!-- End Featured Slider -->
      </div>
    </div>
  </section>
  <!-- End main container -->
  <!-- Latest Blog -->
  <section class="latest-blog container">
    <div class="blog_post">
      <div class="blog-title">
        <h2><span>Latest Blog</span></h2>
      </div>
      <div class="col-xs-12 col-sm-4">
        <div class="blog-img"> <img src="images/blog-img1.jpg" alt="blog image">
          <div class="mask"> <a class="info" href="blog_detail.html">Read More</a> </div>
        </div>
        <h2><a href="blog_detail.html">Pellentesque habitant morbi</a> </h2>
        <div class="post-date"><i class="icon-calendar"></i> Apr 10, 2014</div>
        <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce sit  ... </p>
      </div>
      <div class="col-xs-12 col-sm-4">
        <div class="blog-img"> <img src="images/blog-img1.jpg" alt="blog image">
          <div class="mask"> <a class="info" href="blog_detail.html">Read More</a> </div>
        </div>
        <h2><a href="blog_detail.html">Pellentesque habitant morbi</a> </h2>
        <div class="post-date"><i class="icon-calendar"></i> Apr 10, 2014</div>
        <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce sit  ... </p>
      </div>
      <div class="col-xs-12 col-sm-4">
        <div class="blog-img"> <img src="images/blog-img1.jpg" alt="blog image">
          <div class="mask"> <a class="info" href="blog_detail.html">Read More</a> </div>
        </div>
        <h2><a href="blog_detail.html">Pellentesque habitant morbi</a> </h2>
        <div class="post-date"><i class="icon-calendar"></i> Apr 10, 2014</div>
        <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce sit  ... </p>
      </div>
    </div>
  </section>
  <!-- End Latest Blog -->

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

