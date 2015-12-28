/**
 * 
 */

$(document).ready(function(){
	onload();
	
});


function onload()
{
	getOrderByType("getCustomizationsByArtistAction", "0");
}

//action 请求 
//type 这里没有订单类型，因为不同种类订单的action不同
//state 订单状态
function getOrderByType(action, state)
{
	$.ajax({
		type:"post",
		url:"",
		data:{"purchaseOrder.state": state},
		dataType:"json",
		success:function(data)
		{
			
		}
	});
}
