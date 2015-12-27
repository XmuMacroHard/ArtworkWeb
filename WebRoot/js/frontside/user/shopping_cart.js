$(document).ready(function(){
	$("input[name='commodityid']").each(function() {
		$(this).bind("click", count);
	});

	$("#place_order_button").bind("click", placeOrder);

	$("empty_cart_button").bind("click", placeOrder);
});

function count()
{
	var totalprice = 0;
	var totalnum = 0;
	var checkbox = $("input[name='commodityid']");
	
	$.each(checkbox,function(index, item){
		
		if($(this).is(':checked'))
		{
//			alert($(this).attr('value'));
//			alert($(this).val());
			var id = "#" + $(this).attr('value');
			var price = parseFloat($(id).text());
			totalprice += price;
			totalnum++;
		}
	});
	
	$("#total_price").html(totalprice);
	$("#total_num").html(totalnum);
}

function placeOrder()
{
	window.location.href = "placeOrder";
	//window.location.href = "jsp/success.jsp";
}
