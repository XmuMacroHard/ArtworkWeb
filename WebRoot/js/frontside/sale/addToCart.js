/**
 * 
 */

$(document).ready(function(){
	$("#addToCart").bind("click", addToCart);
});

function addToCart()
{
	var userid = $("#hidden_user_id");
	var commodityid = $("#hidden_commodity_id");
	
	$.ajax({
		type:"post",
		url:"addToCart",
		data:{"user.id": userid,
			"commodity.id": commodityid,
		},
		dataType:"json",
		success:function(data){
			if(data.result == "success")
			{
				alert("添加到购物车");
			}
		}
			
	});
}