/**
 * 
 */

function returnlist(){
	window.location.href="/ArtworkWeb/showMyCommodity";
}

function checkcommodityname(){
	var name=document.getElementsByName('commodity.name')[0].value;
	if(name==""||name==null){
		document.getElementById('commoditynameTip').innerHTML="商品名不能为空";
		return false;
	}else{
		document.getElementById('commoditynameTip').innerHTML="";
		return true;
	}
}

function checkcommodityprice(){
	var count = document.getElementsByName("commodity.price")[0].value;
	var reg = new RegExp("^(0|[1-9][0-9]{0,9})(\.[0-9]{1,2})?$");
	if(!reg.test(count))
	{
		var temp=document.getElementById("commoditypriceTip").innerHTML = "价格格式错误!";
		return false;
	}
	else
	{
		var temp=document.getElementById("commoditypriceTip").innerHTML = "";
		return true;
	}
}

function checkcommodityintroduction(){
	var name=document.getElementsByName('commodity.introductio')[0].value;
	if(name==""||name==null){
		document.getElementById('commodityintroductioTip').innerHTML="商品介绍不能为空";
		return false;
	}else{
		document.getElementById('commodityintroductioTip').innerHTML="";
		return true;
	}
}

function changecommodity(){
	document.getElementById("modifyButton").value="保存";
	document.getElementsByName("commodity.name")[0].removeAttribute("readonly");
	document.getElementsByName("commodity.price")[0].removeAttribute("readonly");
	document.getElementsByName("commodity.introduction")[0].removeAttribute("readonly");
	document.getElementById('modifyButton').onclick=function(){
		savecommodity();
	};
}

function savecommodity(){
	
	if(checkcommodityname()&&checkcommodityprice()&&checkcommodityintroduction()){
		var id=document.getElementsByName('commodity.id')[0].value;
		var name=document.getElementsByName('commodity.name')[0].value;
		var count = document.getElementsByName("commodity.price")[0].value;
		var type = document.getElementsByName("commodity.type")[0].value;
		var introduction=document.getElementsByName('commodity.introduction')[0].value;
		$.ajax({
			type:"post",
			url:"altercommodityAction",
			data:{
				"commodity.id":id,
				"commodity.name":name,
				"commodity.price":count,
				"commodity.type":type,
				"commodity.introduction":introduction
			},
			dataType:"json",
			success:function(data)
			{
				var d = eval("("+ data + ")");
				if(d.result == "success")
				{
					alert(d.message);
				}
			}			
		});
		
		document.getElementById("modifyButton").value="修改";
		document.getElementsByName("commodity.name")[0].setAttribute("readonly",'true');
		document.getElementsByName("commodity.price")[0].setAttribute("readonly",'true');
		document.getElementsByName("commodity.introduction")[0].setAttribute("readonly",'true');
		document.getElementById('modifyButton').onclick=function(){
			changecommodity();
		};
	}
}