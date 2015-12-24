
$(document).ready(function(){
	$("#viewCart").bind("click", locateToCart);
});

function locateToCart()
{
	window.location.href = "viewCart";
}