<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<c:set var="server_path" value="http://localhost:8080/ArtworkWeb" scope="page"/>

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
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
<link rel="stylesheet" href="css/owl.theme.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.css" type="text/css">
<link rel="stylesheet" href="css/blogmate.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">


<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,300,700,800,400,600' rel='stylesheet' type='text/css'>
</head>
<body>
<div class="page">
 	<c:import url="../common/header.jsp"/>
  
  <div class="main-container col2-right-layout">
    <div class="main container">
      <div class="row">
        <div class="col-main col-sm-9 wow bounceInUp animated">
          
          <div class="blog-wrapper" id="main"><div class="page-title new_page_title">
            <h2>资讯</h2>
          </div>
            <div class="site-content" id="primary">
              <div role="main" id="content">
                <article class="blog_entry clearfix" >
                  <header class="blog_entry-header clearfix">
                    <div class="blog_entry-header-inner">
                      <h2 class="blog_entry-title"><c:out value="${information.title}"/></h2>
                    </div>
                    <!--blog_entry-header-inner--> 
                  </header>
                  <!--blog_entry-header clearfix-->
                  <div class="entry-content">
                    <div class="featured-thumb"><a href="#">
                    	<c:forEach items="${information.inforPicses}" var="pic">
                    		<img alt="blog-img4" src="${server_path}${pic.url}"/>
                    	</c:forEach>
                    	</a>
                    </div>
                    <div class="entry-content">
                      <p><c:out value="${information.content}"/></p>
                    </div>
                  </div>
                  <footer class="entry-meta"> This entry was posted						in <a rel="category tag" title="View all posts in First Category" href="#first-category">First Category</a> On
                    <time datetime="2014-07-10T06:53:43+00:00" class="entry-date">Jul 10, 2014</time>
                    . </footer>
                </article>
                <div class="comment-content wow bounceInUp animated">
                  <div class="comments-wrapper">
                    <h3> Comments </h3>
                    <ul class="commentlist">
                      <li class="comment">
                        <div class="comment-wrapper" >
                          <div class="comment-author vcard"> <p class="gravatar"><a href="#"><img width="60" height="60" alt="avatar" src="images/avatar60x60.jpg"></a></p><span class="author">John Doe</span> </div>
                          <!--comment-author vcard-->
                          <div class="comment-meta">
                            <time datetime="2014-07-10T07:26:28+00:00" class="entry-date">Thu, Jul 10, 2014 07:26:28 am</time>
                            . </div>
                          <!--comment-meta-->
                          <div class="comment-body"> Curabitur at vestibulum sem. Aliquam vehicula neque ac nibh suscipit ultrices. Morbi interdum accumsan arcu nec scelerisque ellentesque id erat sem, ut commodo nulla. Sed a nulla et eros fringilla. Phasellus eget purus nulla. </div>
                        </div>
                      </li>
                      <!--comment-->
                      <li class="comment">
                        <div class="comment-wrapper" >
                          <div class="comment-author vcard"><p class="gravatar"><a href="#"><img width="60" height="60" alt="avatar" src="images/avatar60x60.jpg"></a></p> <span class="author">John Doe</span> </div>
                          <!--comment-author vcard-->
                          <div class="comment-meta">
                            <time datetime="2014-07-10T07:27:08+00:00" class="entry-date">Thu, Jul 10, 2014 07:27:08 am</time>
                            . </div>
                          <!--comment-meta-->
                          <div class="comment-body"> Curabitur at vestibulum sem. Aliquam vehicula neque ac nibh suscipit ultrices. Morbi interdum accumsan arcu nec scelerisque ellentesque id erat sem, ut commodo nulla. Sed a nulla et eros fringilla. Phasellus eget purus nulla. </div>
                        </div>
                      </li>
                      <!--comment-->
                      <li class="comment">
                        <div class="comment-wrapper" >
                          <div class="comment-author vcard"> <p class="gravatar"><a href="#"><img width="60" height="60" alt="avatar" src="images/avatar60x60.jpg"></a></p><span class="author">John Doe</span> </div>
                          <!--comment-author vcard-->
                          <div class="comment-meta">
                            <time datetime="2014-07-10T07:27:56+00:00" class="entry-date">Thu, Jul 10, 2014 07:27:56 am</time>
                            . </div>
                          <!--comment-meta-->
                          <div class="comment-body"> Curabitur at vestibulum sem. Aliquam vehicula neque ac nibh suscipit ultrices. Morbi interdum accumsan arcu nec scelerisque ellentesque id erat sem, ut commodo nulla. Sed a nulla et eros fringilla. Phasellus eget purus nulla. </div>
                        </div>
                      </li>
                      <!--comment-->
                      <li class="comment">
                        <div class="comment-wrapper" >
                          <div class="comment-author vcard"><p class="gravatar"><a href="#"><img width="60" height="60" alt="avatar" src="images/avatar60x60.jpg"></a></p> <span class="author">Lisa White</span> </div>
                          <!--comment-author vcard-->
                          <div class="comment-meta">
                            <time datetime="2014-07-10T07:28:32+00:00" class="entry-date">Thu, Jul 10, 2014 07:28:32 am</time>
                            . </div>
                          <!--comment-meta-->
                          <div class="comment-body"> Curabitur at vestibulum sem. Aliquam vehicula neque ac nibh suscipit ultrices. Morbi interdum accumsan arcu nec scelerisque ellentesque id erat sem, ut commodo nulla. Sed a nulla et eros fringilla. </div>
                        </div>
                      </li>
                      <!--comment-->
                    </ul>
                    <!--commentlist--> 
                  </div>
                  <!--comments-wrapper-->
                  
                  <div class="comments-form-wrapper clearfix">
                    <h3>Leave A reply</h3>
                    <form class="comment-form" method="post" id="postComment" action="#">
                      <div class="field">
                        <label>Name<em class="required">*</em></label>
                        <input type="text" class="input-text" title="Name" value="" id="user" name="user_name">
                      </div>
                      <div class="field">
                        <label>Email<em class="required">*</em></label>
                        <input type="text" class="input-text validate-email" title="Email" value="" name="user_email">
                      </div>
                      <div class="clear"></div>
                      <div class="field aw-blog-comment-area">
                        <label>Comment<em class="required">*</em></label>
                        <textarea rows="5" cols="50" class="input-text" title="Comment" id="comment1" name="comment"></textarea>
                      </div>
                      <div style="width:96%" class="button-set">
                        <input type="hidden" value="1" name="blog_id">
                        <button type="submit" class="bnt-comment"><span><span>Add Comment</span></span></button>
                      </div>
                    </form>
                  </div>
                  <!--comments-form-wrapper clearfix--> 
       
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-right sidebar col-sm-3 wow bounceInUp animated">
          <div role="complementary" class="widget_wrapper13" id="secondary">
            <div class="popular-posts widget widget__sidebar" id="recent-posts-4">
              <h3 class="widget-title">Most Popular Post</h3>
              <div class="widget-content">
                <ul class="posts-list unstyled clearfix">
                  <li>
                    <figure class="featured-thumb"> <a href="blog_detail.html"> <img width="80" height="53" alt="blog image" src="images/blog-img1.jpg"> </a> </figure>
                    <!--featured-thumb-->
                    <h4><a title="Pellentesque posuere" href="blog_detail.html">Pellentesque posuere</a></h4>
                    <p class="post-meta"><i class="icon-calendar"></i>
                      <time datetime="2014-07-10T07:09:31+00:00" class="entry-date">Jul 10, 2014</time>
                      .</p>
                  </li>
                  <li>
                    <figure class="featured-thumb"> <a href="blog_detail.html"> <img width="80" height="53" alt="blog image" src="images/blog-img1.jpg"> </a> </figure>
                    <!--featured-thumb-->
                    <h4><a title="Dolor lorem ipsum" href="blog_detail.html">Dolor lorem ipsum</a></h4>
                    <p class="post-meta"><i class="icon-calendar"></i>
                      <time datetime="2014-07-10T07:01:18+00:00" class="entry-date">Jul 10, 2014</time>
                      .</p>
                  </li>
                  <li>
                    <figure class="featured-thumb"> <a href="blog_detail.html"> <img width="80" height="53" alt="blog image" src="images/blog-img1.jpg"> </a> </figure>
                    <!--featured-thumb-->
                    <h4><a title="Aliquam eget sapien placerat" href="blog_detail.html">Aliquam eget sapien placerat</a></h4>
                    <p class="post-meta"><i class="icon-calendar"></i>
                      <time datetime="2014-07-10T06:59:14+00:00" class="entry-date">Jul 10, 2014</time>
                      .</p>
                  </li>
                  <li>
                    <figure class="featured-thumb"> <a href="blog_detail.html"> <img width="80" height="53" alt="blog image" src="images/blog-img1.jpg"> </a> </figure>
                    <!--featured-thumb-->
                    <h4><a title="Pellentesque habitant morbi" href="blog_detail.html">Pellentesque habitant morbi</a></h4>
                    <p class="post-meta"><i class="icon-calendar"></i>
                      <time datetime="2014-07-10T06:53:43+00:00" class="entry-date">Jul 10, 2014</time>
                      .</p>
                  </li>
                </ul>
              </div>
              <!--widget-content--> 
            </div>
            <div class="popular-posts widget widget_categories" id="categories-2">
              <h3 class="widget-title">Categories</h3>
              <ul>
                <li class="cat-item cat-item-19599"><a href="#first-category">First Category</a></li>
                <li class="cat-item cat-item-19599"><a href="#second-category">Second Category</a></li>
              </ul>
            </div>
            <!-- Banner Ad Block -->
            <div class="ad-spots widget widget__sidebar">
              <h3 class="widget-title">Ad Spots</h3>
              <div class="widget-content"><a target="_self" href="#" title=""><img alt="offer banner" src="images/offerBanner.jpg"></a></div>
            </div>
            <!-- Banner Text Block -->
            <div class="text-widget widget widget__sidebar">
              <h3 class="widget-title">Text Widget</h3>
              <div class="widget-content">Mauris at blandit erat. Nam vel tortor non quam scelerisque cursus. Praesent nunc vitae magna pellentesque auctor. Quisque id lectus.<br>
                <br>
                Massa, eget eleifend tellus. Proin nec ante leo ssim nunc sit amet velit malesuada pharetra. Nulla neque sapien, sollicitudin non ornare quis, malesuada.</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
 
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
              <img src="images/mgkloading1.gif" id="loader" alt="loader" style="display:none;"> </div>
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