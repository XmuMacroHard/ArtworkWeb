/**
 * 
 */
$(document).ready(function(){
	$("#alterButton").bind("click",Checkalterpassword);
});

function choose()
{
	var button=document.getElementById("user_choose");
	if(button.value == '修改密码'){
		button.value = '个人信息';
	}else{
		button.value = '修改密码';
	}
	if(showdiv_display = document.getElementById('user_information').style.display=='none'){
		document.getElementById('user_information').style.display='block';
		document.getElementById('changepassword').style.display='none';
	}else{
		document.getElementById('user_information').style.display='none';
		document.getElementById('changepassword').style.display='block';
	}
}

function Checkpass(){
	var pass=document.getElementsByName('user.password')[0].value;
	if(pass==""||pass==null){
		document.getElementById('passwordTip').innerHTML="原密码不能为空";
	}else{
		document.getElementById('passwordTip').innerHTML="";
	}
}

function Checknewpass(){
	var pass=document.getElementsByName('newpassword')[0].value;
	if(pass==""){
		document.getElementById('newpasswordTip').innerHTML="新密码不能为空";
	}else{
		document.getElementById('newpasswordTip').innerHTML="";
	}
}

function Checkcomfirmpass(){
	var pass=document.getElementsByName('comfirmpassword')[0].value;
	var pass2=document.getElementsByName('newpassword')[0].value;
	if(pass != pass2){
		document.getElementById('comfirmpasswordTip').innerHTML="两次密码不一致";
	}else{
		document.getElementById('comfirmpasswordTip').innerHTML="";
	}
}

function Checkalterpassword()
{
	var pass=document.getElementsByName('user.password')[0].value;
	if(pass==""||pass==null){
		document.getElementById('passwordTip').innerHTML="原密码不能为空";
		document.getElementsByName('user.password')[0].focus();
		return false;
	}
	var newpass=document.getElementsByName('newpassword')[0].value;
	if(newpass==""){
		document.getElementById('newpasswordTip').innerHTML="新密码不能为空";
		document.getElementsByName('newpassword')[0].focus();
		return false;
	}
	var comfirmpass=document.getElementsByName('comfirmpassword')[0].value;
	if(comfirmpass != newpass){
		document.getElementById('comfirmpasswordTip').innerHTML="两次密码不一致";
		document.getElementsByName('comfirmpassword')[0].focus();
		return false;
	}
	
	$.ajax({
		type:"post",
		url:"alterpasswordAction",
		data:{
			"user.password":pass,
			"newpassword":newpass
		},
		dataType:"json",
		success:function(data)
		{
			var d = eval("("+ data + ")");
			if(d.result == "error")
			{
				alert(d.message);
			}
			else if(d.result == "success")
			{
				alert(d.message);
				choose();
			}
		}			
	});
}

function checkphone()
{
	var phone=document.getElementsByName("user.phone")[0].value;
	if(phone!=null&&phone!=""){
		var reg = new RegExp("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$");
		if(!reg.test(phone))
		{
			document.getElementById("phoneTip").innerHTML = "手机号必须符合标准!";
			return false;
		}
	}
	document.getElementById("phoneTip").innerHTML = "";
	return true;
}

function Checkmodifyinfo()
{
	document.getElementById('modifyButton').value="保存";
	document.getElementsByName("user.phone")[0].removeAttribute("readonly");
	if(document.getElementsByName("rank")[0].value=="艺术家"){
		document.getElementsByName("artist.introduction")[0].removeAttribute("readonly");
	}
	document.getElementById('modifyButton').onclick=function(){
		savemodifyinfo();
	};
}

function savemodifyinfo()
{
	var phone=document.getElementsByName("user.phone")[0].value;
	var intro=null;
	if(document.getElementsByName("rank")[0].value=="艺术家"){
		intro=document.getElementsByName("artist.introduction")[0].value;
	}
	if(checkphone()){
		$.ajax({
			type:"post",
			url:"alterinfoAction",
			data:{
				"user.phone":phone,
				"artist.introduction":intro
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
		
		document.getElementById('modifyButton').value="修改";
		document.getElementsByName("user.phone")[0].setAttribute("readonly",'true');
		if(document.getElementsByName("rank")[0].value=="艺术家"){
			document.getElementsByName("artist.introduction")[0].setAttribute("readonly",'true');
		}
		document.getElementById('modifyButton').onclick=function(){
			Checkmodifyinfo();
		};
	}
}

