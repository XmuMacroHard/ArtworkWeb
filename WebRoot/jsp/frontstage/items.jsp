<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
<title>我们的艺术品网站</title>

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
  <!-- Header -->
  <header class="header">
    <div class="container">
      <div class="row">
        <div class="col-lg-5 col-sm-4 col-md-5">
          <!-- Header Logo -->
          <a class="logo" title="Magento Commerce" href="index.html"><img alt="Magento Commerce" src="images/logo.png"></a>
          <!-- End Header Logo -->
        </div>
        <div class=" col-lg-7 col-sm-8 col-md-7 col-xs-12">
          <div class="header-top">
            <div class="welcome-msg hidden-xs"> Default welcome msg! </div>
            <!-- Header Language -->
            <div class="dropdown block-language-wrapper"> <a role="button" data-toggle="dropdown" data-target="#" class="block-language dropdown-toggle" href="#"> <img src="images/english.png" alt="language"> English <span class="caret"></span> </a>
              <ul class="dropdown-menu" role="menu">
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="images/english.png" alt="language"> English </a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="images/francais.png" alt="language"> French </a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="images/german.png" alt="language"> German </a></li>
              </ul>
            </div>
            <!-- End Header Language -->
            <!-- Header Top Links -->
            <div class="toplinks">
              <div class="links">
                <div class="myaccount"><a title="My Account" href="login.html"><span class="hidden-xs">My Account</span></a></div>
                <div class="wishlist"><a title="My Wishlist" href="wishlist.html"><span class="hidden-xs">Wishlist</span></a></div>
                <div class="demo"><a href="blog.html" title="Blog"><span class="hidden-xs">Blog</span></a></div>
                <!-- Header Company -->
                <div class="dropdown block-company-wrapper hidden-xs"> <a role="button" data-toggle="dropdown" data-target="#" class="dropdown-toggle" href="#"> Company <span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="about_us.html"> About Us </a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> Customer Service </a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> Privacy Policy </a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="sitemap.html">Site Map </a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Search Terms </a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Advanced Search </a></li>
                  </ul>
                </div>
                <!-- End Header Company -->
                <div class="login"><a href="login.html"><span class="hidden-xs">Log In</span></a></div>
              </div>
            </div>
            <!-- End Header Top Links -->
          </div>
          <div class="cart_cur_block">
            <!-- Header Currency -->
            <div class="dropdown block-currency-wrapper"> <a role="button" data-toggle="dropdown" data-target="#" class="block-currency dropdown-toggle" href="#"> USD <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> $ - Dollar </a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> £ - Pound </a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> € - Euro </a></li>
              </ul>
            </div>
            <!-- End Header Currency -->
            <!-- Top Cart -->
            <div class="top-cart-contain">
              <div class="mini-cart">
                <div data-toggle="dropdown" data-hover="dropdown" class="basket dropdown-toggle"> <a href="#"><span class="hidden-xs">shopping cart (3)</span></a></div>
                <div>
                  <div style="display: none;" class="top-cart-content arrow_box">
                    <div class="block-subtitle">Recently added item(s)</div>
                    <ul id="cart-sidebar" class="mini-products-list">
                      <li class="item odd"> <a href="product_detail.html" title="Skater Dress In Leaf Print" class="product-image"><img src="products-images/product1.jpg" alt="Product image" width="55"></a>
                        <div class="product-details"> <a href="#" title="Remove This Item" onClick="" class="btn-remove1">Remove This Item</a> <a class="btn-edit" title="Edit item" href="#">Edit item</a>
                          <p class="product-name"><a href="product_detail.html">Sample Product</a> </p>
                          <strong>1</strong> x <span class="price">$20.00</span> </div>
                      </li>
                      <li class="item even"> <a href="product_detail.html" title="Product layout: large content" class="product-image"><img src="products-images/product1.jpg" alt="Product image" width="55"></a>
                        <div class="product-details"> <a href="#" title="Remove This Item" onClick="" class="btn-remove1">Remove This Item</a> <a class="btn-edit" title="Edit item" href="#">Edit item</a>
                          <p class="product-name"><a href="product_detail.html">Sample Product</a> </p>
                          <strong>1</strong> x <span class="price">$230.00</span> </div>
                      </li>
                      <li class="item last odd"> <a href="product_detail.html" title="Skater Dress In Leaf Print" class="product-image"><img src="products-images/product1.jpg" alt="Product image" width="55"></a>
                        <div class="product-details"> <a href="#" title="Remove This Item" onClick="" class="btn-remove1">Remove This Item</a><a class="btn-edit" title="Edit item" href="#">Edit item</a>
                          <p class="product-name"><a href="product_detail.html">Sample Product</a> </p>
                          <strong>2</strong> x <span class="price">$420.00</span> </div>
                      </li>
                    </ul>
   <!-- Header -->
  <header class="header">
    <div class="container">
      <div class="row">
        <div class="col-lg-5 col-sm-4 col-md-5">
          <!-- Header Logo -->
          <a class="logo" title="Magento Commerce" href="index.html"><img alt="Magento Commerce" src="images/logo.png"></a>
          <!-- End Header Logo -->
        </div>
        <div class=" col-lg-7 col-sm-8 col-md-7 col-xs-12">
          <div class="header-top">
            <div class="welcome-msg hidden-xs"> Default welcome msg! </div>
            <!-- Header Language -->
            <div class="dropdown block-language-wrapper"> <a role="button" data-toggle="dropdown" data-target="#" class="block-language dropdown-toggle" href="#"> <img src="images/english.png" alt="language"> English <span class="caret"></span> </a>
              <ul class="dropdown-menu" role="menu">
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="images/english.png" alt="language"> English </a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="images/francais.png" alt="language"> French </a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#"><img src="images/german.png" alt="language"> German </a></li>
              </ul>
            </div>
            <!-- End Header Language -->
            <!-- Header Top Links -->
            <div class="toplinks">
              <div class="links">
                <div class="myaccount"><a title="My Account" href="login.html"><span class="hidden-xs">My Account</span></a></div>
                <div class="wishlist"><a title="My Wishlist" href="wishlist.html"><span class="hidden-xs">Wishlist</span></a></div>
                <div class="demo"><a href="blog.html" title="Blog"><span class="hidden-xs">Blog</span></a></div>
                <!-- Header Company -->
                <div class="dropdown block-company-wrapper hidden-xs"> <a role="button" data-toggle="dropdown" data-target="#" class="dropdown-toggle" href="#"> Company <span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="about_us.html"> About Us </a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> Customer Service </a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> Privacy Policy </a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="sitemap.html">Site Map </a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Search Terms </a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Advanced Search </a></li>
                  </ul>
                </div>
                <!-- End Header Company -->
                <div class="login"><a href="login.html"><span class="hidden-xs">Log In</span></a></div>
              </div>
            </div>
            <!-- End Header Top Links -->
          </div>
          <div class="cart_cur_block">
            <!-- Header Currency -->
            <div class="dropdown block-currency-wrapper"> <a role="button" data-toggle="dropdown" data-target="#" class="block-currency dropdown-toggle" href="#"> USD <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> $ - Dollar </a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> £ - Pound </a></li>
                <li role="presentation"><a role="menuitem" tabindex="-1" href="#"> € - Euro </a></li>
              </ul>
            </div>
            <!-- End Header Currency -->
            <!-- Top Cart -->
            <div class="top-cart-contain">
              <div class="mini-cart">
                <div data-toggle="dropdown" data-hover="dropdown" class="basket dropdown-toggle"> <a href="#"><span class="hidden-xs">shopping cart (3)</span></a></div>
                <div>
                  <div style="display: none;" class="top-cart-content arrow_box">
                    <div class="block-subtitle">Recently added item(s)</div>
                    <ul id="cart-sidebar" class="mini-products-list">
                      <li class="item odd"> <a href="product_detail.html" title="Skater Dress In Leaf Print" class="product-image"><img src="products-images/product1.jpg" alt="Product image" width="55"></a>
                        <div class="product-details"> <a href="#" title="Remove This Item" onClick="" class="btn-remove1">Remove This Item</a> <a class="btn-edit" title="Edit item" href="#">Edit item</a>
                          <p class="product-name"><a href="product_detail.html">Sample Product</a> </p>
                          <strong>1</strong> x <span class="price">$20.00</span> </div>
                      </li>
                      <li class="item even"> <a href="product_detail.html" title="Product layout: large content" class="product-image"><img src="products-images/product1.jpg" alt="Product image" width="55"></a>
                        <div class="product-details"> <a href="#" title="Remove This Item" onClick="" class="btn-remove1">Remove This Item</a> <a class="btn-edit" title="Edit item" href="#">Edit item</a>
                          <p class="product-name"><a href="product_detail.html">Sample Product</a> </p>
                          <strong>1</strong> x <span class="price">$230.00</span> </div>
                      </li>
                      <li class="item last odd"> <a href="product_detail.html" title="Skater Dress In Leaf Print" class="product-image"><img src="products-images/product1.jpg" alt="Product image" width="55"></a>
                        <div class="product-details"> <a href="#" title="Remove This Item" onClick="" class="btn-remove1">Remove This Item</a><a class="btn-edit" title="Edit item" href="#">Edit item</a>
                          <p class="product-name"><a href="product_detail.html">Sample Product</a> </p>
                          <strong>2</strong> x <span class="price">$420.00</span> </div>
                      </li>
                    </ul>
                    <div class="top-subtotal">Subtotal: <span class="price">$520.00</span></div>
                    <div class="actions">
                      <button class="btn-checkout" type="button"><span>Checkout</span></button>
                      <button class="view-cart" type="button"><span>View Cart</span></button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- End Top Cart -->
          </div>
        </div>
      </div>
    </div>
  </header>
  <!-- end header -->                 <div class="top-subtotal">Subtotal: <span class="price">$520.00</span></div>
                    <div class="actions">
                      <button class="btn-checkout" type="button"><span>Checkout</span></button>
                      <button class="view-cart" type="button"><span>View Cart</span></button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- End Top Cart -->
          </div>
        </div>
      </div>
    </div>
  </header>
  <!-- end header -->
  <!-- Navbar -->
  <nav>
    <div class="container">
      <div class="nav-inner">
        <!-- mobile-menu -->
        <div class="hidden-desktop" id="mobile-menu">
          <ul class="navmenu">
            <li>
              <div class="menutop">
                <div class="toggle"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span></div>
                <h2>Menu</h2>
              </div>
              <ul style="display:none;" class="submenu">
                <li>
                  <ul class="topnav"><li class="level0 nav-6 level-top first parent"> <a class="level-top" href="index.html"> <span>Home</span> </a>
                      <ul class="level0">
                        <li class="level1"><a href="../../layout-1/red/index.html"><span>Home Version 1</span></a> </li>
                        <li class="level1"><a href="../../layout-2/red/index.html"><span> Home Version 2</span></a> </li>
                        <li class="level1"><a href="../../layout-1/aqua/index.html"><span>Aqua</span></a> </li>
                        <li class="level1"><a href="../../layout-1/orange/index.html"><span>Orange</span></a> </li>
                        <li class="level1"><a href="../../layout-1/red/index.html"><span>Red</span></a> </li>
                        <li class="level1"><a href="../../layout-1/yellow/index.html"><span>Yellow</span></a> </li>
                         </ul>
                    </li>
                    <li class="level0 nav-1 level-top first parent"> <a href="grid.html" class="level-top"> <span>Women</span> </a>
                      <ul class="level0">
                        <li class="level1 nav-1-1 first parent"> <a href="grid.html"> <span>Stylish Bag</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-1-1-1 first"> <a href="grid.html"> <span>Clutch Handbags</span> </a> </li>
                            <li class="level2 nav-1-1-2"> <a href="grid.html"> <span>Diaper Bags</span> </a> </li>
                            <li class="level2 nav-1-1-3"> <a href="grid.html"> <span>Bags</span> </a> </li>
                            <li class="level2 nav-1-1-4 last"> <a href="grid.html"> <span>Hobo Handbags</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-1-2 parent"> <a href="grid.html"> <span>Material Bag</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-1-2-5 first"> <a href="grid.html"> <span>Beaded Handbags</span> </a> </li>
                            <li class="level2 nav-1-2-6"> <a href="grid.html"> <span>Fabric Handbags</span> </a> </li>
                            <li class="level2 nav-1-2-7"> <a href="grid.html"> <span>Handbags</span> </a> </li>
                            <li class="level2 nav-1-2-8 last"> <a href="grid.html"> <span>Leather Handbags</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-1-3 parent"> <a href="grid.html"> <span>Shoes</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-1-3-9 first"> <a href="grid.html"> <span>Flat Shoes</span> </a> </li>
                            <li class="level2 nav-1-3-10"> <a href="grid.html"> <span>Flat Sandals</span> </a> </li>
                            <li class="level2 nav-1-3-11"> <a href="grid.html"> <span>Boots</span> </a> </li>
                            <li class="level2 nav-1-3-12 last"> <a href="grid.html"> <span>Heels</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-1-4 parent"> <a href="grid.html"> <span>Jwellery</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-1-4-13 first"> <a href="grid.html"> <span>Bracelets</span> </a> </li>
                            <li class="level2 nav-1-4-14"> <a href="grid.html"> <span>Necklaces &amp; Pendants</span> </a> </li>
                            <li class="level2 nav-1-4-15"> <a href="grid.html"> <span>Pendants</span> </a> </li>
                            <li class="level2 nav-1-4-16 last"> <a href="grid.html"> <span>Pins &amp; Brooches</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-1-5 parent"> <a href="grid.html"> <span>Dresses</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-1-5-17 first"> <a href="grid.html"> <span>Casual Dresses</span> </a> </li>
                            <li class="level2 nav-1-5-18"> <a href="grid.html"> <span>Evening</span> </a> </li>
                            <li class="level2 nav-1-5-19"> <a href="grid.html"> <span>Designer</span> </a> </li>
                            <li class="level2 nav-1-5-20 last"> <a href="grid.html"> <span>Party</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-1-6 last parent"> <a href="grid.html"> <span>Swimwear</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-1-6-21 first"> <a href="grid.html"> <span>Swimsuits</span> </a> </li>
                            <li class="level2 nav-1-6-22"> <a href="grid.html"> <span>Beach Clothing</span> </a> </li>
                            <li class="level2 nav-1-6-23"> <a href="grid.html"> <span>Clothing</span> </a> </li>
                            <li class="level2 nav-1-6-24 last"> <a href="grid.html"> <span>Bikinis</span> </a> </li>
                          </ul>
                        </li>
                      </ul>
                    </li>
                    <li class="level0 nav-2 level-top parent"> <a href="grid.html" class="level-top"> <span>Men</span> </a>
                      <ul class="level0">
                        <li class="level1 nav-2-1 first parent"> <a href="grid.html"> <span>Shoes</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-2-1-1 first"> <a href="grid.html"> <span>Sport Shoes</span> </a> </li>
                            <li class="level2 nav-2-1-2"> <a href="grid.html"> <span>Casual Shoes</span> </a> </li>
                            <li class="level2 nav-2-1-3"> <a href="grid.html"> <span>Leather Shoes</span> </a> </li>
                            <li class="level2 nav-2-1-4 last"> <a href="grid.html"> <span>canvas shoes</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-2-2 parent"> <a href="grid.html"> <span>Dresses</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-2-2-5 first"> <a href="grid.html"> <span>Casual Dresses</span> </a> </li>
                            <li class="level2 nav-2-2-6"> <a href="grid.html"> <span>Evening</span> </a> </li>
                            <li class="level2 nav-2-2-7"> <a href="grid.html"> <span>Designer</span> </a> </li>
                            <li class="level2 nav-2-2-8 last"> <a href="grid.html"> <span>Party</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-2-3 parent"> <a href="grid.html"> <span>Jackets</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-2-3-9 first"> <a href="grid.html"> <span>Coats</span> </a> </li>
                            <li class="level2 nav-2-3-10"> <a href="grid.html"> <span>Formal Jackets</span> </a> </li>
                            <li class="level2 nav-2-3-11"> <a href="grid.html"> <span>Leather Jackets</span> </a> </li>
                            <li class="level2 nav-2-3-12 last"> <a href="grid.html"> <span>Blazers</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-2-4 parent"> <a href="grid.html"> <span>Watches</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-2-4-13 first"> <a href="grid.html"> <span>Fastrack</span> </a> </li>
                            <li class="level2 nav-2-4-14"> <a href="grid.html"> <span>Casio</span> </a> </li>
                            <li class="level2 nav-2-4-15"> <a href="grid.html"> <span>Titan</span> </a> </li>
                            <li class="level2 nav-2-4-16 last"> <a href="grid.html"> <span>Tommy-Hilfiger</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-2-5 parent"> <a href="grid.html"> <span>Sunglasses</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-2-5-17 first"> <a href="grid.html"> <span>Ray Ban</span> </a> </li>
                            <li class="level2 nav-2-5-18"> <a href="grid.html"> <span>Fastrack</span> </a> </li>
                            <li class="level2 nav-2-5-19"> <a href="grid.html"> <span>Police</span> </a> </li>
                            <li class="level2 nav-2-5-20 last"> <a href="grid.html"> <span>Oakley</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-2-6 last parent"> <a href="grid.html"> <span>Accessories</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-2-6-21 first"> <a href="grid.html"> <span>Backpacks</span> </a> </li>
                            <li class="level2 nav-2-6-22"> <a href="grid.html"> <span>Wallets</span> </a> </li>
                            <li class="level2 nav-2-6-23"> <a href="grid.html"> <span>Laptop Bags</span> </a> </li>
                            <li class="level2 nav-2-6-24 last"> <a href="grid.html"> <span>Belts</span> </a> </li>
                          </ul>
                        </li>
                      </ul>
                    </li>
                    <li class="level0 nav-3 level-top parent"> <a href="grid.html" class="level-top"> <span>Electronics</span> </a>
                      <ul class="level0">
                        <li class="level1 nav-3-1 first parent"> <a href="grid.html"> <span>Mobiles</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-3-1-1 first"> <a href="grid.html"> <span>Samsung</span> </a> </li>
                            <li class="level2 nav-3-1-2"> <a href="grid.html"> <span>Nokia</span> </a> </li>
                            <li class="level2 nav-3-1-3"> <a href="grid.html"> <span>iPhone</span> </a> </li>
                            <li class="level2 nav-3-1-4 last"> <a href="grid.html"> <span>Sony</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-3-2 parent"> <a href="grid.html"> <span>Accessories</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-3-2-5 first"> <a href="grid.html"> <span>Mobile Memory Cards</span> </a> </li>
                            <li class="level2 nav-3-2-6"> <a href="grid.html"> <span>Cases &amp; Covers</span> </a> </li>
                            <li class="level2 nav-3-2-7"> <a href="grid.html"> <span>Mobile Headphones</span> </a> </li>
                            <li class="level2 nav-3-2-8 last"> <a href="grid.html"> <span>Bluetooth Headsets</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-3-3 parent"> <a href="grid.html"> <span>Cameras</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-3-3-9 first"> <a href="grid.html"> <span>Camcorders</span> </a> </li>
                            <li class="level2 nav-3-3-10"> <a href="grid.html"> <span>Point &amp; Shoot</span> </a> </li>
                            <li class="level2 nav-3-3-11"> <a href="grid.html"> <span>Digital SLR</span> </a> </li>
                            <li class="level2 nav-3-3-12 last"> <a href="grid.html"> <span>Camera Accessories</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-3-4 parent"> <a href="grid.html"> <span>Audio &amp; Video</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-3-4-13 first"> <a href="grid.html"> <span>MP3 Players</span> </a> </li>
                            <li class="level2 nav-3-4-14"> <a href="grid.html"> <span>iPods</span> </a> </li>
                            <li class="level2 nav-3-4-15"> <a href="grid.html"> <span>Speakers</span> </a> </li>
                            <li class="level2 nav-3-4-16 last"> <a href="grid.html"> <span>Video Players</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-3-5 parent"> <a href="grid.html"> <span>Computer</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-3-5-17 first"> <a href="grid.html"> <span>External Hard Disks</span> </a> </li>
                            <li class="level2 nav-3-5-18"> <a href="grid.html"> <span>Pendrives</span> </a> </li>
                            <li class="level2 nav-3-5-19"> <a href="grid.html"> <span>Headphones</span> </a> </li>
                            <li class="level2 nav-3-5-20 last"> <a href="grid.html"> <span>PC Components</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-3-6 last parent"> <a href="grid.html"> <span>Appliances </span> </a>
                          <ul class="level1">
                            <li class="level2 nav-3-6-21 first"> <a href="grid.html"> <span>Vacuum Cleaners</span> </a> </li>
                            <li class="level2 nav-3-6-22"> <a href="grid.html"> <span>Indoor Lighting</span> </a> </li>
                            <li class="level2 nav-3-6-23"> <a href="grid.html"> <span>Kitchen Tools</span> </a> </li>
                            <li class="level2 nav-3-6-24 last"> <a href="grid.html"> <span>Water Purifiers</span> </a> </li>
                          </ul>
                        </li>
                      </ul>
                    </li>
                    <li class="level0 nav-4 level-top parent"> <a href="grid.html" class="level-top"> <span>Furniture</span> </a>
                      <ul class="level0">
                        <li class="level1 nav-4-1 first parent"> <a href="grid.html"> <span>Living Room</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-4-1-1 first"> <a href="grid.html"> <span>Racks &amp; Cabinets</span> </a> </li>
                            <li class="level2 nav-4-1-2"> <a href="grid.html"> <span>Sofas</span> </a> </li>
                            <li class="level2 nav-4-1-3"> <a href="grid.html"> <span>Chairs</span> </a> </li>
                            <li class="level2 nav-4-1-4 last"> <a href="grid.html"> <span>Tables</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-4-2 parent"> <a href="grid.html"> <span>Dining &amp; Bar</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-4-2-5 first"> <a href="grid.html"> <span>Dining Table Sets</span> </a> </li>
                            <li class="level2 nav-4-2-6"> <a href="grid.html"> <span>Serving Trolleys</span> </a> </li>
                            <li class="level2 nav-4-2-7"> <a href="grid.html"> <span>Bar Counters</span> </a> </li>
                            <li class="level2 nav-4-2-8 last"> <a href="grid.html"> <span>Dining Cabinets</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-4-3 parent"> <a href="grid.html"> <span>Bedroom</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-4-3-9 first"> <a href="grid.html"> <span>Beds</span> </a> </li>
                            <li class="level2 nav-4-3-10"> <a href="grid.html"> <span>Chest of Drawers</span> </a> </li>
                            <li class="level2 nav-4-3-11"> <a href="grid.html"> <span>Wardrobes &amp; Almirahs</span> </a> </li>
                            <li class="level2 nav-4-3-12 last"> <a href="grid.html"> <span>Nightstands</span> </a> </li>
                          </ul>
                        </li>
                        <li class="level1 nav-4-4 last parent"> <a href="grid.html"> <span>Kitchen</span> </a>
                          <ul class="level1">
                            <li class="level2 nav-4-4-13 first"> <a href="grid.html"> <span>Kitchen Racks</span> </a> </li>
                            <li class="level2 nav-4-4-14"> <a href="grid.html"> <span>Kitchen Fittings</span> </a> </li>
                            <li class="level2 nav-4-4-15"> <a href="grid.html"> <span>Wall Units</span> </a> </li>
                            <li class="level2 nav-4-4-16 last"> <a href="grid.html"> <span>Benches &amp; Stools</span> </a> </li>
                          </ul>
                        </li>
                      </ul>
                    </li>
                    <li class="level0 nav-5 level-top last"> <a href="grid.html" class="level-top"> <span>Fashion</span> </a> </li>
                    <li class="level0 nav-6 level-top first parent"> <a class="level-top" href="#"> <span>Pages</span> </a>
                      <ul class="level0">
                        <li class="level1 first"><a href="grid.html"><span>Grid</span></a></li>
                        <li class="level1 nav-10-2"> <a href="list.html"> <span>List</span> </a> </li>
                        <li class="level1 nav-10-3"> <a href="product_detail.html"> <span>Product Detail</span> </a> </li>
                        <li class="level1 nav-10-4"> <a href="shopping_cart.html"> <span>Shopping Cart</span> </a> </li>
                        <li class="level1 first"><a href="checkout.html"><span>Checkout</span></a>
                          <ul class="level2">
                            <li class="level2 nav-2-1-1 first"><a href="checkout_method.html"><span>Checkout Method</span></a></li>
                            <li class="level2 nav-2-1-5 last"><a href="checkout_billing_info.html"><span>Checkout Billing Info</span></a></li>
                          </ul>
                        </li>
                        <li class="level1 nav-10-4"> <a href="wishlist.html"> <span>Wishlist</span> </a> </li>
                        <li class="level1"> <a href="dashboard.html"> <span>Dashboard</span> </a> </li>
                        <li class="level1"> <a href="multiple_addresses.html"> <span>Multiple Addresses</span> </a> </li>
                        <li class="level1"> <a href="about_us.html"> <span>About Us</span> </a> </li>
                        <li class="level1"><a href="compare.html"><span>Compare</span></a> </li>
                        <li class="level1"><a href="delivery.html"><span>Delivery</span></a> </li>
                        <li class="level1"><a href="faq.html"><span>FAQ</span></a> </li>
                        <li class="level1"><a href="quick_view.html"><span>Quick View</span></a> </li>
                        <li class="level1"><a href="newsletter.html"><span>Newsletter</span></a> </li>
                        <li class="level1"><a href="contact_us.html"><span>Contact Us</span></a> </li>
                        <li class="level1 first"><a href="blog.html"><span>Blog</span></a>
                           <ul class="level2">
                            <li class="level2 nav-2-1-1 first"><a href="blog_detail.html"><span>Blog Detail</span></a></li>
                          </ul>
                        </li> 
                        <li class="level1"><a href="404error.html"><span>404 Error Page</span></a> </li>
                      </ul>
                    </li>
                  </ul>
                </li>
              </ul>
            </li>
          </ul>
          <!--navmenu-->
        </div>
        <!--End mobile-menu -->
        <ul id="nav" class="hidden-xs">
          <li id="nav-home" class="level0 parent drop-menu active"><a href="index.html"><span>Home</span> </a>
            <ul class="level1" style="display: none;">
              <li class="level1 first parent"><a href="../../layout-1/aqua/index.html"><span> Home Version 1</span></a> </li>
              <li class="level1 parent"><a href="../../layout-2/aqua/index.html"><span> Home Version 2</span></a> </li>
              <li class="level1 parent"><a href="../../layout-1/green/index.html"><span>Green</span></a> </li>
              <li class="level1 parent"><a href="../../layout-1/orange/index.html"><span>Orange</span></a> </li>
              <li class="level1 parent"><a href="../../layout-1/red/index.html"><span>Red</span></a> </li>
              <li class="level1 parent"><a href="../../layout-1/yellow/index.html"><span>Yellow</span></a> </li>
            </ul>
          </li>
          <li class="level0 parent drop-menu"><a href="#"><span>Pages</span> </a>
            <ul style="display: none;" class="level1">
              <li class="level1 first"><a href="grid.html"><span>Grid</span></a></li>
              <li class="level1 nav-10-2"> <a href="list.html"> <span>List</span> </a> </li>
              <li class="level1 nav-10-3"> <a href="product_detail.html"> <span>Product Detail</span> </a> </li>
              <li class="level1 nav-10-4"> <a href="shopping_cart.html"> <span>Shopping Cart</span> </a> </li>
              <li class="level1 first parent"><a href="checkout.html"><span>Checkout</span></a>
                <ul class="level2">
                  <li class="level2 nav-2-1-1 first"><a href="checkout_method.html"><span>Checkout Method</span></a></li>
                  <li class="level2 nav-2-1-5 last"><a href="checkout_billing_info.html"><span>Checkout Billing Info</span></a></li>
                </ul>
              </li>
              <li class="level1 nav-10-4"> <a href="wishlist.html"> <span>Wishlist</span> </a> </li>
              <li class="level1"> <a href="dashboard.html"> <span>Dashboard</span> </a> </li>
              <li class="level1"> <a href="multiple_addresses.html"> <span>Multiple Addresses</span> </a> </li>
              <li class="level1"> <a href="about_us.html"> <span>About Us</span> </a> </li>
              <li class="level1"> <a href="compare.html"> <span>Compare</span> </a> </li>
              <li class="level1"> <a href="delivery.html"> <span>Delivery</span> </a> </li>
              <li class="level1"> <a href="faq.html"> <span>FAQ</span> </a> </li>
              <li class="level1"> <a href="quick_view.html"> <span>Quick View</span> </a> </li>
              <li class="level1"><a href="newsletter.html"><span>Newsletter</span></a> </li>
              <li class="level1"><a href="contact_us.html"><span>Contact Us</span></a> </li>
              <li class="level1"><a href="sitemap.html"><span>Sitemap</span></a> </li>
              <li class="level1 first parent"><a href="blog.html"><span>Blog</span></a>
                <ul class="level2">
                  <li class="level2 nav-2-1-1 first"><a href="blog_detail.html"><span>Blog Detail</span></a></li>
                </ul>
              </li>
              <li class="level1"><a href="404error.html"><span>404 Error Page</span></a> </li>
            </ul>
          </li>
          <li class="level0 nav-5 level-top first"> <a href="grid.html" class="level-top"> <span>Women</span> <span class="category-label-hot">Hot</span></a>
            <div style="display: none; left: 0px;" class="level0-wrapper dropdown-6col">
              <div class="level0-wrapper2">
                <div class="nav-block nav-block-center">
                  <ul class="level0">
                    <li class="level1 nav-6-1 first parent item"> <a href="grid.html"> <span>Styliest Bag </span> </a>
                      <ul class="level1">
                        <li class="level2 nav-6-1-1 first"> <a href="grid.html"> <span>Clutch Handbags</span> </a> </li>
                        <li class="level2 nav-6-1-2"> <a href="grid.html"> <span>Diaper Bags</span> </a> </li>
                        <li class="level2 nav-6-1-2"> <a href="grid.html"> <span>Bags</span> </a> </li>
                        <li class="level2 nav-6-1-3 last"> <a href="grid.html"> <span>Hobo Handbags</span> </a> </li>
                      </ul>
                    </li>
                    <li class="level1 nav-6-2 parent item"> <a href="grid.html"> <span>Material Bag</span> </a>
                      <ul class="level1">
                        <li class="level2 nav-6-2-4 first"> <a href="grid.html"> <span>Beaded Handbags</span> </a> </li>
                        <li class="level2 nav-6-2-5"> <a href="grid.html"> <span>Fabric Handbags</span> </a> </li>
                        <li class="level2 nav-6-2-5"> <a href="grid.html"> <span>Handbags</span> </a> </li>
                        <li class="level2 nav-6-2-6 last"> <a href="grid.html"> <span>Leather Handbags</span> </a> </li>
                      </ul>
                    </li>
                    <li class="level1 nav-6-3 parent item"> <a href="grid.html"> <span>Designer Bag</span> </a>
                      <ul class="level1">
                        <li class="level2 nav-6-3-9 first"> <a href="grid.html"> <span>Flat Shoes</span> </a> </li>
                        <li class="level2 nav-6-3-10"> <a href="grid.html"> <span>Flat Sandals</span> </a> </li>
                        <li class="level2 nav-6-3-11"> <a href="grid.html"> <span>Boots</span> </a> </li>
                        <li class="level2 nav-6-3-12 last"> <a href="grid.html"> <span>Heels</span> </a> </li>
                      </ul>
                    </li>
                    <li class="level1 nav-6-4 parent item"> <a href="grid.html"> <span>Cotton Bag</span> </a>
                      <ul class="level1">
                        <li class="level2 nav-6-4-13 first"> <a href="grid.html"> <span>Bracelets</span> </a> </li>
                        <li class="level2 nav-6-4-14"> <a href="grid.html"> <span>Necklaces &amp; Pendants</span> </a> </li>
                        <li class="level2 nav-6-4-14"> <a href="grid.html"> <span>Pendants</span> </a> </li>
                        <li class="level2 nav-6-4-15 last"> <a href="grid.html"> <span>Pins &amp; Brooches</span> </a> </li>
                      </ul>
                    </li>
                    <li class="level1 nav-6-5 last parent item"> <a href="grid.html"> <span>Swimwear</span> </a>
                      <ul class="level1">
                        <li class="level2 nav-6-8-28 first"> <a href="grid.html"> <span>Swimsuits</span> </a> </li>
                        <li class="level2 nav-6-8-29"> <a href="grid.html"> <span>Beach Clothing</span> </a> </li>
                        <li class="level2 nav-6-8-29"> <a href="grid.html"> <span>Clothing</span> </a> </li>
                        <li class="level2 nav-6-8-30 last"> <a href="grid.html"> <span>Bikinis</span> </a> </li>
                      </ul>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="nav-add">
                <div class="push_item">
                  <div class="push_img"> <a href="#"> <img alt="women_jwellery" src="images/women_jwellery.png"> </a> </div>
                  <div class="push_text">Lorem Ipsum is simply dummy text of the printing</div>
                </div>
                <div class="push_item">
                  <div class="push_img"> <a href="#"> <img alt="women_bag" src="images/women_jwellery.png"> </a> </div>
                  <div class="push_text">Lorem Ipsum is simply dummy text of the printing</div>
                </div>
                <div class="push_item">
                  <div class="push_img"> <a href="#"> <img alt="women_sandle" src="images/women_jwellery.png"> </a> </div>
                  <div class="push_text">Lorem Ipsum is simply dummy text of the printing</div>
                </div>
                <div class="push_item push_item_last">
                  <div class="push_img"> <a href="#"> <img alt="women_top" src="images/women_jwellery.png"> </a> </div>
                  <div class="push_text">Lorem Ipsum is simply dummy text of the printing</div>
                </div>
                <br class="clear">
              </div>
            </div>
          </li>
          <li class="level0 nav-7 level-top parent"> <a href="grid.html" class="level-top"> <span>Men</span> </a>
            <div style="display: none; left: 0px;" class="level0-wrapper dropdown-6col">
              <div class="level0-wrapper2">
                <div class="nav-block nav-block-center">
                  <ul class="level0">
                    <li class="level1 nav-7-1 first parent item"> <a href="grid.html"> <span>Gents Purses</span> </a>
                      <ul class="level1">
                        <li class="level2 nav-7-3-15 first"> <a href="grid.html"> <span>Digital Cameras</span> </a> </li>
                        <li class="level2 nav-7-3-16"> <a href="grid.html"> <span>Camcorders</span> </a> </li>
                        <li class="level2 nav-7-3-17"> <a href="grid.html"> <span>Lenses</span> </a> </li>
                        <li class="level2 nav-7-3-18"> <a href="grid.html"> <span>Filters</span> </a> </li>
                        <li class="level2 nav-7-3-19 last"> <a href="grid.html"> <span>Tripods</span> </a> </li>
                      </ul>
                    </li>
                    <li class="level1 nav-7-3 parent item"> <a href="grid.html"> <span>Gents Purses</span> </a>
                      <ul class="level1">
                        <li class="level2 nav-7-3-15 first"> <a href="grid.html"> <span>Digital Cameras</span> </a> </li>
                        <li class="level2 nav-7-3-16"> <a href="grid.html"> <span>Camcorders</span> </a> </li>
                        <li class="level2 nav-7-3-17"> <a href="grid.html"> <span>Lenses</span> </a> </li>
                        <li class="level2 nav-7-3-18"> <a href="grid.html"> <span>Filters</span> </a> </li>
                        <li class="level2 nav-7-3-19 last"> <a href="grid.html"> <span>Tripods</span> </a> </li>
                      </ul>
                    </li>
                    <li class="level1 nav-7-3 parent item"> <a href="grid.html"> <span>Gents Purses</span> </a>
                      <ul class="level1">
                        <li class="level2 nav-7-3-15 first"> <a href="grid.html"> <span>Digital Cameras</span> </a> </li>
                        <li class="level2 nav-7-3-16"> <a href="grid.html"> <span>Camcorders</span> </a> </li>
                        <li class="level2 nav-7-3-17"> <a href="grid.html"> <span>Lenses</span> </a> </li>
                        <li class="level2 nav-7-3-18"> <a href="grid.html"> <span>Filters</span> </a> </li>
                        <li class="level2 nav-7-3-19 last"> <a href="grid.html"> <span>Tripods</span> </a> </li>
                      </ul>
                    </li>
                    <li class="level1 nav-7-4 parent item"> <a href="grid.html"> <span>Gifts</span> </a>
                      <ul class="level1">
                        <li class="level2 nav-7-2-8 first"> <a href="grid.html"> <span>Headsets</span> </a> </li>
                        <li class="level2 nav-7-2-9"> <a href="grid.html"> <span>Batteries</span> </a> </li>
                        <li class="level2 nav-7-2-10"> <a href="grid.html"> <span>Screen Protectors</span> </a> </li>
                        <li class="level2 nav-7-2-11"> <a href="grid.html"> <span>Memory Cards</span> </a> </li>
                        <li class="level2 nav-7-2-14 last"> <a href="grid.html"> <span>Cases</span> </a> </li>
                      </ul>
                    </li>
                    <li class="level1 nav-7-4 last parent item"> <a href="grid.html"> <span>Accessories</span> </a>
                      <ul class="level1">
                        <li class="level2 nav-7-2-8 first"> <a href="grid.html"> <span>Headsets</span> </a> </li>
                        <li class="level2 nav-7-2-9"> <a href="grid.html"> <span>Batteries</span> </a> </li>
                        <li class="level2 nav-7-2-10"> <a href="grid.html"> <span>Screen Protectors</span> </a> </li>
                        <li class="level2 nav-7-2-11"> <a href="grid.html"> <span>Memory Cards</span> </a> </li>
                        <li class="level2 nav-7-2-14 last"> <a href="grid.html"> <span>Cases</span> </a> </li>
                      </ul>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </li>
          <li class="level0 nav-6 level-top parent"> <a href="grid.html" class="level-top"> <span>Electronics</span> <span class="category-label">New</span></a>
            <div style="display: none; left: 0px;" class="level0-wrapper dropdown-6col">
              <div class="level0-wrapper2">
                <div class="nav-block nav-block-center grid13-8 itemgrid itemgrid-4col">
                  <ul class="level0">
                    <li class="level1 nav-6-3 parent item"> <a href="grid.html"> <span>Shoes </span> </a>
                      <ul class="level1">
                        <li class="level2 nav-6-3-9 first"> <a href="grid.html"> <span>Flat Shoes</span> </a> </li>
                        <li class="level2 nav-6-3-10"> <a href="grid.html"> <span>Flat Sandals</span> </a> </li>
                        <li class="level2 nav-6-3-11"> <a href="grid.html"> <span>Boots</span> </a> </li>
                        <li class="level2 nav-6-3-11"> <a href="grid.html"> <span>Boots</span> </a> </li>
                        <li class="level2 nav-6-3-12 last"> <a href="grid.html"> <span>Heels</span> </a> </li>
                      </ul>
                    </li>
                    <li class="level1 nav-6-4 parent item"> <a href="grid.html"> <span>Jewelry</span> </a>
                      <ul class="level1">
                        <li class="level2 nav-6-4-13 first"> <a href="grid.html"> <span>Bracelets</span> </a> </li>
                        <li class="level2 nav-6-4-14"> <a href="grid.html"> <span>Necklaces &amp; Pendants</span> </a> </li>
                        <li class="level2 nav-6-4-14"> <a href="grid.html"> <span>Necklaces</span> </a> </li>
                        <li class="level2 nav-6-4-14"> <a href="grid.html"> <span>Pendants</span> </a> </li>
                        <li class="level2 nav-6-4-15 last"> <a href="grid.html"> <span>Pins &amp; Brooches</span> </a> </li>
                      </ul>
                    </li>
                    <li class="level1 nav-6-5 parent item"> <a href="grid.html"> <span>Dresses</span> </a>
                      <ul class="level1">
                        <li class="level2 nav-6-5-16 first"> <a href="grid.html"> <span>Casual Dresses</span> </a> </li>
                        <li class="level2 nav-6-5-17"> <a href="grid.html"> <span>Evening</span> </a> </li>
                        <li class="level2 nav-6-5-18"> <a href="grid.html"> <span>Designer</span> </a> </li>
                        <li class="level2 nav-6-5-18"> <a href="grid.html"> <span>Designer</span> </a> </li>
                        <li class="level2 nav-6-5-19 last"> <a href="grid.html"> <span>Party</span> </a> </li>
                      </ul>
                    </li>
                    <li class="level1 nav-6-6 last parent item"> <a href="grid.html"> <span>Jackets</span> </a>
                      <ul class="level1">
                        <li class="level2 nav-6-7-24 first"> <a href="grid.html"> <span>Coats</span> </a> </li>
                        <li class="level2 nav-6-7-25"> <a href="grid.html"> <span>Jackets</span> </a> </li>
                        <li class="level2 nav-6-7-26"> <a href="grid.html"> <span>Leather Jackets</span> </a> </li>
                        <li class="level2 nav-6-7-26"> <a href="grid.html"> <span>Leather Jackets</span> </a> </li>
                        <li class="level2 nav-6-7-27 last"> <a href="grid.html"> <span>Blazers</span> </a> </li>
                      </ul>
                    </li>
                  </ul>
                </div>
                <div class="nav-block nav-block-right std grid12-3"> <a class="product-image" title="Stablished fact reader" href="#"> <img alt="Product image" src="products-images/product1.jpg" width="150"></a>
                  <div class="item-title"> <a href="#" title="Ut tincidunt tortor"> Sample Product </a> </div>
                  <div class="price-box"> <span  class="regular-price"> <span class="price">$125.00</span> </span> </div>
                </div>
              </div>
            </div>
          </li>
          <li class="level0 nav-7 level-top parent"> <a class="level-top" href="grid.html"> <span>Furniture</span> </a>
            <div class="level0-wrapper dropdown-6col" style="left: 0pt; display: none;">
              <div class="level0-wrapper2">
                <div class="nav-block nav-block-center grid12-8 itemgrid itemgrid-4col">
                  <ul class="level0">
                    <li class="level1 nav-7-1 first parent item"> <a href="grid.html"> <span>Smartphones</span> </a>
                      <ul class="level1">
                        <li class="level2 nav-7-1-1 first"> <a href="grid.html"> <span>Samsung</span> </a> </li>
                        <li class="level2 nav-7-1-2"> <a href="grid.html"> <span>Apple</span> </a> </li>
                        <li class="level2 nav-7-1-4"> <a href="grid.html"> <span>BlackBerry</span> </a> </li>
                        <li class="level2 nav-7-1-6"> <a href="grid.html"> <span>Nokia</span> </a> </li>
                        <li class="level2 nav-7-1-7 last"> <a href="grid.html"> <span>HTC</span> </a> </li>
                      </ul>
                    </li>
                    <li class="level1 nav-7-3 parent item"> <a href="grid.html"> <span>Cameras</span> </a>
                      <ul class="level1">
                        <li class="level2 nav-7-3-15 first"> <a href="grid.html"> <span>Digital Cameras</span> </a> </li>
                        <li class="level2 nav-7-3-16"> <a href="grid.html"> <span>Camcorders</span> </a> </li>
                        <li class="level2 nav-7-3-17"> <a href="grid.html"> <span>Lenses</span> </a> </li>
                        <li class="level2 nav-7-3-18"> <a href="grid.html"> <span>Filters</span> </a> </li>
                        <li class="level2 nav-7-3-19 last"> <a href="grid.html"> <span>Tripods</span> </a> </li>
                      </ul>
                    </li>
                    <li class="level1 nav-7-4 last parent item"> <a href="grid.html"> <span>Accessories</span> </a>
                      <ul class="level1">
                        <li class="level2 nav-7-2-8 first"> <a href="grid.html"> <span>Headsets</span> </a> </li>
                        <li class="level2 nav-7-2-9"> <a href="grid.html"> <span>Batteries</span> </a> </li>
                        <li class="level2 nav-7-2-10"> <a href="grid.html"> <span>Screen Protectors</span> </a> </li>
                        <li class="level2 nav-7-2-11"> <a href="grid.html"> <span>Memory Cards</span> </a> </li>
                        <li class="level2 nav-7-2-14 last"> <a href="grid.html"> <span>Cases</span> </a> </li>
                      </ul>
                    </li>
                  </ul>
                </div>
                <div class="nav-block nav-block-right std grid12-4"><a href="grid.html"><img src="images/menu_furniture.png" alt="furniture" class="fade-on-hover"></a> </div>
              </div>
            </div>
          </li>
          <li class="level0 nav-8 level-top"> <a href="grid.html" class="level-top"> <span>Boys</span> </a> </li>
          <li class="level0 nav-8 level-top"> <a href="grid.html" class="level-top"> <span>Girls</span> </a> </li>
          <li class="nav-custom-link level0 level-top parent"> <a class="level-top" href="#"><span>Custom</span></a>
            <div style="display: none; left: 0px;" class="level0-wrapper">
              <div class="header-nav-dropdown-wrapper clearer">
                <div class="grid12-5">
                  <h4 class="heading">HTML5 + CSS3</h4>
                  <div class="ccs3-html5-box"><em class="icon-html5">&nbsp;</em> <em class="icon-css3">&nbsp;</em></div>
                  <p>Our designed to deliver almost everything you want to do online without requiring additional plugins.CSS3 has been split into "modules".</p>
                </div>
                <div class="grid12-5">
                  <h4 class="heading">Responsive Design</h4>
                  <a href="#//">
                  <div class="icon-custom-reponsive"></div>
                  </a>
                  <p>Responsive design is a Web design to provide an optimal navigation with a minimum of resizing, and scrolling across a wide range of devices.</p>
                </div>
                <div class="grid12-5">
                  <h4 class="heading">Google Fonts</h4>
                  <a href="#//">
                  <div class="icon-custom-google-font"></div>
                  </a>
                  <p>Our font delivery service is built upon a reliable, global network of servers. Our flexible solution provides multiple implementation options.</p>
                </div>
                <div class="grid12-5">
                  <h4 class="heading">Smart Product Grid</h4>
                  <a href="#//">
                  <div class="icon-custom-grid"></div>
                  </a>
                  <p>Smart Product Grid is uses maximum available width of the screen to display content. It can be displayed on any screen or any devices.</p>
                </div>
                <br>
              </div>
            </div>
          </li>
        </ul>
        <div id="form-search" class="search-bar">
          <form id="search_mini_form" action="#" method="get">
            <input class="search-bar-input" placeholder="Search entire store here..." type="text" value="" name="search" id="search">
            <input class="search-bar-submit" type="submit" value="">
            <span class="search-icon"><img src="images/search-icon.png" alt="search-icon"></span>
          </form>
        </div>
      </div>
    </div>
  </nav>
  <!-- end nav -->
  
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
            <h1>最新推广</h1>
          </div>
          <div class="category-description std">
            <div class="slider-items-products">
              <div id="category-desc-slider" class="product-flexslider hidden-buttons">
                <div class="slider-items slider-width-col1"> 
                  
                  <!-- Item -->
                  <div class="item"> <a href="#x"><img alt="women_banner" src="images/women_banner.png"></a>
                    <div class="cat-img-title cat-bg cat-box">
                      <h2 class="cat-heading">广告一</h2>
                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                  </div>
                  <!-- End Item -->
                  
                  <!-- Item -->
                  <div class="item"> <a href="#x"><img alt="women_banner" src="images/women_banner.png"></a>
                    <div class="cat-img-title cat-bg cat-box">
                      <h2 class="cat-heading">广告二</h2>
                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                  </div>
                  <!-- End Item -->  
                  
                  <!-- Item -->
                  <div class="item"> <a href="#x"><img alt="women_banner" src="images/women_banner.png"></a>
                    <div class="cat-img-title cat-bg cat-box">
                      <h2 class="cat-heading">广告二</h2>
                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                  </div>
                  <!-- End Item -->
                
                  <!-- Item -->
                  <div class="item"> <a href="#x"><img alt="women_banner" src="images/women_banner.png"></a>
                    <div class="cat-img-title cat-bg cat-box">
                      <h2 class="cat-heading">广告三</h2>
                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                  </div>
                  <!-- End Item -->
                  
                </div>
              </div>
            </div>
          </div>
          <div class="category-products">
            <div class="toolbar">
              <div class="sorter">
                <div class="view-mode"> <span title="Grid" class="button button-active button-grid">Grid</span><a href="list.html" title="List" class="button button-list">List</a> </div>
              </div>
              <div id="sort-by">
                <label class="left">Sort By: </label>
                <ul>
                  <li><a href="#">Position<span class="right-arrow"></span></a>
                    <ul>
                      <li><a href="#">Name</a></li>
                      <li><a href="#">Price</a></li>
                      <li><a href="#">Position</a></li>
                    </ul>
                  </li>
                </ul>
                <a class="button-asc left" href="#" title="Set Descending Direction"><span style="color:#999;font-size:11px;" class="glyphicon glyphicon-arrow-up"></span></a> </div>
              <div class="pager">
                <div id="limiter">
                  <label>View: </label>
                  <ul>
                    <li><a href="#">15<span class="right-arrow"></span></a>
                      <ul>
                        <li><a href="#">20</a></li>
                        <li><a href="#">30</a></li>
                        <li><a href="#">35</a></li>
                      </ul>
                    </li>
                  </ul>
                </div>
                <div class="pages">
                  <label>Page:</label>
                  <ul class="pagination">
                    <li><a href="#">&laquo;</a></li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">&raquo;</a></li>
                  </ul>
                </div>
              </div>
            </div>
            <ul class="products-grid">
		 <li class="item col-lg-4 col-md-3 col-sm-4 col-xs-12">
                  <div class="item-inner">
                    <div class="product-block">
                        <div class="product-image"> <a href="product_detail.html">
                          <figure class="product-display">
                            <div class="sale-label sale-top-left">Sale</div>
                            <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt="Sample Product" style="display: block;"> <img class="product-secondpic" alt=" Sample Product" src="products-images/product1.jpg"> </figure>
                          </a> </div>
                        <div class="product-meta">
                          <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a>
                 
                            <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a>
                           
                            <a class="quickview" href="javascript:;"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                        </div>
                      </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title"> <a href="product_detail.html" title="Retis lapen casen"> Sample Product</a> </div>
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
                </li>
                <li class="item col-lg-4 col-md-3 col-sm-4 col-xs-12">
                  <div class="item-inner">
                    <div class="item-img">
                      <div class="product-block">
                        <div class="product-image"> <a href="product_detail.html">
                          <figure class="product-display">
                            <div class="new-label new-top-left">New</div>
                            <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt=" Sample Product" style="display: block;"> <img class="product-secondpic" alt=" Sample Product" src="products-images/product1.jpg"> </figure>
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
                        <div class="item-title"> <a href="product_detail.html" title="Ut tincidunt tortor"> Sample Product</a> </div>
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
                </li>
                <li class="item col-lg-4 col-md-3 col-sm-4 col-xs-12">
                  <div class="item-inner">
                    <div class="item-img">
                      <div class="product-block">
                        <div class="product-image"> <a href="product_detail.html">
                          <figure class="product-display">
                            <div class="sale-label new-top-right">Sale</div>
                            <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt=" Sample Product" style="display: block;"> <img class="product-secondpic" alt=" Sample Product" src="products-images/product1.jpg"> </figure>
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
                        <div class="item-title"> <a href="product_detail.html" title="Ut tincidunt tortor"> Sample Product</a> </div>
                        <div class="item-content">
                          
                          <div class="item-price">
                            <div class="price-box">
                              <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price" > $567.00 </span> </p>
                              <p class="special-price"> <span class="price-label">Special Price</span> <span class="price" > $456.00 </span> </p>
                            </div>
                          </div><div class="rating">
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
                </li>
                <li class="item col-lg-4 col-md-3 col-sm-4 col-xs-12">
                  <div class="item-inner">
                    <div class="product-block">
                        <div class="product-image"> <a href="product_detail.html">
                          <figure class="product-display">
                            <div class="new-label new-top-left">New</div>
                            <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt=" Sample Product" style="display: block;"> <img class="product-secondpic" alt=" Sample Product" src="products-images/product1.jpg"> </figure>
                          </a> </div>
                        <div class="product-meta">
                          <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a>
                 
                            <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a>
                           
                            <a class="quickview" href="javascript:;"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                        </div>
                      </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title"> <a href="product_detail.html" title="Stablished fact reader"> Sample Product </a> </div>
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
                </li>
				<li class="item col-lg-4 col-md-3 col-sm-4 col-xs-12">
                  <div class="item-inner">
                    <div class="product-block">
                        <div class="product-image"> <a href="product_detail.html">
                          <figure class="product-display">
                            <div class="sale-label sale-top-left">Sale</div>
                            <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt=" Sample Product" style="display: block;"> <img class="product-secondpic" alt=" Sample Product" src="products-images/product1.jpg"> </figure>
                          </a> </div>
                        <div class="product-meta">
                          <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a>
                 
                            <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a>
                           
                            <a class="quickview" href="javascript:;"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                        </div>
                      </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title"> <a href="product_detail.html" title="Retis lapen casen"> Sample Product</a> </div>
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
                </li>
                <li class="item col-lg-4 col-md-3 col-sm-4 col-xs-12">
                  <div class="item-inner">
                    <div class="item-img">
                      <div class="product-block">
                        <div class="product-image"> <a href="product_detail.html">
                          <figure class="product-display">
                            <div class="new-label new-top-left">New</div>
                            <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt=" Sample Product" style="display: block;"> <img class="product-secondpic" alt=" Sample Product" src="products-images/product1.jpg"> </figure>
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
                        <div class="item-title"> <a href="product_detail.html" title="Ut tincidunt tortor"> Sample Product</a> </div>
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
                </li>
                <li class="item col-lg-4 col-md-3 col-sm-4 col-xs-12">
                  <div class="item-inner">
                    <div class="item-img">
                      <div class="product-block">
                        <div class="product-image"> <a href="product_detail.html">
                          <figure class="product-display">
                            <div class="new-label new-top-left">New</div>
                            <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt=" Sample Product" style="display: block;"> <img class="product-secondpic" alt=" Sample Product" src="products-images/product1.jpg"> </figure>
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
                        <div class="item-title"> <a href="product_detail.html" title="Ut tincidunt tortor"> Sample Product</a> </div>
                        <div class="item-content">
                          
                          <div class="item-price">
                            <div class="price-box">
                              <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price" > $567.00 </span> </p>
                              <p class="special-price"> <span class="price-label">Special Price</span> <span class="price" > $456.00 </span> </p>
                            </div>
                          </div><div class="rating">
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
                </li>
                <li class="item col-lg-4 col-md-3 col-sm-4 col-xs-12">
                  <div class="item-inner">
                    <div class="product-block">
                        <div class="product-image"> <a href="product_detail.html">
                          <figure class="product-display">
                            <div class="new-label new-top-left">New</div>
                            <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt=" Sample Product" style="display: block;"> <img class="product-secondpic" alt=" Sample Product" src="products-images/product1.jpg"> </figure>
                          </a> </div>
                        <div class="product-meta">
                          <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a>
                 
                            <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a>
                           
                            <a class="quickview" href="javascript:;"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                        </div>
                      </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title"> <a href="product_detail.html" title="Stablished fact reader"> Sample Product </a> </div>
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
                </li>
				
				<li class="item col-lg-4 col-md-3 col-sm-4 col-xs-12">
                  <div class="item-inner">
                    <div class="product-block">
                        <div class="product-image"> <a href="product_detail.html">
                          <figure class="product-display">
                            <div class="new-label new-top-left">New</div>
                            <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt=" Sample Product" style="display: block;"> <img class="product-secondpic" alt=" Sample Product" src="products-images/product1.jpg"> </figure>
                          </a> </div>
                        <div class="product-meta">
                          <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a>
                 
                            <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a>
                           
                            <a class="quickview" href="javascript:;"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                        </div>
                      </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title"> <a href="product_detail.html" title="Stablished fact reader"> Sample Product </a> </div>
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
                </li>
				
          
          
		 <li class="item col-lg-4 col-md-3 col-sm-4 col-xs-12">
                  <div class="item-inner">
                    <div class="product-block">
                        <div class="product-image"> <a href="product_detail.html">
                          <figure class="product-display">
                            <div class="sale-label sale-top-left">Sale</div>
                            <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt=" Sample Product" style="display: block;"> <img class="product-secondpic" alt=" Sample Product" src="products-images/product1.jpg"> </figure>
                          </a> </div>
                        <div class="product-meta">
                          <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a>
                 
                            <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a>
                           
                            <a class="quickview" href="javascript:;"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                        </div>
                      </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title"> <a href="product_detail.html" title="Retis lapen casen"> Sample Product</a> </div>
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
                </li>
                <li class="item col-lg-4 col-md-3 col-sm-4 col-xs-12">
                  <div class="item-inner">
                    <div class="item-img">
                      <div class="product-block">
                        <div class="product-image"> <a href="product_detail.html">
                          <figure class="product-display">
                            <div class="new-label new-top-left">New</div>
                            <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt=" Sample Product" style="display: block;"> <img class="product-secondpic" alt=" Sample Product" src="products-images/product1.jpg"> </figure>
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
                        <div class="item-title"> <a href="product_detail.html" title="Ut tincidunt tortor"> Sample Product</a> </div>
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
                </li>
                <li class="item col-lg-4 col-md-3 col-sm-4 col-xs-12">
                  <div class="item-inner">
                    <div class="item-img">
                      <div class="product-block">
                        <div class="product-image"> <a href="product_detail.html">
                          <figure class="product-display">
                            <div class="sale-label new-top-right">Sale</div>
                            <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt=" Sample Product" style="display: block;"> <img class="product-secondpic" alt=" Sample Product" src="products-images/product1.jpg"> </figure>
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
                        <div class="item-title"> <a href="product_detail.html" title="Ut tincidunt tortor"> Sample Product</a> </div>
                        <div class="item-content">
                          
                          <div class="item-price">
                            <div class="price-box">
                              <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price" > $567.00 </span> </p>
                              <p class="special-price"> <span class="price-label">Special Price</span> <span class="price" > $456.00 </span> </p>
                            </div>
                          </div><div class="rating">
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
                </li>
                <li class="item col-lg-4 col-md-3 col-sm-4 col-xs-12">
                  <div class="item-inner">
                    <div class="product-block">
                        <div class="product-image"> <a href="product_detail.html">
                          <figure class="product-display">
                            <div class="new-label new-top-left">New</div>
                            <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt=" Sample Product" style="display: block;"> <img class="product-secondpic" alt=" Sample Product" src="products-images/product1.jpg"> </figure>
                          </a> </div>
                        <div class="product-meta">
                          <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a>
                 
                            <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a>
                           
                            <a class="quickview" href="javascript:;"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                        </div>
                      </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title"> <a href="product_detail.html" title="Stablished fact reader"> Sample Product </a> </div>
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
                </li>
				<li class="item col-lg-4 col-md-3 col-sm-4 col-xs-12">
                  <div class="item-inner">
                    <div class="product-block">
                        <div class="product-image"> <a href="product_detail.html">
                          <figure class="product-display">
                            <div class="sale-label sale-top-left">Sale</div>
                            <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt=" Sample Product" style="display: block;"> <img class="product-secondpic" alt=" Sample Product" src="products-images/product1.jpg"> </figure>
                          </a> </div>
                        <div class="product-meta">
                          <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a>
                 
                            <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a>
                           
                            <a class="quickview" href="javascript:;"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                        </div>
                      </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title"> <a href="product_detail.html" title="Retis lapen casen"> Sample Product</a> </div>
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
                </li>
                <li class="item col-lg-4 col-md-3 col-sm-4 col-xs-12">
                  <div class="item-inner">
                    <div class="item-img">
                      <div class="product-block">
                        <div class="product-image"> <a href="product_detail.html">
                          <figure class="product-display">
                            <div class="new-label new-top-left">New</div>
                            <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt=" Sample Product" style="display: block;"> <img class="product-secondpic" alt=" Sample Product" src="products-images/product1.jpg"> </figure>
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
                        <div class="item-title"> <a href="product_detail.html" title="Ut tincidunt tortor"> Sample Product</a> </div>
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
                </li>
                <li class="item col-lg-4 col-md-3 col-sm-4 col-xs-12">
                  <div class="item-inner">
                    <div class="item-img">
                      <div class="product-block">
                        <div class="product-image"> <a href="product_detail.html">
                          <figure class="product-display">
                            <div class="new-label new-top-left">New</div>
                            <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt=" Sample Product" style="display: block;"> <img class="product-secondpic" alt=" Sample Product" src="products-images/product1.jpg"> </figure>
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
                        <div class="item-title"> <a href="product_detail.html" title="Ut tincidunt tortor"> Sample Product</a> </div>
                        <div class="item-content">
                          
                          <div class="item-price">
                            <div class="price-box">
                              <p class="old-price"> <span class="price-label">Regular Price:</span> <span class="price" > $567.00 </span> </p>
                              <p class="special-price"> <span class="price-label">Special Price</span> <span class="price" > $456.00 </span> </p>
                            </div>
                          </div><div class="rating">
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
                </li>
                <li class="item col-lg-4 col-md-3 col-sm-4 col-xs-12">
                  <div class="item-inner">
                    <div class="product-block">
                        <div class="product-image"> <a href="product_detail.html">
                          <figure class="product-display">
                            <div class="new-label new-top-left">New</div>
                            <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt=" Sample Product" style="display: block;"> <img class="product-secondpic" alt=" Sample Product" src="products-images/product1.jpg"> </figure>
                          </a> </div>
                        <div class="product-meta">
                          <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a>
                 
                            <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a>
                           
                            <a class="quickview" href="javascript:;"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                        </div>
                      </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title"> <a href="product_detail.html" title="Stablished fact reader"> Sample Product </a> </div>
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
                </li>
				
				<li class="item col-lg-4 col-md-3 col-sm-4 col-xs-12">
                  <div class="item-inner">
                    <div class="product-block">
                        <div class="product-image"> <a href="product_detail.html">
                          <figure class="product-display">
                            <div class="new-label new-top-left">New</div>
                            <img src="products-images/product1.jpg" class="lazyOwl product-mainpic" alt=" Sample Product" style="display: block;"> <img class="product-secondpic" alt=" Sample Product" src="products-images/product1.jpg"> </figure>
                          </a> </div>
                        <div class="product-meta">
                          <div class="product-action"> <a class="addcart" href="shopping_cart.html"> <i class="icon-shopping-cart">&nbsp;</i> Add to cart </a>
                 
                            <a class="wishlist" href="wishlist.html"> <i class="icon-heart">&nbsp;</i> </a>
                           
                            <a class="quickview" href="javascript:;"> <i class="icon-zoom">&nbsp;</i> </a> </div>
                        </div>
                      </div>
                    <div class="item-info">
                      <div class="info-inner">
                        <div class="item-title"> <a href="product_detail.html" title="Stablished fact reader"> Sample Product </a> </div>
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
                </li>
        </ul>
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
