/**
 * 
 */

$(document).ready(function(){
	onload();
});

function onload()
{
	$.ajax({
		type:"post",
		url:"showCommodityList",
		data:{"commodity.type":"calligraphy"},
		dataType:"json",
		success:function(data){
			var server_path = "http://localhost:8080/ArtworkWeb";
			var	commodities = "";
			var $commodityList = $("#commodity_list");
			$.each(data, function(index, item){
				commodities +="<li class='item col-lg-4 col-md-3 col-sm-4 col-xs-12'>" +
                  				"<div class='item-inner'>"+
                  				"<div class='product-block'>" +
                  				"<div class='product-image'> <a href='product_detail.html'>" +
                  				"<figure class='product-display'>" +
                            "<div class='sale-label sale-top-left'>Sale</div>";
				if(item.commodityPices.length > 0)
				{
                    commodities += "<img src='" + server_path + item.commodityPices[0].url +"' class='lazyOwl product-mainpic' alt='Sample Product' style='display: block;'> <img class='product-secondpic' alt=' Sample Product' src='" + server_path + item.commodityPices[0].url + "'> </figure>" ;
				}
				
				commodities +=" </a> </div>" +
                        "<div class='product-meta'>"+
                          "<div class='product-action'> <a class='addcart' href='shopping_cart.html'> <i class='icon-shopping-cart'>&nbsp;</i> Add to cart </a>" +                 
                            "<a class='wishlist' href='wishlist.html'> <i class='icon-heart'>&nbsp;</i> </a>"      +                     
                            "<a class='quickview' href='javascript:;'> <i class='icon-zoom'>&nbsp;</i> </a> </div>"+
                        "</div>"+
                      "</div>" +
                    "<div class='item-info'>" +
                      "<div class='info-inner'>" +
                        "<div class='item-title'> <a href='getDetailedCommodity?commodity.id="+ item.id +"' title='Retis lapen casen'>"+ item.name +"</a> </div>" +
                        "<div class='item-content'>" +                    
                          "<div class='item-price'>" +
                            "<div class='price-box'> <span class='regular-price' > <span class='price'>" + item.price + "</span> </span> </div>" +
                          "</div>"+
						  "<div class='rating'>"+
                            "<div class='ratings'>"+
                              "<div class='rating-box'>"+
                                "<div class='rating' style='width:80%'></div>"+
                              "</div>"+
                              "<p class='rating-links'> <a href='#'>1 Review(s)</a> <span class='separator'>|</span> <a href='#'>Add Review</a> </p>" +
                            "</div>" +
                          "</div>" +
                        "</div>" +
                      "</div>" +
                    "</div>" +
                  "</div>" +
                "</li>"; 								
			
			});
			$commodityList.append(commodities);
		}
		
	});
}
