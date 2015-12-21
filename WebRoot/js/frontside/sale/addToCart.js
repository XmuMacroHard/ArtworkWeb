/**
 * 
 */

$(document).ready(function(){
	$("#addToCart").bind("click", addToCart);
});

function addToCart()
{
	var userid = $("#hidden_user_id").text();
	var commodityid = $("#hidden_commodity_id").text();
	
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
				alert(data.message);
			}
			else
			{
				alert(data.message);
			}
		}
			
	});
	
}