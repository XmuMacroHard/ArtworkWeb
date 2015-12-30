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
                 </div>
              <div class="pager">
                <div class="pages">
                  <label>Page:</label>
                  <ul class="pagination" id="page_list">
                  </ul>
                </div>
              </div>
            </div>
            <!-- auction list -->
            <ul class="products-grid" id="auction_list">
            <s:iterator id="auction" value="#request.auctionList">
            	<li class="item col-lg-4 col-md-3 col-sm-4 col-xs-12">
                  <div class="item-inner">
                    <div class="item-img">
                      <div class="product-block">
                        <div class="product-image"> <a href="showAuctionDetailAction?auction.id=${id}">
                          <figure class="product-display">
                            <div class="new-label new-top-left">New</div>
                            <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt=" Sample Product" style="display: block;"> <img class="product-secondpic" alt=" Sample Product" src="products-images/product1.jpg"> 
                          </figure>
                          </a> </div>
                        <div class="product-meta">
                          <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a>
                 
                            <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a>
                           
                            <a class="quickview" href="javascript:;"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                        </div>
                      </div>
                    </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title"> <a href="showAuctionDetailAction?auction.id=${id}" title="Ut tincidunt tortor"><s:property value="#auction.commodity.name"/></a> </div>
                        <div class="item-content">
                          <div class="item-price">
                            <div class="price-box">
                              <p class="old-price"> <span class="price-label">起拍价：</span> <span class="price" > ￥<s:property value="#auction.startPrice"/> </span> </p>
                              <p class="special-price"> <span class="price-label">当前价：</span> <span class="price" style="color:red" > ￥<s:property value="#auction.currentPrice"/> </span> </p>
                            </div>
                          </div>
                          <div class="rating">
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </li>
            </s:iterator>             
	        </ul>
	        <!--end auction list -->
          </div>
		  </div>
        </section>
        <aside class="col-left sidebar col-sm-3 col-xs-12 col-sm-pull-9 wow bounceInUp animated">
          <div class="side-nav-categories">
            <div class="block-title"> Categories </div>
            <div class="box-content box-category">
              <ul id="magicat">
                <li class="level0- level0 open"> <span class="magicat-cat"><a href="#fashion.html"><span>Women</span></a></span>
                  <ul style="display: none;">
                    <li class="first level1- level1 open"> <span class="magicat-cat"><a href="#new-in.html"><span>New In</span></a></span>
                      <ul style="display: none;">
                        <li class="first level2- level2"> <span class="magicat-cat"><a href="#clothing.html"><span>Clothing</span></a></span> </li>
                        <li class="level2- level2"> <span class="magicat-cat"><a href="#shoes.html"><span>shoes</span></a></span> </li>
                        <li class="level2- level2"> <span class="magicat-cat"><a href="#bags.html"><span>Bags</span></a></span> </li>
                        <li class="last level2- level2"> <span class="magicat-cat"><a href="#watches.html"><span>Watches</span></a></span> </li>
                      </ul>
                    </li>
                    <li class="level1- level1 open"> <span class="magicat-cat"><a href="#formal-wear.html"><span>formal-wear</span></a></span>
                      <ul style="display: none;">
                        <li class="first level2- level2"> <span class="magicat-cat"><a href="#thorts-and-skirts.html"><span>Thorts &amp; Skirts</span></a></span> </li>
                        <li class="level2- level2"> <span class="magicat-cat"><a href="#leggings-jeggings.html"><span>Leggings &amp; Jeggings</span></a></span> </li>
                        <li class="level2- level2 "> <span class="magicat-cat"><a href="#caps-scarves-stoles.html"><span>Caps,Scarves &amp; stoles</span></a></span> </li>
                        <li class="last level2- level2"> <span class="magicat-cat"><a href="#socks-stockings.html"><span>Socks &amp; Stockings</span></a></span> </li>
                      </ul>
                    </li>
                    <li class="level1- level1 open"> <span class="magicat-cat"><a href="#jackets-blazers.html"><span>jackets-blazers</span></a></span>
                      <ul style="display: none;">
                        <li class="first level2- level2"> <span class="magicat-cat"><a href="#sweaters.html"><span>Sweaters</span></a></span> </li>
                        <li class="level2- level2"> <span class="magicat-cat"><a href="#sweat-shirts.html"><span>Sweat Shirts</span></a></span> </li>
                        <li class="level2- level2"> <span class="magicat-cat"><a href="#look-leather.html"><span>Look Leather</span></a></span> </li>
                        <li class="last level2- level2"> <span class="magicat-cat"><a href="#denim.html"><span>Denim</span></a></span> </li>
                      </ul>
                    </li>
                    <li class="level1- level1  open"> <span class="magicat-cat"><a href="#lingerie-sleepwear.html"><span>lingerie-sleepwear</span></a></span>
                      <ul style="display: none;">
                        <li class="first level2- level2"> <span class="magicat-cat"><a href="#bridal-lingerie.html"><span>Bridal Lingerie</span></a></span> </li>
                        <li class="level2- level2"> <span class="magicat-cat"><a href="#babydolls.html"><span>Babydolls</span></a></span> </li>
                        <li class="level2- level2"> <span class="magicat-cat"><a href="#bustiers.html"><span>Bustiers</span></a></span> </li>
                        <li class="last level2- level2"> <span class="magicat-cat"><a href="#panties.html"><span>Panties</span></a></span> </li>
                      </ul>
                    </li>
                    <li class="level1- level1 open"> <span class="magicat-cat"><a href="#ethnic-wear.html"><span>ETHNIC WEAR</span></a></span>
                      <ul style="display: none;">
                        <li class="first level2- level2"> <span class="magicat-cat"><a href="#suits-sets.html"><span>Suits Sets</span></a></span> </li>
                        <li class="level2- level2"> <span class="magicat-cat"><a href="#dress-material.html"><span>Dress Material</span></a></span> </li>
                        <li class="level2- level2"> <span class="magicat-cat"><a href="#sweatshirts.html"><span>Sweatshirts</span></a></span> </li>
                        <li class="last level2- level2"> <span class="magicat-cat"><a href="#gloves.html"><span>Gloves</span></a></span> </li>
                      </ul>
                    </li>
                    <li class="level1- level1 open"> <span class="magicat-cat"><a href="#new-this-week.html"><span>New This Week</span></a></span>
                      <ul style="display: none;">
                        <li class="first level2- level2"> <span class="magicat-cat"><a href="#new-this-week/clothing.html"><span>Clothing</span></a></span> </li>
                        <li class="level2- level2"> <span class="magicat-cat"><a href="#new-this-week/footwear.html"><span>Footwear</span></a></span> </li>
                        <li class="level2- level2"> <span class="magicat-cat"><a href="#new-this-week/accessories.html"><span>Accessories</span></a></span> </li>
                        <li class="last level2- level2"> <span class="magicat-cat"><a href="#new-this-week/sandals.html"><span>Sandals</span></a></span> </li>
                      </ul>
                    </li>
                    <li class="level1- level1 open"> <span class="magicat-cat"><a href="#shop-by-size.html"><span>Shop By Size</span></a></span>
                      <ul style="display: none;">
                        <li class="first level2- level2"> <span class="magicat-cat"><a href="#beauty.html"><span>Beauty</span></a></span> </li>
                        <li class="level2- level2"> <span class="magicat-cat"><a href="#hair-body-care.html"><span>Hair &amp; Body-Care</span></a></span> </li>
                        <li class="level2- level2"> <span class="magicat-cat"><a href="#brand-stores.html"><span>Brand Stores</span></a></span> </li>
                        <li class="last level2- level2"> <span class="magicat-cat"><a href="#sisley.html"><span>Sisley</span></a></span> </li>
                      </ul>
                    </li>
                    <li class="last level1- level1 open"> <span class="magicat-cat"><a href="#girls-apparel.html"><span>Girls Apparel</span></a></span>
                      <ul style="display: none;">
                        <li class="first level2- level2"> <span class="magicat-cat"><a href="#frocks.html"><span>Frocks</span></a></span> </li>
                        <li class="level2- level2"> <span class="magicat-cat"><a href="#tops-t-shirts.html"><span>Tops &amp; T-shirts</span></a></span> </li>
                        <li class="level2- level2"> <span class="magicat-cat"><a href="#bottomwear.html"><span>Bottomwear</span></a></span> </li>
                        <li class="last level2- level2"> <span class="magicat-cat"><a href="#sweaters.html"><span>Sweaters</span></a></span> </li>
                      </ul>
                    </li>
                  </ul>
                </li>
                <li class="level0- level0"> <span class="magicat-cat"><a href="#electronics.html"><span>Men</span></a></span> </li>
                <li class="level0- level0  shoes"> <span class="magicat-cat"><a href="#shoes.html"><span>Shoes</span></a></span> </li>
                <li class="level0- level0  watches open"> <span class="magicat-cat"><a href="#watches.html"><span>Watches</span></a></span>
                  <ul style="display: none;">
                    <li class="first level1- level1 open"> <span class="magicat-cat"><a href="#designers.html"><span>Designers</span></a></span>
                      <ul style="display: none;">
                        <li class="first level2- level2"> <span class="magicat-cat"><a href="#calvin-klein.html"><span>Calvin Klein</span></a></span> </li>
                        <li class="level2- level2"> <span class="magicat-cat"><a href="#emporio-armani.html"><span>Emporio Armani</span></a></span> </li>
                        <li class="level2- level2"> <span class="magicat-cat"><a href="#french-connection.html"><span>French Connection</span></a></span> </li>
                        <li class="last level2- level2"> <span class="magicat-cat"><a href="#hush-puppies.html"><span>Hush Puppies</span></a></span> </li>
                      </ul>
                    </li>
                    <li class="level1- level1 open"> <span class="magicat-cat"><a href="#style.html"><span>Style</span></a></span>
                      <ul style="display: none;">
                        <li class="first level2- level2"> <span class="magicat-cat"><a href="#alba.html"><span>Alba</span></a></span> </li>
                        <li class="level2- level2"> <span class="magicat-cat"><a href="#kenneth-cole.html"><span>Kenneth Cole</span></a></span> </li>
                        <li class="level2- level2"> <span class="magicat-cat"><a href="#morellato.html"><span>Morellato</span></a></span> </li>
                        <li class="last level2- level2"> <span class="magicat-cat"><a href="#timex-premium.html"><span>Timex Premium</span></a></span> </li>
                      </ul>
                    </li>
                    <li class="level1- level1  open"> <span class="magicat-cat"><a href="#specification.html"><span>Specification</span></a></span>
                      <ul style="display: none;">
                        <li class="first level2- level2"> <span class="magicat-cat"><a href="#just-cavalli.html"><span>Just Cavalli</span></a></span> </li>
                        <li class="level2- level2"> <span class="magicat-cat"><a href="#pierre-cardin.html"><span>Pierre Cardin</span></a></span> </li>
                        <li class="level2- level2"> <span class="magicat-cat"><a href="#rotary.html"><span>Rotary</span></a></span> </li>
                        <li class="last level2- level2"> <span class="magicat-cat"><a href="#silitalia.html"><span>Silitalia</span></a></span> </li>
                      </ul>
                    </li>
                    <li class="last level1- level1  open"> <span class="magicat-cat"><a href="#most-popular-brands.html"><span>Most Popular Brands</span></a></span>
                      <ul style="display: none;">
                        <li class="first level2- level2"> <span class="magicat-cat"><a href="#most-popular-brands/citizen.html"><span>Citizen</span></a></span> </li>
                        <li class="level2- level2l"> <span class="magicat-cat"><a href="#most-popular-brands/diesel.html"><span>Diesel</span></a></span> </li>
                        <li class="level2- level2"> <span class="magicat-cat"><a href="#most-popular-brands/dkny.html"><span>DKNY</span></a></span> </li>
                        <li class="last level2- level2"> <span class="magicat-cat"><a href="#most-popular-brands/esprit.html"><span>Esprit</span></a></span> </li>
                      </ul>
                    </li>
                  </ul>
                </li>
                <li class="level0- level0 last"> <span class="magicat-cat"><a href="#furniture.html"><span>Furniture</span></a></span> </li>
              </ul>
            </div>
          </div>
          <div class="block block-layered-nav">
            <div class="block-title">Shop By</div>
            <div class="block-content">
              <p class="block-subtitle">Shopping Options</p>
              <dl id="narrow-by-list">
                <dt class="odd">Price</dt>
                <dd class="odd">
                  <ol>
                    <li> <a href="#"><span class="price">$0.00</span> - <span class="price">$99.99</span></a> (6) </li>
                    <li> <a href="#"><span class="price">$100.00</span> and above</a> (6) </li>
                  </ol>
                </dd>
                <dt class="even">Manufacturer</dt>
                <dd class="even">
                  <ol>
                    <li> <a href="#">TheBrand</a> (9) </li>
                    <li> <a href="#">Company</a> (4) </li>
                    <li> <a href="#">LogoFashion</a> (1) </li>
                  </ol>
                </dd>
                <dt class="odd">Color</dt>
                <dd class="odd">
                  <ol>
                    <li> <a href="#">Green</a> (1) </li>
                    <li> <a href="#">White</a> (5) </li>
                    <li> <a href="#">Black</a> (5) </li>
                    <li> <a href="#">Gray</a> (4) </li>
                    <li> <a href="#">Dark Gray</a> (3) </li>
                    <li> <a href="#">Blue</a> (1) </li>
                  </ol>
                </dd>
                <dt class="last even">Size</dt>
                <dd class="last even">
                  <ol>
                    <li> <a href="#">S</a> (6) </li>
                    <li> <a href="#">M</a> (6) </li>
                    <li> <a href="#">L</a> (4) </li>
                    <li> <a href="#">XL</a> (4) </li>
                  </ol>
                </dd>
              </dl>
            </div>
          </div>
          <div class="block block-cart">
            <div class="block-title ">My Cart</div>
            <div class="block-content">
              <div class="summary">
                <p class="amount">There are <a href="#">2 items</a> in your cart.</p>
                <p class="subtotal"> <span class="label">Cart Subtotal:</span> <span class="price">$27.99</span> </p>
              </div>
              <div class="ajax-checkout">
                <button type="submit" title="Submit" class="button button-checkout"><span>Checkout</span></button>
              </div>
              <p class="block-subtitle">Recently added item(s) </p>
              <ul>
                <li class="item"> <a class="product-image" title="Fisher-Price Bubble Mower" href="product_detail.html"><img width="80" alt="product-image" src="products-images/product1.jpg"></a>
                  <div class="product-details">
                    <div class="access"> <a class="btn-remove1" title="Remove This Item" href="#"> <span class="icon"></span> Remove </a> </div>
                    <p class="product-name"> <a href="product_detail.html">Sample Product</a> </p>
                  <strong>1</strong> x <span class="price">$19.99</span> </div>
                </li>
                <li class="item last"> <a class="product-image" title="Prince Lionheart Jumbo Toy Hammock" href="product_detail.html"><img width="80" alt="product-image" src="products-images/product1.jpg"></a>
                  <div class="product-details">
                    <div class="access"> <a class="btn-remove1" title="Remove This Item" href="#"> <span class="icon"></span> Remove </a> </div>
                    <p class="product-name"> <a href="product_detail.html"> Sample Product</a> </p>
                    <strong>1</strong> x <span class="price">$8.00</span> 
                    <!--access clearfix--> 
                  </div>
                </li>
              </ul>
            </div>
          </div>
          <div class="block block-subscribe">
        <div class="block-title">Newsletter</div>
        <form id="newsletter-validate-detail" method="post" action="http://www.magikcommerce.com//newsletter/subscriber/new/">
          <div class="block-content">
            <div class="form-subscribe-header"> Sign up for our newsletter:</div>
            <input type="text" placeholder="Enter your email address" class="input-text required-entry validate-email" title="" id="newsletter" name="email">
            <div class="actions">
              <button class="button button-subscribe" title="Submit" type="submit"><span>Subscribe</span></button>
            </div>
          </div>
        </form>
      </div>
          <div class="block block-compare">
            <div class="block-title ">Compare Products (2)</div>
            <div class="block-content">
              <ol id="compare-items">
                <li class="item odd">
                  <input type="hidden" class="compare-item-id" value="2173">
                  <a href="#" title="Remove This Item" class="btn-remove1"></a> <a class="product-name" href="#"> Sofa with Box-Edge Polyester Wrapped Cushions</a> </li>
                <li class="item last even">
                  <input type="hidden" class="compare-item-id" value="2174">
                  <a href="#" title="Remove This Item" class="btn-remove1"></a> <a class="product-name" href="#"> Sofa with Box-Edge Down-Blend Wrapped Cushions</a> </li>
              </ol>
              <div class="ajax-checkout">
                <button class="button button-compare" title="Submit" type="submit"><span>Compare</span></button>
                <button class="button button-clear" title="Submit" type="submit"><span>Clear</span></button>
              </div>
            </div>
          </div>
          <div class="block block-list block-viewed">
            <div class="block-title"> Recently Viewed </div>
            <div class="block-content">
              <ol id="recently-viewed-items">
                <li class="item odd">
                  <p class="product-name"><a href="#"> Armchair with Box-Edge Upholstered Arm</a></p>
                </li>
                <li class="item even">
                  <p class="product-name"><a href="#"> Pearce Upholstered Slee pere</a></p>
                </li>
                <li class="item last odd">
                  <p class="product-name"><a href="#"> Sofa with Box-Edge Down-Blend Wrapped Cushions</a></p>
                </li>
              </ol>
            </div>
          </div>
          <div class="block block-poll">
            <div class="block-title">Community Poll </div>
            <form onSubmit="return validatePollAnswerIsSelected();" method="post" action="#" id="pollForm">
              <div class="block-content">
                <p class="block-subtitle">What is your favorite Magento feature?</p>
                <ul id="poll-answers">
                  <li class="odd">
                    <input type="radio" value="5" id="vote_5" class="radio poll_vote" name="vote">
                    <span class="label">
                    <label for="vote_5">Layered Navigation</label>
                    </span> </li>
                  <li class="even">
                    <input type="radio" value="6" id="vote_6" class="radio poll_vote" name="vote">
                    <span class="label">
                    <label for="vote_6">Price Rules</label>
                    </span> </li>
                  <li class="odd">
                    <input type="radio" value="7" id="vote_7" class="radio poll_vote" name="vote">
                    <span class="label">
                    <label for="vote_7">Category Management</label>
                    </span> </li>
                  <li class="last even">
                    <input type="radio" value="8" id="vote_8" class="radio poll_vote" name="vote">
                    <span class="label">
                    <label for="vote_8">Compare Products</label>
                    </span> </li>
                </ul>
                <div class="actions">
                  <button class="button button-vote" title="Vote" type="submit"><span>Vote</span></button>
                </div>
              </div>
            </form>
          </div>
          <div class="block block-tags">
            <div class="block-title"> Popular Tags</div>
            <div class="block-content">
              <ul class="tags-list">
                <li><a style="font-size:98.3333333333%;" href="#tagId/23/">Camera</a></li>
                <li><a style="font-size:86.6666666667%;" href="#tagId/109/">Hohoho</a></li>
                <li><a style="font-size:145%;" href="#tagId/27/">SEXY</a></li>
                <li><a style="font-size:75%;" href="#tagId/61/">Tag</a></li>
                <li><a style="font-size:110%;" href="#tagId/29/">Test</a></li>
                <li><a style="font-size:86.6666666667%;" href="#tagId/17/">bones</a></li>
                <li><a style="font-size:110%;" href="#tagId/12/">cool</a></li>
                <li><a style="font-size:86.6666666667%;" href="#tagId/184/">cool t-shirt</a></li>
                <li><a style="font-size:86.6666666667%;" href="#tagId/173/">crap</a></li>
                <li><a style="font-size:86.6666666667%;" href="#tagId/41/">good</a></li>
                <li><a style="font-size:86.6666666667%;" href="#tagId/16/">green</a></li>
                <li><a style="font-size:86.6666666667%;" href="#tagId/5/">hip</a></li>
                <li><a style="font-size:75%;" href="#tagId/51/">laptop</a></li>
                <li><a style="font-size:75%;" href="#tagId/20/">mobile</a></li>
                <li><a style="font-size:75%;" href="#tagId/70/">nice</a></li>
                <li><a style="font-size:86.6666666667%;" href="#tagId/42/">phone</a></li>
                <li><a style="font-size:98.3333333333%;" href="#tagId/30/">red</a></li>
                <li><a style="font-size:86.6666666667%;" href="#tagId/28/">tight</a></li>
                <li><a style="font-size:75%;" href="#tagId/2/">trendy</a></li>
                <li><a style="font-size:86.6666666667%;" href="#tagId/4/">young</a></li>
              </ul>
              <div class="actions"> <a class="view-all" href="#">View All Tags</a> </div>
            </div>
          </div>
          <div class="block block-banner"><a href="#"><img src="images/block-banner.png" alt="block-banner"></a></div>
        </aside>
      </div>
    </div>
  </div>
  <!-- End Two columns content --> 
  
  <!-- Footer -->
  <footer>
    <div class="container">
      <div class="inner">
        <div class="brand-logo">
          <div class="slider-items-products">
            <div id="brand-logo-slider" class="product-flexslider hidden-buttons">
              <div class="slider-items slider-width-col6">
                <!-- Item -->
                <div class="item"> <a href="#x"><img src="images/b-logo1.png" alt="Image"></a> </div>
                <!-- End Item -->
                <!-- Item -->
                <div class="item"> <a href="#x"><img src="images/b-logo2.png" alt="Image"></a> </div>
                <!-- End Item -->
                <!-- Item -->
                <div class="item"> <a href="#x"><img src="images/b-logo3.png" alt="Image"></a> </div>
                <!-- End Item -->
                <!-- Item -->
                <div class="item"> <a href="#x"><img src="images/b-logo4.png" alt="Image"></a> </div>
                <!-- End Item -->
                <!-- Item -->
                <div class="item"> <a href="#x"><img src="images/b-logo5.png" alt="Image"></a> </div>
                <!-- End Item -->
                <!-- Item -->
                <div class="item"> <a href="#x"><img src="images/b-logo6.png" alt="Image"></a> </div>
                <!-- End Item -->
                <!-- Item -->
                <div class="item"> <a href="#x"><img src="images/b-logo1.png" alt="Image"></a> </div>
                <!-- End Item -->
                <!-- Item -->
                <div class="item"> <a href="#x"><img src="images/b-logo4.png" alt="Image"></a> </div>
                <!-- End Item -->
              </div>
            </div>
          </div>
        </div>
        <div class="footer-middle">
          <div class="col-md-3 col-sm-12 col-xs-12">
            <div class="footer-column-1">
              <div class="footer-logo"><a href="index.html" title="Logo"><img src="images/footer-logo.png" alt="logo" ></a></div>
              <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
              <div class="social">
                <ul class="link">
                  <li class="fb"><a href="#"></a></li>
                  <li class="tw"><a href="#"></a></li>
                  <li class="googleplus"><a href="#"></a></li>
                  <li class="rss"><a href="#"></a></li>
                  <!-- <li class="pintrest"><a href="#"></a></li>-->
                  <li class="linkedin"><a href="#"></a></li>
                  <li class="youtube"><a href="#"></a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-md-2 col-sm-6 col-xs-12">
            <h4 class="green">Shopping Guide</h4>
            <ul class="links">
              <li class="first"><a href="about_us.html" title="How to buy">About us</a></li>
              <li><a href="faq.html" title="FAQs">FAQs</a></li>
              <li><a href="#" title="Payment">Payment</a></li>
              <li><a href="#" title="Shipment&lt;/a&gt;">Shipment</a></li>
              <li><a href="#" title="Where is my order?">Where is my order?</a></li>
              <li class="last"><a href="#" title="Return policy">Return policy</a></li>
            </ul>
          </div>
          <div class="col-md-2 col-sm-6 col-xs-12">
            <h4 class="yellow">Style Advisor</h4>
            <ul class="links">
              <li class="first"><a title="Your Account" href="login.html">Your Account</a></li>
              <li><a title="Information" href="#">Information</a></li>
              <li><a title="Addresses" href="#">Addresses</a></li>
              <li><a title="Addresses" href="#">Discount</a></li>
              <li><a title="Orders History" href="#">Orders History</a></li>
              <li class="last"><a title=" Additional Information" href="#">Additional Information</a></li>
            </ul>
          </div>
          <div class="col-md-2 col-sm-6 col-xs-12">
            <h4 class="orange">Information</h4>
            <ul class="links">
              <li class="first"><a href="sitemap.html" title="Site Map">Site Map</a></li>
              <li><a href="#/" title="Search Terms">Search Terms</a></li>
              <li><a href="#" title="Advanced Search">Advanced Search</a></li>
              <li><a href="contact_us.html" title="Contact Us">Contact Us</a></li>
              <li><a href="#" title="Suppliers">Suppliers</a></li>
              <li class=" last"><a href="#" title="Our stores" class="link-rss">Our stores</a></li>
            </ul>
          </div>
          <div class="col-md-3 col-sm-6 col-xs-12">
            <h4 class="blue">Contact Us</h4>
            <div class="contacts-info">
              <address>
              <i class="add-icon">&nbsp;</i>123 Main Street, Anytown, <br>
              &nbsp;CA 12345  USA
              </address>
              <div class="phone-footer"><i class="phone-icon">&nbsp;</i> +1 800 123 1234</div>
              <div class="email-footer"><i class="email-icon">&nbsp;</i> <a href="mailto:support@magikcommerce.com">support@magikcommerce.com</a> </div>
            </div>
          </div>
        </div>
        <div class="footer-bottom">
          <div class="col-sm-3 col-xs-12 coppyright"> &copy; 2015 Magikcommerce. All Rights Reserved.</div>
          <div class="col-sm-9 col-xs-12 company-links">
            <ul class="links">
              <li><a href="#" title="Magento Themes">Magento Themes</a></li>
              <li><a href="#" title="Premium Themes">Premium Themes</a></li>
              <li><a href="#" title="Responsive Themes">Responsive Themes</a></li>
              <li class="last"><a href="#" title="Magento Extensions">Magento Extensions</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </footer>
  <!-- End Footer -->
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