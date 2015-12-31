/**
 * 
 */

function pay()
{
	var id = $("#purchaseOrderId").val();
	var count = document.getElementsByName("usercount")[0].value;
	var totalprice = document.getElementsByName("price")[0].value;
	if(parseFloat(count)<parseFloat(totalprice)){
		alert("请先充值");
		window.location.href="/ArtworkWeb/jsp/frontside/pay/recharge.jsp";
	}else{
		alert("付款成功");
		window.location.href = "payPurchaseOrderAction?purchaseOrder.id=" + id;
	}
}

function confirmCommodity()
{
	var id = $("#purchaseOrderId").val();
	window.location.href = "confirmCommodity?purchaseOrder.id=" + id;	
}