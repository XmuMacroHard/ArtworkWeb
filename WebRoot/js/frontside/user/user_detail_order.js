/**
 * 
 */

function pay()
{
	var id = $("#purchaseOrderId").val();
	window.location.href = "payPurchaseOrderAction?purchaseOrder.id=" + id;
}

function confirmCommodity()
{
	var id = $("#purchaseOrderId").val();
	window.location.href = "confirmCommodity?purchaseOrder.id=" + id;	
}