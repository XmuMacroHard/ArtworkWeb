/**
 * 
 */

$(document).ready(function(){
	onload();
});


function onload()
{
	getOrderByType("getUserPurchaseOrderByState", "0");
}

//获得待处理的商品订单
//action 请求 
//type 这里没有订单类型，因为不同种类订单的action不同
//state 订单状态
function getOrderByType(action, state)
{
	if(state == "0")
	{
		$("#orderTypeTitle").text("待付款");
	}
	else if(state == "1")
	{
		$("#orderTypeTitle").text("待发货");
	}
	else if(state == "2")
	{
		$("#orderTypeTitle").text("待收获");
	}
	else if(state == "3")
	{
		$("#orderTypeTitle").text("已完成");
	}
	else if(state == "4")
	{
		$("#orderTypeTitle").text("待接受");
	}

	
	$.ajax({
		type:"post",
		url:action,
		data:{"purchaseOrder.state": state},
		dataType:"json",
		success:function(data)
		{		
			var list = "";
			var $orderList = $("#orderList"); 
			$orderList.empty();
			
			$.each(data, function(index, item)
			{
				list += "<div id='address' class='row'>" +    
				"<div id=''  class='col-md-1  orderwrap'>" +
        		"<div>订单号:" + item.orderid + "</div><hr/>" +
        			"<div>" +
        				"<button onclick='detail("+ item.id +")' class='button btn-empty' title='Clear Cart' value='empty_cart' name='update_cart_action' type='submit'><span><span>详情</span></span></button>" +
        				"<button id='empty_cart_button' class='button btn-empty' title='Clear Cart' value='empty_cart' name='update_cart_action' type='submit'><span><span>取消订单</span></span></button>" +        				
        			"</div>" +
        		"</div>" +    
        		"</div> ";
			});
			
			$orderList.append(list);
			
		}
	});
}

function detail(id)
{
	window.location.href="getDetailPuchaseOrderToUser?purchaseOrder.id=" + id;
}

