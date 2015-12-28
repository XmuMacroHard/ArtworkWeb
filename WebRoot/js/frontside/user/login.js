/**
 * 
 */

function login()
{
	$.ajax({
		type:"post",
		url:"loginAction",
		data:{
			"user.email":$("#email").val(),
			"user.password":$("#password").val()
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
				window.location.href="/ArtworkWeb/showInfoOnHomePage";
			}
		}			
	});
}

$(document).ready(function(){
	$("#loginButton").bind("click",login);
});

function checkUser(){
	var email = document.getElementsByName('user.email')[0].value;
	var button = document.getElementById('loginButton');
	if(email==""||email==null)
	{
		document.getElementById('userTip').innerHTML = "账号不能为空！";
		button.disabled=true;
		return;
	}
	else
	{
		var temp=document.getElementById("userTip");
		temp.innerHTML = "";
		button.disabled=false;
	}
}

function checkPassword(){
	var password = document.getElementsByName('user.password')[0].value;
	var button = document.getElementById('loginButton');
	if(!password)
	{
		var temp=document.getElementById("passwordTip");
		temp.innerHTML = "密码不能为空!";
		button.disabled=true;
	}
	else
	{
		var temp=document.getElementById("passwordTip");
		temp.innerHTML = "";
		button.disabled=false;
	}
}