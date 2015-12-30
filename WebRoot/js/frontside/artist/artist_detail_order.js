/**
 * 
 */

function acceptOrder()
{
	window.location.href="setCustomizationPaymentAction";
}

function rejectOrder()
{
	var id=document.getElementsByName("purchaseOrder.id")[0].value;
	window.location.href="rejectCustomizationAction?purchaseOrder.id="+id;
}

function installment(times)
{
	var list = "";
	var $installmentTable = $("#installment");
	
	for(var i = 0; i < times; i++)
	{
		list += "<tr class='first odd'>" +
        "<td class='a-right'><input name='moneys' class='form-control' placeholder='金额'></input></td>" +
        "<td class='a-right'><input name='dates' class='form-control' type='date'/>" +
        "</td>" +
      "</tr>";
	}
	
	$installmentTable.empty();
	$installmentTable.append(list);
}

function checkacceptorder(){
	var count = document.getElementsByName("moneys");
	var dates = document.getElementsByName("dates");
	var totalprice=0;
	var reg = new RegExp("^(0|[1-9][0-9]{0,9})(\.[0-9]{1,2})?$");
	for(var i=0;i<count.length;i++){
		if(!reg.test(count[i].value))
		{
			document.getElementById("acceptTip").innerHTML = "第"+(i+1)+"次付款价格格式错误!";
			return false;
		}
		if(dates[i].value==""||dates[i].value==null){
			document.getElementById("acceptTip").innerHTML = "第"+(i+1)+"次付款时间不能为空!";
			return false;
		}
		totalprice=parseFloat(totalprice)+parseFloat(count[i].value);
	}
	
	var price=document.getElementsByName("totalprice")[0].value;
	if(parseFloat(price)!=parseFloat(totalprice)){
		document.getElementById("acceptTip").innerHTML = "分期付款总金额错误";
		return false;
	}
	
	if(count.length>1){
		if(dates[0].value>=dates[1].value){
			document.getElementById("acceptTip").innerHTML = "分期付款时间应从小到大";
			return false;
		}
	}
	if(count.length>2){
		if(dates[1].value>=dates[2].value){
			document.getElementById("acceptTip").innerHTML = "分期付款时间应从小到大";
			return false;
		}
	}
	
	document.getElementById("acceptTip").innerHTML = "";
	return true;
}