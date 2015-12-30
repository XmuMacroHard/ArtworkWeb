/**
 * 
 */

function checkadname(){
	var name=document.getElementsByName("information.title")[0].value;
	var tip=document.getElementById("adnameTip");
	if(name==""||name==null){
		tip.innerHTML="标题不能为空";
		return false;
	}else{
		tip.innerHTML="";
		return true;
	}
}

function checkadtime(){
	var begin=document.getElementsByName("information.startTime")[0].value;
	var end=document.getElementsByName("information.endTime")[0].value;
	var begintip=document.getElementById("adbegintimeTip");
	var endtip=document.getElementById("adendtimeTip");
	if(begin==""||begin==null){
		begintip.innerHTML="开始时间不能为空";
		return false;
	}else{
		begintip.innerHTML="";
		if(end==""||end==null){
			endtip.innerHTML="结束时间不能为空";
			return false;
		}else{
			endtip.innerHTML="";
			if(begin>end){
				begintip.innerHTML="开始时间应该比结束时间晚";
				return false;
			}else{
				begintip.innerHTML="";
				return true;
			}
		}
	}
}

function checkadprice(){
	var price=document.getElementsByName("information.expense")[0].value;
	var reg = new RegExp("^(0|[1-9][0-9]{0,9})(\.[0-9]{1,2})?$");
	if(!reg.test(price))
	{
		document.getElementById("adpriceTip").innerHTML = "价格格式错误!";
		return false;
	}
	else
	{
		document.getElementById("adpriceTip").innerHTML = "";
		return true;
	}
}

function checkadcontent(){
	var name=document.getElementsByName("information.content")[0].value;
	var tip=document.getElementById("adcontentTip");
	if(name==""||name==null){
		tip.innerHTML="咨询内容不能为空";
		return false;
	}else{
		tip.innerHTML="";
		return true;
	}
}

function checkadsubmit(){
	if(checkadname()){
		if(!document.getElementsByName("pic")[0].value){
			document.getElementById("adpicTip").innerHTML = "广告图片不能为空!";
		}else{
			document.getElementById("adpicTip").innerHTML = "";
			if(checkadtime()){
				if(checkadprice()){
					alert("上传成功");
					return true;
				}
			}
		}
	}
	return false;
}

function checkinfosubmit(){
	if(checkadname()){
		if(!document.getElementsByName("pic")[0].value){
			document.getElementById("adpicTip").innerHTML = "咨询图片不能为空!";
		}else{
			document.getElementById("adpicTip").innerHTML = "";
			if(checkadtime()){
				if(checkadprice()){
					if(checkadcontent()){
						alert("上传成功");
						return true;
					}
				}
			}
		}
	}
	return false;
}