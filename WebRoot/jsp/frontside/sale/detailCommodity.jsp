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
							<c:forEach items="${information.inforPicses}" var="pic">   		 	
								<c:if test = "${urlsNum == 1}">
                    				<div class="large-image"> <a href="products-images/product1.jpg" class="cloud-zoom" id="zoom1" rel="useWrapper: false, adjustY:0, adjustX:20"> <img alt="product-image" src="${pic.url}"> </a> </div>
									<c:set var="urlsNum" scope="page" value="2"/>		
								</c:if>
	                     	</c:forEach> 
                    <div class="flexslider flexslider-thumb">
                      <ul class="previews-list slides">
                      	<c:forEach items="${commodity.commodityPices}" var="pic">
                        <li><a href='products-images/product1.jpg' class='cloud-zoom-gallery' rel="useZoom: 'zoom1', smallImage: 'products-images/product1.jpg' "><img src="${pic.url}" alt="Thumbnail 1"/></a></li>
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
                    <h1><c:out value="${commodity.name}"/></h1>
                  </div>
                  <div class="ratings">
                    <div class="rating-box">
                      <div style="width:60%" class="rating"></div>
                    </div>
                    <p class="rating-links"> <a href="#">1 Review(s)</a> <span class="separator">|</span> <a href="#">Add Your Review</a> </p>
                  </div>
                  <div class="short-description">
                    <h2>Quick Overview</h2>
                    <p><c:out value="${commodity.introduction}"/></p>
                  </div>
                  <p class="availability in-stock">Availability: <span>In Stock</span></p>
                  <div class="price-block">
                    <div class="price-box">
                      <p class="special-price"> <span class="price-label">Special Price</span> <span id="product-price-48" class="price"><c:out value="${commodity.price}"/> </span> </p>
                    </div>
                  </div>
                  <div class="add-to-box">
                    <div class="add-to-cart">
                      <label for="qty">Quantity:</label>
                      <div class="pull-left">
                        <div class="custom pull-left">
                          <button onClick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 0 ) result.value--;return false;" class="reduced items-count" type="button"><i class="icon-minus">&nbsp;</i></button>
                          <input type="text" class="input-text qty" title="Qty" value="1" maxlength="12" id="qty" name="qty">
                          <button onClick="var result = document.getElementById('qty'); var qty = result.value; if( !isNaN( qty )) result.value++;return false;" class="increase items-count" type="button"><i class="icon-plus">&nbsp;</i></button>
                        </div>
                      </div>
                      <input id="hidden_user_id" type="hidden" value="${sessionScope.user.id}"/>
                      <input id="hidden_commodity_id" type="hidden" value="${commodity.id}"/>
                      <button id="	" class="button btn-cart" title="Add to Cart" type="button"><span><i class="icon-basket"></i> Add to Cart</span></button>
                    </div>
                    <div class="email-addto-box">
                      <ul class="add-to-links">
                        <li> <a class="link-wishlist" href="wishlist.html"><span>Add to Wishlist</span></a></li>
                        <li><span class="separator">|</span> <a class="link-compare" href="compare.html"><span>Add to Compare</span></a></li>
                      </ul>
                      <p class="email-friend"><a href="#" class=""><span>Email to a Friend</span></a></p>
                    </div>
                  </div>
                </div>
                <div class="product-img-box col-sm-3 col-xs-12">
                  <div class="product-additional"> <img alt="custom block" src="images/offer-banner1.png"> </div>
                </div>
              </form>
            </div>
            <div class="product-collateral">
              <ul id="product-detail-tab" class="nav nav-tabs product-tabs">
                <li class="active"> <a href="#product_tabs_description" data-toggle="tab"> Product Description </a> </li>
                <li><a href="#product_tabs_tags" data-toggle="tab">Tags</a></li>
                <li> <a href="#reviews_tabs" data-toggle="tab">Reviews</a> </li>
                <li> <a href="#product_tabs_custom" data-toggle="tab">Custom Tab</a> </li>
                <li> <a href="#product_tabs_custom1" data-toggle="tab">Custom Tab1</a> </li>
              </ul>
              <div id="productTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="product_tabs_description">
                  <div class="std">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam fringilla augue nec est tristique auctor. Donec non est at libero vulputate rutrum. Morbi ornare lectus quis justo gravida semper. Nulla tellus mi, vulputate adipiscing cursus eu, suscipit id nulla. Donec a neque libero. Pellentesque aliquet, sem eget laoreet ultrices, ipsum metus feugiat sem, quis fermentum turpis eros eget velit. Donec ac tempus ante. Fusce ultricies massa massa. Fusce aliquam, purus eget sagittis vulputate, sapien libero hendrerit est, sed commodo augue nisi non neque. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor, lorem et placerat vestibulum, metus nisi posuere nisl, in accumsan elit odio quis mi. Cras neque metus, consequat et blandit et, luctus a nunc. Etiam gravida vehicula tellus, in imperdiet ligula euismod eget. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nam erat mi, rutrum at sollicitudin rhoncus, ultricies posuere erat. Duis convallis, arcu nec aliquam consequat, purus felis vehicula felis, a dapibus enim lorem nec augue.</p>
                    <p> Nunc facilisis sagittis ullamcorper. Proin lectus ipsum, gravida et mattis vulputate, tristique ut lectus. Sed et lorem nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean eleifend laoreet congue. Vivamus adipiscing nisl ut dolor dignissim semper. Nulla luctus malesuada tincidunt. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Integer enim purus, posuere at ultricies eu, placerat a felis. Suspendisse aliquet urna pretium eros convallis interdum. Quisque in arcu id dui vulputate mollis eget non arcu. Aenean et nulla purus. Mauris vel tellus non nunc mattis lobortis.</p>
                  </div>
                </div>
                <div class="tab-pane fade" id="product_tabs_tags">
                  <div class="box-collateral box-tags">
                    <div class="tags">
                      <form id="addTagForm" action="#" method="get">
                        <div class="form-add-tags">
                          <label for="productTagName">Add Tags:</label>
                          <div class="input-box">
                            <input class="input-text required-entry" name="productTagName" id="productTagName" type="text">
                            <button type="button" title="Add Tags" class=" button btn-add" onClick="submitTagForm()"> <span>Add Tags</span> </button>
                          </div>
                          <!--input-box-->
                        </div>
                      </form>
                    </div>
                    <!--tags-->
                    <p class="note">Use spaces to separate tags. Use single quotes (') for phrases.</p>
                  </div>
                </div>
                <div class="tab-pane fade" id="reviews_tabs">
                  <div class="box-collateral box-reviews" id="customer-reviews">
                    <div class="box-reviews1">
                      <div class="form-add">
                        <form id="review-form" method="post" action="#">
                          <h3>Write Your Own Review</h3>
                          <fieldset>
                          <h4>How do you rate this product? <em class="required">*</em></h4>
                          <span id="input-message-box"></span>
                          <table id="product-review-table" class="data-table">
                            <thead>
                              <tr class="first last">
                                <th>&nbsp;</th>
                                <th><span class="nobr">1 *</span></th>
                                <th><span class="nobr">2 *</span></th>
                                <th><span class="nobr">3 *</span></th>
                                <th><span class="nobr">4 *</span></th>
                                <th><span class="nobr">5 *</span></th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr class="first odd">
                                <th>Price</th>
                                <td class="value"><input type="radio" class="radio" value="11" id="Price_1" name="ratings[3]"></td>
                                <td class="value"><input type="radio" class="radio" value="12" id="Price_2" name="ratings[3]"></td>
                                <td class="value"><input type="radio" class="radio" value="13" id="Price_3" name="ratings[3]"></td>
                                <td class="value"><input type="radio" class="radio" value="14" id="Price_4" name="ratings[3]"></td>
                                <td class="value last"><input type="radio" class="radio" value="15" id="Price_5" name="ratings[3]"></td>
                              </tr>
                              <tr class="even">
                                <th>Value</th>
                                <td class="value"><input type="radio" class="radio" value="6" id="Value_1" name="ratings[2]"></td>
                                <td class="value"><input type="radio" class="radio" value="7" id="Value_2" name="ratings[2]"></td>
                                <td class="value"><input type="radio" class="radio" value="8" id="Value_3" name="ratings[2]"></td>
                                <td class="value"><input type="radio" class="radio" value="9" id="Value_4" name="ratings[2]"></td>
                                <td class="value last"><input type="radio" class="radio" value="10" id="Value_5" name="ratings[2]"></td>
                              </tr>
                              <tr class="last odd">
                                <th>Quality</th>
                                <td class="value"><input type="radio" class="radio" value="1" id="Quality_1" name="ratings[1]"></td>
                                <td class="value"><input type="radio" class="radio" value="2" id="Quality_2" name="ratings[1]"></td>
                                <td class="value"><input type="radio" class="radio" value="3" id="Quality_3" name="ratings[1]"></td>
                                <td class="value"><input type="radio" class="radio" value="4" id="Quality_4" name="ratings[1]"></td>
                                <td class="value last"><input type="radio" class="radio" value="5" id="Quality_5" name="ratings[1]"></td>
                              </tr>
                            </tbody>
                          </table>
                          <input type="hidden" value="" class="validate-rating" name="validate_rating">
                          <div class="review1">
                            <ul class="form-list">
                              <li>
                                <label class="required" for="nickname_field">Nickname<em>*</em></label>
                                <div class="input-box">
                                  <input type="text" class="input-text required-entry" id="nickname_field" name="nickname">
                                </div>
                              </li>
                              <li>
                                <label class="required" for="summary_field">Summary<em>*</em></label>
                                <div class="input-box">
                                  <input type="text" class="input-text required-entry" id="summary_field" name="title">
                                </div>
                              </li>
                            </ul>
                          </div>
                          <div class="review2">
                            <ul>
                              <li>
                                <label class="label-wide" for="review_field">Review<em>*</em></label>
                                <div class="input-box">
                                  <textarea class="required-entry" rows="3" cols="5" id="review_field" name="detail"></textarea>
                                </div>
                              </li>
                            </ul>
                            <div class="buttons-set">
                              <button class="button submit" title="Submit Review" type="submit"><span>Submit Review</span></button>
                            </div>
                          </div>
                          </fieldset>
                        </form>
                      </div>
                    </div>
                    <div class="box-reviews2">
                      <h3>Customer Reviews</h3>
                      <div class="box visible">
                        <ul>
                          <li>
                            <table class="ratings-table">
                              <tbody>
                                <tr>
                                  <th>Value</th>
                                  <td><div class="rating-box">
                                      <div class="rating" style="width:100%;"></div>
                                    </div></td>
                                </tr>
                                <tr>
                                  <th>Quality</th>
                                  <td><div class="rating-box">
                                      <div class="rating" style="width:100%;"></div>
                                    </div></td>
                                </tr>
                                <tr>
                                  <th>Price</th>
                                  <td><div class="rating-box">
                                      <div class="rating" style="width:100%;"></div>
                                    </div></td>
                                </tr>
                              </tbody>
                            </table>
                            <div class="review">
                              <h6><a href="#/catalog/product/view/id/61/">Excellent</a></h6>
                              <small>Review by <span>Leslie Prichard </span>on 1/3/2014 </small>
                              <div class="review-txt"> I have purchased shirts from Minimalism a few times and am never disappointed. The quality is excellent and the shipping is amazing. It seems like it's at your front door the minute you get off your pc. I have received my purchases within two days - amazing.</div>
                            </div>
                          </li>
                          <li class="even">
                            <table class="ratings-table">
                              <tbody>
                                <tr>
                                  <th>Value</th>
                                  <td><div class="rating-box">
                                      <div class="rating" style="width:100%;"></div>
                                    </div></td>
                                </tr>
                                <tr>
                                  <th>Quality</th>
                                  <td><div class="rating-box">
                                      <div class="rating" style="width:100%;"></div>
                                    </div></td>
                                </tr>
                                <tr>
                                  <th>Price</th>
                                  <td><div class="rating-box">
                                      <div class="rating" style="width:80%;"></div>
                                    </div></td>
                                </tr>
                              </tbody>
                            </table>
                            <div class="review">
                              <h6><a href="#/catalog/product/view/id/60/">Amazing</a></h6>
                              <small>Review by <span>Sandra Parker</span>on 1/3/2014 </small>
                              <div class="review-txt"> Minimalism is the online ! </div>
                            </div>
                          </li>
                          <li>
                            <table class="ratings-table">
                              <tbody>
                                <tr>
                                  <th>Value</th>
                                  <td><div class="rating-box">
                                      <div class="rating" style="width:100%;"></div>
                                    </div></td>
                                </tr>
                                <tr>
                                  <th>Quality</th>
                                  <td><div class="rating-box">
                                      <div class="rating" style="width:100%;"></div>
                                    </div></td>
                                </tr>
                                <tr>
                                  <th>Price</th>
                                  <td><div class="rating-box">
                                      <div class="rating" style="width:80%;"></div>
                                    </div></td>
                                </tr>
                              </tbody>
                            </table>
                            <div class="review">
                              <h6><a href="#/catalog/product/view/id/59/">Nicely</a></h6>
                              <small>Review by <span>Anthony  Lewis</span>on 1/3/2014 </small>
                              <div class="review-txt"> Unbeatable service and selection. This store has the best business model I have seen on the net. They are true to their word, and go the extra mile for their customers. I felt like a purchasing partner more than a customer. You have a lifetime client in me. </div>
                            </div>
                          </li>
                        </ul>
                      </div>
                      <div class="actions"> <a class="button view-all" id="revies-button"><span><span>View all</span></span></a> </div>
                    </div>
                    <div class="clear"></div>
                  </div>
                </div>
                <div class="tab-pane fade" id="product_tabs_custom">
                  <div class="product-tabs-content-inner clearfix">
                    <p><strong>Lorem Ipsum</strong><span>&nbsp;is
                      simply dummy text of the printing and typesetting industry. Lorem Ipsum
                      has been the industry's standard dummy text ever since the 1500s, when 
                      an unknown printer took a galley of type and scrambled it to make a type
                      specimen book. It has survived not only five centuries, but also the 
                      leap into electronic typesetting, remaining essentially unchanged. It 
                      was popularised in the 1960s with the release of Letraset sheets 
                      containing Lorem Ipsum passages, and more recently with desktop 
                      publishing software like Aldus PageMaker including versions of Lorem 
                      Ipsum.</span></p>
                  </div>
                </div>
                <div class="tab-pane fade" id="product_tabs_custom1">
                  <div class="product-tabs-content-inner clearfix">
                    <p> <strong> Comfortable </strong><span>&nbsp;preshrunk shirts. Highest Quality Printing.  6.1 oz. 100% preshrunk heavyweight cotton Shoulder-to-shoulder taping Double-needle sleeves and bottom hem     
                      
                      Lorem Ipsumis
                      simply dummy text of the printing and typesetting industry. Lorem Ipsum
                      has been the industry's standard dummy text ever since the 1500s, when 
                      an unknown printer took a galley of type and scrambled it to make a type
                      specimen book. It has survived not only five centuries, but also the 
                      leap into electronic typesetting, remaining essentially unchanged. It 
                      was popularised in the 1960s with the release of Letraset sheets 
                      containing Lorem Ipsum passages, and more recently with desktop 
                      publishing software like Aldus PageMaker including versions of Lorem 
                      Ipsum.</span></p>
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
</body>
</html>

