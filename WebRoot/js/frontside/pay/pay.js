/**
 * 
 */

$(document).ready(function(){
	$("#address").children().each(function(){
		$(this).click(chooseAddress);
	});
	
	//$("#payButton").bind("click", pay);
	
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
	window.location.href = "payPurchaseOrderAction?purchaseOrder.id=" + purchaseOrderId;
}

function checkcomfirmorder(){
	var addressid = document.getElementsByName("shippingAddress.id")[0].value;
	if(addressid==null||addressid==""){
		document.getElementById("addressTip").innerHTML="请选择收货地址";
		return false;
	}else{
		document.getElementById("addressTip").innerHTML="";
		return true;
	}
}

function checkispay(){
	var count = document.getElementsByName("usercount")[0].value;
	var totalprice = document.getElementsByName("totalprice")[0].value;
	if(count<totalprice){
		alert("请先充值");
		window.location.href="/ArtworkWeb/jsp/frontside/pay/recharge.jsp";
		return false;
	}
	else{
		return true;
	}
}

function checkrecharge(){
	var count = document.getElementsByName("user.balance")[0].value;
	var reg = new RegExp("^(0|[1-9][0-9]{0,9})(\.[0-9]{1,2})?$");
	if(!reg.test(count))
	{
		var temp=document.getElementById("RechargeTip");
		temp.innerHTML = "充值金额格式错误!";
		return false;
	}
	else
	{
		var temp=document.getElementById("RechargeTip");
		temp.innerHTML = "";
		return true;
	}
}