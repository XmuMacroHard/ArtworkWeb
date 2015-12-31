<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'header.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
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
          	<c:choose>
          	<c:when test="${sessionScope.user == null}">
            <div class="welcome-msg hidden-xs"> 欢迎游客，请登录 </div>
            </c:when>
          	<c:otherwise>
            <div class="welcome-msg hidden-xs" id="userItem"><c:out value="${sessionScope.user.email}"/></div>
           	</c:otherwise>         
            </c:choose>
            <!-- Header Top Links -->
            <div class="toplinks">
              <div class="links">
                <!-- Header Company -->
                <div class="dropdown block-company-wrapper"> <a role="button" data-toggle="dropdown" data-target="#" class="dropdown-toggle" href="#"> 个人中心 <span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="jsp/frontside/user/profile.jsp"> 个人信息 </a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="ShowAllAddressList">地址管理</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="jsp/frontside/user/user_purchase_order.jsp">商品订单</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="jsp/frontside/user/user_customization_order.jsp">定制订单</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="jsp/frontside/user/user_auction_order.jsp">拍卖订单</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="viewCart">我的购物车</a></li>                    
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="jsp/frontside/pay/recharge.jsp">充值中心</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="jsp/frontside/user/artist_certification.jsp">艺术家认证 </a></li>
                  </ul>
                </div>
                <c:if test="${sessionScope.user != null && sessionScope.rank == 'artist'}">
                <!-- End Header Company -->
                <div class="dropdown block-company-wrapper"> <a role="button" data-toggle="dropdown" data-target="#" class="dropdown-toggle" href="#"> 艺术家中心 <span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="jsp/frontside/artist/uploadCommodity.jsp">上传商品 </a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="showMyCommodity"> 我的商品 </a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="jsp/frontside/artist/my_purchase_order.jsp">商品订单</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="jsp/frontside/artist/my_customization_order.jsp">定制订单</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">拍卖订单</a></li>
                    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Advanced Search </a></li>
                  </ul>
                </div>
                </c:if>
                <c:choose>
          			<c:when test="${sessionScope.user == null}">
            			<div class="login"><a href="jsp/frontside/user/login.jsp"><span class="">请登录</span></a></div>
            		</c:when>
          			<c:otherwise>
           				 <div class="login"><a href="logoutAction"><span class="">登出</span></a></div>
           			</c:otherwise>         
            	</c:choose>
                
              </div>
            </div>
            <!-- End Header Top Links -->
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
              <ul style="display:none" class="submenu">
                <li>
                  <ul class="topnav">
                  <li class="level0 nav-6 level-top first parent"> <a class="level-top" href="showInfoOnHomePage"> <span>主页</span> </a>
                    </li>
                    <li class="level0 nav-1 level-top first parent"> <a href="jsp/frontside/sale/home_sale.jsp" class="level-top"> <span>商城</span> </a>
                    </li>
                    <li class="level0 nav-2 level-top parent"> <a href="jsp/frontside/order/home_order.jsp" class="level-top"> <span>定制</span> </a>
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
                    <li class="level0 nav-3 level-top parent"> <a href="showTodayAuctionAction.action" class="level-top"> <span>拍卖</span> </a>
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
                    <li class="level0 nav-6 level-top first parent"> <a class="level-top" href=""> <span>资讯</span> </a>
                      <ul class="level0">
              <li class="level1 first"><a href="getInfoListByType?datePos.colum=calligraphy"><span>书法栏目</span></a></li>
              <li class="level1 nav-10-2"> <a href="getInfoListByType?datePos.colum=painting"> <span>绘画栏目</span> </a> </li>
              <li class="level1 nav-10-3"> <a href="getInfoListByType?datePos.colum=sculpture"> <span>雕刻栏目</span> </a> </li>
              <li class="level1 nav-10-4"> <a href="getInfoListByType?datePos.colum=handicraft"> <span>手工制品栏目</span> </a> </li>
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
          <li id="nav-home" class="level0 parent drop-menu active"><a href="showInfoOnHomePage"><span>主页</span> </a>
          </li>
          <li class="level0 parent drop-menu"><a href=""><span>资讯</span> </a>
            <ul style="display: none;" class="level1">
              <li class="level1 first"><a href="getInfoListByType?datePos.colum=calligraphy"><span>书法栏目</span></a></li>
              <li class="level1 nav-10-2"> <a href="getInfoListByType?datePos.colum=painting"> <span>绘画栏目</span> </a> </li>
              <li class="level1 nav-10-3"> <a href="getInfoListByType?datePos.colum=sculpture"> <span>雕刻栏目</span> </a> </li>
              <li class="level1 nav-10-4"> <a href="getInfoListByType?datePos.colum=handicraft"> <span>手工制品栏目</span> </a> </li>
            </ul>
          </li>
          <li class="level0 nav-5 level-top first"> <a href="jsp/frontside/sale/home_sale.jsp" class="level-top"> <span>商城</span> <span class="category-label-hot">Hot</span></a>
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
          <li class="level0 nav-7 level-top parent"> <a href="jsp/frontside/order/home_order.jsp" class="level-top"> <span>定制</span> </a>
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
          <li class="level0 nav-6 level-top parent"> <a href="showTodayAuctionAction.action" class="level-top"> <span>拍卖</span> <span class="category-label">New</span></a>
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
                  <div class="price-box"> <span class="regular-price"> <span class="price">$125.00</span> </span> </div>
                </div>
              </div>
            </div>
          </li>
          <li class="level0 nav-7 level-top parent"> <a class="level-top" href="grid.html"> <span>待考虑</span> </a>
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
                <div class="nav-block nav-block-right std grid12-4"><a href="grid.html"><img src="images/menu_furniture.png" alt="menu_furniture" class="fade-on-hover"></a> </div>
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
  <script type="text/javascript" src="js/jquery.min.js"></script> 
  <script type="text/javascript" src="js/frontside/common/header.js"></script> 
  </body>
</html>

 
 