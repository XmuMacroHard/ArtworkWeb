/**
 * 
 */

$(document).ready(function(){
	onload(1,'calligraphy');
});

function onload(nowpage,type)
{
	$.ajax({
		type:'post',
		url:'getBriefArtistBySort',
		data:{'artist.identification':type},
		dataType:'json',
		success:function(data){
			var server_path = 'http://localhost:8080/ArtworkWeb';
			var	artist = '';
			var pages='';
			var $artists = $('#products-list');
			var $pageList = $('#page-list');
			
			$pageList.empty();
			var pagesize=5;
			var totalcount=data.length;
			var totalpage=Math.ceil(totalcount/pagesize);
			$pageList.empty();
			if(nowpage!=1){
				pages+="<li><a href=\"javascript:onload(1,\'"+type+"\');\">&lt;&lt;</a></li>";
				pages+="<li><a href=\"javascript:onload(" +(nowpage-1)+",\'"+type+"\'"+
				");\">&lt;</a></li>";
			}
			for(var i=nowpage-2;i<=nowpage+2;i++){
				if(i==nowpage){
					pages+="<li class=\"active\"><a href=\"javascript:onload(" +i+",\'"+type+"\'"+
						");\">"+i+"</a></li>";
					}
				else{
					if(i>0&&i<=totalpage){
						pages+="<li><a href=\"javascript:onload(" +i+",\'"+type+"\'"+
						");\">"+i+"</a></li>";
					}
				}
			}
			if(nowpage!=totalpage){
				pages+="<li><a href=\"javascript:onload(" +(nowpage+1)+",\'"+type+"\'"+
				");\">&gt;</a></li>";
				pages+="<li><a href=\"javascript:onload(" +totalpage+",\'"+type+"\'"+
				");\">&gt;&gt;</a></li>"
			}
			$pageList.append(pages);
			
			$artists.empty();
			$.each(data, function(index, item){
				artist += "<li class='item odd'>" +
                "<div class='product-image'> <a href='findArtist?user.id=" + item.id +"' title='HTC Rhyme Sense'> <img class='small-image' src='" + server_path +item.portrait + "' alt='product-image' width='230'> </a> </div>" +
                "<div class='product-shop'>" +
                 " <h2 class='product-name'><a title=' Sample Product' href='findArtist?user.id=" + item.id  +"'>" + item.name + "</a></h2>" +
                  "<div class='ratings'>" +
                    "<div class='rating-box'>" +
                      "<div style='width:50%' class='rating'></div>" +
                    "</div>" +
                    "<p class='rating-links'> <a href='#'>1 Review(s)</a> <span class='separator'>|</span> <a href='#review-form'>Add Your Review</a> </p>" +
                  "</div>" +
                  "<div class='desc std'>" +
                    "<p>" + item.introduction + "</p>" +
                    "<a class='link-learn' title='' href='#'>Learn More</a> </p>" +
                  "</div> " +
                  "<div class='actions'> " +
                    "<button class='button btn-cart ajx-cart' title='Add to Cart' type='button' onclick='{location.href='findArtist?userid=" + item.id + "'}'><span>了解详情</span></button>" +
                    "<span class='add-to-links'> <a title='Add to Wishlist' class='button link-wishlist' href='wishlist.html'><span>Add to Wishlist</span></a> <a title='Add to Compare' class='button link-compare' href='#'><span>Add to Compare</span></a> </span> </div>" +
                "</div>" +
              "</li>";
					
			});
										
			$artists.append(artist);
		}
		
	});
}
