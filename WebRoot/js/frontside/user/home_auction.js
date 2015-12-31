/**
 * 拍卖列表ajax显示
 * @author asus1
 */

$(document).ready(function(){
	onload(1,'calligraphy');
});

function onload(nowpage,country)
{
	$.ajax({
		type:"post",
		url:"showTodayAuctionAction",
		data:null,
		dataType:"json",
		success:function(data){
			alert("a");
			var server_path = "http://localhost:8080/ArtworkWeb";
			var pages = "";
			var	auctions = "";
			
			var pagesize=9;
			var totalcount=data.length;
			var totalpage=Math.ceil(totalcount/pagesize);
			
			var $pageList = $("#page_list");
			$pageList.empty();
			if(nowpage!=1){
				pages+="<li><a href=\"javascript:onload(1,\'"+country+"\');\">&lt;&lt;</a></li>";
				pages+="<li><a href=\"javascript:onload(" +(nowpage-1)+",\'"+country+
				"\');\">&lt;</a></li>";
			}
			for(var i=nowpage-2;i<=nowpage+2;i++){
				if(i==nowpage){
					pages+="<li class=\"active\"><a href=\"javascript:onload(" +i+",\'"+country+
						"\');\">"+i+"</a></li>";
					}
				else{
					if(i>0&&i<=totalpage){
						pages+="<li><a href=\"javascript:onload(" +i+",\'"+country+
						"\');\">"+i+"</a></li>";
					}
				}
			}
			if(nowpage!=totalpage){
				pages+="<li><a href=\"javascript:onload(" +(nowpage+1)+",\'"+country+
				"\');\">&gt;</a></li>";
				pages+="<li><a href=\"javascript:onload(" +totalpage+",\'"+country+
				"\');\">&gt;&gt;</a></li>"
			}
			$pageList.append(pages);
			
			var $auctionList = $("#auction_list");
			$auctionList.empty();
			var start=pagesize*(nowpage-1);
			for(var i=start;i<=start+pagesize-1&&i<=totalcount-1;i++){
				var item=data[i];
				/*auctions +="<li class='item col-lg-4 col-md-3 col-sm-4 col-xs-12'>" +
                  				"<div class='item-inner'>"+
                  				"<div class='product-block'>" +
                  				"<div class='product-image'> <a href='showAuctionDetailAction?auction.id=" + item.id + "'>" +
                  				"<figure class='product-display'>" +
                            "<div class='sale-label sale-top-left'>Sale</div>";
				if(item.commodity.commodityPices.length > 0)
				{
                    auctions += "<img src='" + server_path + item.commodity.commodityPices[0].url +"' class='lazyOwl product-mainpic' alt='Sample Product' style='display: block;'> <img class='product-secondpic' alt=' Sample Product' src='" + server_path + item.commodity.commodityPices[0].url + "'> </figure>" ;
				}
				auctions +=" </a> </div>" +
                        "<div class='product-meta'>"+
                          "<div class='product-action'> <a class='addcart' href='shopping_cart.html'> <i class='icon-shopping-cart'>&nbsp;</i> Add to cart </a>" +                 
                            "<a class='wishlist' href='wishlist.html'> <i class='icon-heart'>&nbsp;</i> </a>"      +                     
                            "<a class='quickview' href='javascript:;'> <i class='icon-zoom'>&nbsp;</i> </a> </div>"+
                        "</div>"+
                      "</div>" +
                    "<div class='item-info'>" +
                      "<div class='info-inner'>" +
                        "<div class='item-title'> <a href='showAuctionDetailAction?auction.id=" + item.id + "' title='Retis lapen casen'>"+ item.commodity.name +"</a> </div>" +
                        "<div class='item-content'>" +                    
                          "<div class='item-price'>" +
                            "<div class='price-box'> <span class='regular-price' > <span class='price'>" + item.currentPrice + "</span> </span> </div>" +
                          "</div>"+
						  "<div class='rating'>"+
                          "</div>" +
                        "</div>" +
                      "</div>" +
                    "</div>" +
                  "</div>" +
                "</li>"; 	*/
				auctions += "<p>" + item.id + "</p>";
			
			};
			$auctionList.append(auctions);
		}
		
	});
}
