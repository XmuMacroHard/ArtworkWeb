$(document).ready(function(){
	$("input[name='commodityid']").each(function() {
		$(this).bind("click", count);
	});

	
	$("#chooseallcard").bind("click", chooseall);
	
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
		}else{
			document.getElementById("chooseallcard").checked=false;
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

function chooseall(){
	var choose = document.getElementById("chooseallcard");
	var card = document.getElementsByName("commodityid");
	var cardcount = card.length;
	if(choose.checked){
		for(var i=0;i<cardcount;i++){
			card[i].checked=true;
		}
	}else{
		for(var i=0;i<cardcount;i++){
			card[i].checked=false;
		}
	}
	count();
}

function checkplaceOrder(){
	var card = document.getElementsByName("commodityid");
	var cardcount = card.length;
	for(var i=0;i<cardcount;i++){
		if(card[i].checked){
			return true;
		}
	}
	alert("请选择商品!");
	return false;
}