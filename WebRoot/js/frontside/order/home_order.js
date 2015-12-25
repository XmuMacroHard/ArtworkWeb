/**
 * 
 */

$(document).ready(function(){
	onload();
});

function onload()
{
	$.ajax({
		type:'post',
		url:'getBriefArtistBySort',
		data:{'artist.identification':'calligraphy'},
		dataType:'json',
		success:function(data){
			var server_path = 'http://localhost:8080/ArtworkWeb';
			var	artist = '';
			var $artists = $('#products-list');
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
