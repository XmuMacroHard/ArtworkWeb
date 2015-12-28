/**
 * 
 */

$(document).ready(function(){
	$("#address").children().each(function(){
		$(this).click(chooseAddress);
	});
	
	$("#payButton").bind("click", pay);
	
});

function chooseAddress()
{
	$("#address").children().css("background"," #D4DEDF");
	$(this).css("background","rgb(199,242,231)");
	
	var addressid = $(this).attr("id");
	$("#addressid").val(addressid);
}

function pay()
{
	var purchaseOrderId = $("#purchaseOrderId").val();
	window.location.href = "SubmitsaleOrder?purchaseOrder.id=" + purchaseOrderId;
}
