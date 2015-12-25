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
        <div class="table-responsive">
          <form method="post" action="#updatePost/">
            <input type="hidden" value="Vwww7itR3zQFe86m" name="form_key">
            <fieldset>
              <table class="data-table cart-table" id="shopping-cart-table">
                
                <thead>
                  <tr class="first last">
                    <th rowspan="1">&nbsp;</th>
                    <th rowspan="1"><span class="nobr">艺术品名</span></th>
                    <th rowspan="1"></th>
                    <th colspan="1" class="a-center"><span class="nobr">价格</span></th>
                    <th class="a-center" rowspan="1">Qty</th>
                    <th colspan="1" class="a-center">Subtotal</th>
                    <th class="a-center" rowspan="1">&nbsp;</th>
                  </tr>
                </thead>
                <tfoot>
                  <tr class="first last">
                    <td class="a-right last" colspan="50"><button onClick="{location.href='jsp/frontside/sale/home_sale.jsp'}" class="button btn-continue" title="Continue Shopping" type="button"><span><span>继续购物</span></span></button>
                      <button id="empty_cart_button" class="button btn-empty" title="Clear Cart" value="empty_cart" name="update_cart_action" type="submit"><span><span>Clear Cart</span></span></button>
                      <button class="button btn-update" title="Update Cart" value="update_qty" name="update_cart_action" type="submit"><span><span>Update Cart</span></span></button></td>
                  </tr>
                </tfoot>
                <tbody>
                <c:forEach items="${shoppingCart}" var="cartItem">
                  <tr class="first odd">
                    <td class="image">
                     	<a class="product-image" title="Sample Product" href="product_detail.html">
							<c:set var="urlsNum" scope="page" value="1"/>  
							<c:forEach items="${cartItem.commodity.commodityPices}" var="pic">   		 	
								<c:if test = "${urlsNum == 1}">
									<img width="75" alt="Sample Product" src="${server_path}${pic.url}"> 
									<%-- <div><c:out value="${server_path}${pic.url}"/></div> --%>
									<c:set var="urlsNum" scope="page" value="2"/>		
								</c:if>
	                     	</c:forEach> 
                    	</a> 
                    </td>
                    <td><h2 class="product-name"> <a href="getDetailedCommodity?commodity.id=${cartItem.commodity.id}"><c:out value="${cartItem.commodity.name}"/></a> </h2></td>
                    <td class="a-center"><a title="Edit item parameters" class="edit-bnt" href="#configure/id/15945/"></a></td>
                    <td class="a-right"><span class="cart-price"> <span class="price"><c:out value="${cartItem.commodity.price}"/></span> </span></td>
                    <td class="a-center movewishlist"><input maxlength="12" class="input-text qty" title="Qty" size="4" value="1" name="cart[15945][qty]"></td>
                    <td class="a-right movewishlist"><span class="cart-price"> <span class="price"><c:out value="${cartItem.commodity.price}"/></span> </span></td>
                    <td class="a-center last"><a class="button remove-item" title="Remove item" href="#"><span><span>Remove item</span></span></a></td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </fieldset>
          </form>
        </div>
        <!-- BEGIN CART COLLATERALS -->
        <div class="cart-collaterals row">
          <div class="col-sm-4">
            <div class="shipping">
              <h3>Estimate Shipping and Tax</h3>
              <div class="shipping-form">
                <form id="shipping-zip-form" method="post" action="#estimatePost/">
                  <p>Enter your destination to get a shipping estimate.</p>
                  <ul class="form-list">
                    <li>
                      <label class="required" for="country"><em>*</em>Country</label>
                      <div class="input-box">
                        <select title="Country" class="validate-select" id="country" name="country_id">
                          <option value="Select">Select</option>
                          <option value="AF">Afghanistan</option>
                          <option value="AX">Åland Islands</option>
                          <option value="AL">Albania</option>
                          <option value="DZ">Algeria</option>
                          <option value="AS">American Samoa</option>
                          <option value="AD">Andorra</option>
                          <option value="AO">Angola</option>
                          <option value="AI">Anguilla</option>
                          <option value="AQ">Antarctica</option>
                          <option value="AG">Antigua and Barbuda</option>
                          <option value="AR">Argentina</option>
                          <option value="AM">Armenia</option>
                          <option value="AW">Aruba</option>
                          <option value="AU">Australia</option>
                          <option value="AT">Austria</option>
                          <option value="AZ">Azerbaijan</option>
                          <option value="BS">Bahamas</option>
                          <option value="BH">Bahrain</option>
                          <option value="BD">Bangladesh</option>
                          <option value="BB">Barbados</option>
                          <option value="BY">Belarus</option>
                          <option value="BE">Belgium</option>
                          <option value="BZ">Belize</option>
                          <option value="BJ">Benin</option>
                          <option value="BM">Bermuda</option>
                          <option value="BT">Bhutan</option>
                          <option value="BO">Bolivia</option>
                          <option value="BA">Bosnia and Herzegovina</option>
                          <option value="BW">Botswana</option>
                          <option value="BV">Bouvet Island</option>
                          <option value="BR">Brazil</option>
                          <option value="IO">British Indian Ocean Territory</option>
                          <option value="VG">British Virgin Islands</option>
                          <option value="BN">Brunei</option>
                          <option value="BG">Bulgaria</option>
                          <option value="BF">Burkina Faso</option>
                          <option value="BI">Burundi</option>
                          <option value="KH">Cambodia</option>
                          <option value="CM">Cameroon</option>
                          <option value="CA">Canada</option>
                          <option value="CV">Cape Verde</option>
                          <option value="KY">Cayman Islands</option>
                          <option value="CF">Central African Republic</option>
                          <option value="TD">Chad</option>
                          <option value="CL">Chile</option>
                          <option value="CN">China</option>
                          <option value="CX">Christmas Island</option>
                          <option value="CC">Cocos [Keeling] Islands</option>
                          <option value="CO">Colombia</option>
                          <option value="KM">Comoros</option>
                          <option value="CG">Congo - Brazzaville</option>
                          <option value="CD">Congo - Kinshasa</option>
                          <option value="CK">Cook Islands</option>
                          <option value="CR">Costa Rica</option>
                          <option value="CI">Côte d’Ivoire</option>
                          <option value="HR">Croatia</option>
                          <option value="CU">Cuba</option>
                          <option value="CY">Cyprus</option>
                          <option value="CZ">Czech Republic</option>
                          <option value="DK">Denmark</option>
                          <option value="DJ">Djibouti</option>
                          <option value="DM">Dominica</option>
                          <option value="DO">Dominican Republic</option>
                          <option value="EC">Ecuador</option>
                          <option value="EG">Egypt</option>
                          <option value="SV">El Salvador</option>
                          <option value="GQ">Equatorial Guinea</option>
                          <option value="ER">Eritrea</option>
                          <option value="EE">Estonia</option>
                          <option value="ET">Ethiopia</option>
                          <option value="FK">Falkland Islands</option>
                          <option value="FO">Faroe Islands</option>
                          <option value="FJ">Fiji</option>
                          <option value="FI">Finland</option>
                          <option value="FR">France</option>
                          <option value="GF">French Guiana</option>
                          <option value="PF">French Polynesia</option>
                          <option value="TF">French Southern Territories</option>
                          <option value="GA">Gabon</option>
                          <option value="GM">Gambia</option>
                          <option value="GE">Georgia</option>
                          <option value="DE">Germany</option>
                          <option value="GH">Ghana</option>
                          <option value="GI">Gibraltar</option>
                          <option value="GR">Greece</option>
                          <option value="GL">Greenland</option>
                          <option value="GD">Grenada</option>
                          <option value="GP">Guadeloupe</option>
                          <option value="GU">Guam</option>
                          <option value="GT">Guatemala</option>
                          <option value="GG">Guernsey</option>
                          <option value="GN">Guinea</option>
                          <option value="GW">Guinea-Bissau</option>
                          <option value="GY">Guyana</option>
                          <option value="HT">Haiti</option>
                          <option value="HM">Heard Island and McDonald Islands</option>
                          <option value="HN">Honduras</option>
                          <option value="HK">Hong Kong SAR China</option>
                          <option value="HU">Hungary</option>
                          <option value="IS">Iceland</option>
                          <option value="IN">India</option>
                          <option value="ID">Indonesia</option>
                          <option value="IR">Iran</option>
                          <option value="IQ">Iraq</option>
                          <option value="IE">Ireland</option>
                          <option value="IM">Isle of Man</option>
                          <option value="IL">Israel</option>
                          <option value="IT">Italy</option>
                          <option value="JM">Jamaica</option>
                          <option value="JP">Japan</option>
                          <option value="JE">Jersey</option>
                          <option value="JO">Jordan</option>
                          <option value="KZ">Kazakhstan</option>
                          <option value="KE">Kenya</option>
                          <option value="KI">Kiribati</option>
                          <option value="KW">Kuwait</option>
                          <option value="KG">Kyrgyzstan</option>
                          <option value="LA">Laos</option>
                          <option value="LV">Latvia</option>
                          <option value="LB">Lebanon</option>
                          <option value="LS">Lesotho</option>
                          <option value="LR">Liberia</option>
                          <option value="LY">Libya</option>
                          <option value="LI">Liechtenstein</option>
                          <option value="LT">Lithuania</option>
                          <option value="LU">Luxembourg</option>
                          <option value="MO">Macau SAR China</option>
                          <option value="MK">Macedonia</option>
                          <option value="MG">Madagascar</option>
                          <option value="MW">Malawi</option>
                          <option value="MY">Malaysia</option>
                          <option value="MV">Maldives</option>
                          <option value="ML">Mali</option>
                          <option value="MT">Malta</option>
                          <option value="MH">Marshall Islands</option>
                          <option value="MQ">Martinique</option>
                          <option value="MR">Mauritania</option>
                          <option value="MU">Mauritius</option>
                          <option value="YT">Mayotte</option>
                          <option value="MX">Mexico</option>
                          <option value="FM">Micronesia</option>
                          <option value="MD">Moldova</option>
                          <option value="MC">Monaco</option>
                          <option value="MN">Mongolia</option>
                          <option value="ME">Montenegro</option>
                          <option value="MS">Montserrat</option>
                          <option value="MA">Morocco</option>
                          <option value="MZ">Mozambique</option>
                          <option value="MM">Myanmar [Burma]</option>
                          <option value="NA">Namibia</option>
                          <option value="NR">Nauru</option>
                          <option value="NP">Nepal</option>
                          <option value="NL">Netherlands</option>
                          <option value="AN">Netherlands Antilles</option>
                          <option value="NC">New Caledonia</option>
                          <option value="NZ">New Zealand</option>
                          <option value="NI">Nicaragua</option>
                          <option value="NE">Niger</option>
                          <option value="NG">Nigeria</option>
                          <option value="NU">Niue</option>
                          <option value="NF">Norfolk Island</option>
                          <option value="MP">Northern Mariana Islands</option>
                          <option value="KP">North Korea</option>
                          <option value="NO">Norway</option>
                          <option value="OM">Oman</option>
                          <option value="PK">Pakistan</option>
                          <option value="PW">Palau</option>
                          <option value="PS">Palestinian Territories</option>
                          <option value="PA">Panama</option>
                          <option value="PG">Papua New Guinea</option>
                          <option value="PY">Paraguay</option>
                          <option value="PE">Peru</option>
                          <option value="PH">Philippines</option>
                          <option value="PN">Pitcairn Islands</option>
                          <option value="PL">Poland</option>
                          <option value="PT">Portugal</option>
                          <option value="PR">Puerto Rico</option>
                          <option value="QA">Qatar</option>
                          <option value="RE">Réunion</option>
                          <option value="RO">Romania</option>
                          <option value="RU">Russia</option>
                          <option value="RW">Rwanda</option>
                          <option value="BL">Saint Barthélemy</option>
                          <option value="SH">Saint Helena</option>
                          <option value="KN">Saint Kitts and Nevis</option>
                          <option value="LC">Saint Lucia</option>
                          <option value="MF">Saint Martin</option>
                          <option value="PM">Saint Pierre and Miquelon</option>
                          <option value="VC">Saint Vincent and the Grenadines</option>
                          <option value="WS">Samoa</option>
                          <option value="SM">San Marino</option>
                          <option value="ST">São Tomé and Príncipe</option>
                          <option value="SA">Saudi Arabia</option>
                          <option value="SN">Senegal</option>
                          <option value="RS">Serbia</option>
                          <option value="SC">Seychelles</option>
                          <option value="SL">Sierra Leone</option>
                          <option value="SG">Singapore</option>
                          <option value="SK">Slovakia</option>
                          <option value="SI">Slovenia</option>
                          <option value="SB">Solomon Islands</option>
                          <option value="SO">Somalia</option>
                          <option value="ZA">South Africa</option>
                          <option value="GS">South Georgia and the South Sandwich Islands</option>
                          <option value="KR">South Korea</option>
                          <option value="ES">Spain</option>
                          <option value="LK">Sri Lanka</option>
                          <option value="SD">Sudan</option>
                          <option value="SR">Suriname</option>
                          <option value="SJ">Svalbard and Jan Mayen</option>
                          <option value="SZ">Swaziland</option>
                          <option value="SE">Sweden</option>
                          <option value="CH">Switzerland</option>
                          <option value="SY">Syria</option>
                          <option value="TW">Taiwan</option>
                          <option value="TJ">Tajikistan</option>
                          <option value="TZ">Tanzania</option>
                          <option value="TH">Thailand</option>
                          <option value="TL">Timor-Leste</option>
                          <option value="TG">Togo</option>
                          <option value="TK">Tokelau</option>
                          <option value="TO">Tonga</option>
                          <option value="TT">Trinidad and Tobago</option>
                          <option value="TN">Tunisia</option>
                          <option value="TR">Turkey</option>
                          <option value="TM">Turkmenistan</option>
                          <option value="TC">Turks and Caicos Islands</option>
                          <option value="TV">Tuvalu</option>
                          <option value="UG">Uganda</option>
                          <option value="UA">Ukraine</option>
                          <option value="AE">United Arab Emirates</option>
                          <option value="GB">United Kingdom</option>
                          <option selected="selected" value="US">United States</option>
                          <option value="UY">Uruguay</option>
                          <option value="UM">U.S. Minor Outlying Islands</option>
                          <option value="VI">U.S. Virgin Islands</option>
                          <option value="UZ">Uzbekistan</option>
                          <option value="VU">Vanuatu</option>
                          <option value="VA">Vatican City</option>
                          <option value="VE">Venezuela</option>
                          <option value="VN">Vietnam</option>
                          <option value="WF">Wallis and Futuna</option>
                          <option value="EH">Western Sahara</option>
                          <option value="YE">Yemen</option>
                          <option value="ZM">Zambia</option>
                          <option value="ZW">Zimbabwe</option>
                        </select>
                      </div>
                    </li>
                    <li>
                      <label for="region_id">State/Province</label>
                      <div class="input-box">
                        <select style="" title="State/Province" name="region_id" id="region_id"  class="required-entry validate-select">
                          <option value="">Please select region, state or province</option>
                          <option value="1" title="Alabama">Alabama</option>
                          <option value="2" title="Alaska">Alaska</option>
                          <option value="3" title="American Samoa">American Samoa</option>
                          <option value="4" title="Arizona">Arizona</option>
                          <option value="5" title="Arkansas">Arkansas</option>
                          <option value="6" title="Armed Forces Africa">Armed Forces Africa</option>
                          <option value="7" title="Armed Forces Americas">Armed Forces Americas</option>
                          <option value="8" title="Armed Forces Canada">Armed Forces Canada</option>
                          <option value="9" title="Armed Forces Europe">Armed Forces Europe</option>
                          <option value="10" title="Armed Forces Middle East">Armed Forces Middle East</option>
                          <option value="11" title="Armed Forces Pacific">Armed Forces Pacific</option>
                          <option value="12" title="California">California</option>
                          <option value="13" title="Colorado">Colorado</option>
                          <option value="14" title="Connecticut">Connecticut</option>
                          <option value="15" title="Delaware">Delaware</option>
                          <option value="16" title="District of Columbia">District of Columbia</option>
                          <option value="17" title="Federated States Of Micronesia">Federated States Of Micronesia</option>
                          <option value="18" title="Florida">Florida</option>
                          <option value="19" title="Georgia">Georgia</option>
                          <option value="20" title="Guam">Guam</option>
                          <option value="21" title="Hawaii">Hawaii</option>
                          <option value="22" title="Idaho">Idaho</option>
                          <option value="23" title="Illinois">Illinois</option>
                          <option value="24" title="Indiana">Indiana</option>
                          <option value="25" title="Iowa">Iowa</option>
                          <option value="26" title="Kansas">Kansas</option>
                          <option value="27" title="Kentucky">Kentucky</option>
                          <option value="28" title="Louisiana">Louisiana</option>
                          <option value="29" title="Maine">Maine</option>
                          <option value="30" title="Marshall Islands">Marshall Islands</option>
                          <option value="31" title="Maryland">Maryland</option>
                          <option value="32" title="Massachusetts">Massachusetts</option>
                          <option value="33" title="Michigan">Michigan</option>
                          <option value="34" title="Minnesota">Minnesota</option>
                          <option value="35" title="Mississippi">Mississippi</option>
                          <option value="36" title="Missouri">Missouri</option>
                          <option value="37" title="Montana">Montana</option>
                          <option value="38" title="Nebraska">Nebraska</option>
                          <option value="39" title="Nevada">Nevada</option>
                          <option value="40" title="New Hampshire">New Hampshire</option>
                          <option value="41" title="New Jersey">New Jersey</option>
                          <option value="42" title="New Mexico">New Mexico</option>
                          <option value="43" title="New York">New York</option>
                          <option value="44" title="North Carolina">North Carolina</option>
                          <option value="45" title="North Dakota">North Dakota</option>
                          <option value="46" title="Northern Mariana Islands">Northern Mariana Islands</option>
                          <option value="47" title="Ohio">Ohio</option>
                          <option value="48" title="Oklahoma">Oklahoma</option>
                          <option value="49" title="Oregon">Oregon</option>
                          <option value="50" title="Palau">Palau</option>
                          <option value="51" title="Pennsylvania">Pennsylvania</option>
                          <option value="52" title="Puerto Rico">Puerto Rico</option>
                          <option value="53" title="Rhode Island">Rhode Island</option>
                          <option value="54" title="South Carolina">South Carolina</option>
                          <option value="55" title="South Dakota">South Dakota</option>
                          <option value="56" title="Tennessee">Tennessee</option>
                          <option value="57" title="Texas">Texas</option>
                          <option value="58" title="Utah">Utah</option>
                          <option value="59" title="Vermont">Vermont</option>
                          <option value="60" title="Virgin Islands">Virgin Islands</option>
                          <option value="61" title="Virginia">Virginia</option>
                          <option value="62" title="Washington">Washington</option>
                          <option value="63" title="West Virginia">West Virginia</option>
                          <option value="64" title="Wisconsin">Wisconsin</option>
                          <option value="65" title="Wyoming">Wyoming</option>
                        </select>
                        <input type="text" style="display:none;" class="input-text required-entry" title="State/Province" value="" name="region" id="region">
                      </div>
                    </li>
                    <li>
                      <label for="postcode">Zip/Postal Code</label>
                      <div class="input-box">
                        <input type="text" value="" name="estimate_postcode" id="postcode" class="input-text validate-postcode">
                      </div>
                    </li>
                  </ul>
                  <div class="buttons-set11">
                    <button class="button get-quote" onClick="coShippingMethodForm.submit()" title="Get a Quote" type="button"><span>Get a Quote</span></button>
                  </div>
                  <!--buttons-set11-->
                </form>
              </div>
            </div>
          </div>
          <div class="col-sm-4">
            
            <div class="discount">
            <h3>Discount Codes</h3>
            <form method="post" action="#couponPost/"  >
              <label for="coupon_code">Enter your coupon code if you have one.</label>
              <input type="hidden" value="0" id="remove-coupone" name="remove">
              <input type="text" value="" name="coupon_code" id="coupon_code" class="input-text fullwidth">
              <button value="Apply Coupon" onClick="discountForm.submit(false)" class="button coupon " title="Apply Coupon" type="button"><span>Apply Coupon</span></button>
          </form>
          </div>
         
          </div>
          <div class="totals col-sm-4">
            <h3>Shopping Cart Total</h3>
            <div class="inner">
              <table class="table shopping-cart-table-total" id="shopping-cart-totals-table">
               
                <tfoot>
                  <tr>
                    <td colspan="1" class="a-left" style=""><strong>Grand Total</strong></td>
                    <td class="a-right" style=""><strong><span class="price">$77.38</span></strong></td>
                  </tr>
                </tfoot>
                <tbody>
                  <tr>
                    <td colspan="1" class="a-left" style=""> Subtotal </td>
                    <td class="a-right" style=""><span class="price">$77.38</span></td>
                  </tr>
                </tbody>
              </table>
              <ul class="checkout">
                <li>
                  <button onClick="" class="button btn-proceed-checkout" title="Proceed to Checkout" type="button"><span>Proceed to Checkout</span></button>
                </li>
                <li>
                 <br>
                </li> 
                <li><a title="Checkout with Multiple Addresses" href="#">Checkout with Multiple Addresses</a> </li>
                <li>
                 <br>
                </li>
              </ul>
            </div>
            <!--inner--> 
            
          </div>
        </div>

       
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