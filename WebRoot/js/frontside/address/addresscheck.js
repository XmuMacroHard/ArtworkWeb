/**
 * 
 */

function checkaddressdetaile(){
	var name = document.getElementsByName('address.detailedAdress')[0].value;
	if(!name||name=="")
	{
		var temp=document.getElementById("addressdetaileTip");
		temp.innerHTML = "街道不能为空!";
		return false;
	}
	else
	{
		var temp=document.getElementById("addressdetaileTip");
		temp.innerHTML = "";
		return true;
	}
}

function checkaddressconsignee(){
	var name = document.getElementsByName('address.consignee')[0].value;
	if(!name||name=="")
	{
		var temp=document.getElementById("addressconsigneeTip");
		temp.innerHTML = "收货人不能为空!";
		return false;
	}
	else
	{
		var temp=document.getElementById("addressconsigneeTip");
		temp.innerHTML = "";
		return true;
	}
}

function checkaddressphone()
{
	var phone=document.getElementsByName("address.phone")[0].value;
	if(phone!=null&&phone!=""){
		var reg = new RegExp("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$");
		if(!reg.test(phone))
		{
			document.getElementById("addressphoneTip").innerHTML = "手机号必须符合标准!";
			return false;
		}
	}
	else{
		document.getElementById("addressphoneTip").innerHTML = "手机号不能为空!";
		return false;
	}
	document.getElementById("addressphoneTip").innerHTML = "";
	return true;
}

function checkaddresssubmit(){
	var province=document.getElementsByName("address.province")[0].value;
	var city=document.getElementsByName("address.city")[0].value;
	var region=document.getElementsByName("address.region")[0].value;
	
	if(province!="省份"&&city!="地级市"&&region!="市、县级市"){
		document.getElementById("addressprovinceTip").innerHTML = "";
	
		if(checkaddressdetaile()){
			if(checkaddressconsignee()){
				if(checkaddressphone()){
					return true;
				}
			}
		}
	}else{
		document.getElementById("addressprovinceTip").innerHTML = "<br>地址不能为空!";
	}
	return false;
}