/**
 * 
 */
function checkUser(){
	var email = document.getElementsByName('user.email')[0].value;
	var button = document.getElementById('submitbutton');
	if(email==""||email==null)
	{
		document.getElementById('userTip').innerHTML = "账号不能为空！";
		button.disabled=true;
		return;
	}
	var reg = new RegExp("[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+");
	if(!reg.test(email))
	{
		var temp=document.getElementById("userTip");
		temp.innerHTML = "邮箱必须符合标准!";
		button.disabled=true;
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
	var button = document.getElementById('submitbutton');
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
function checkPassword_confirm(){
	var password = document.getElementsByName('confirmPassword')[0].value;
	var tepassword = document.getElementsByName('user.password')[0].value;
	var button = document.getElementById('submitbutton');
	if(password!=tepassword)
	{
		var temp=document.getElementById("password_confirmTip");
		temp.innerHTML = "两次密码不同!";
		button.disabled=true;
		return;
	}
	else
	{
		if(!tepassword)
		{
			var temp=document.getElementById("password_confirmTip");
			temp.innerHTML = "密码不能为空!";
			button.disabled=true;
		}
		else
		{
			var temp=document.getElementById("password_confirmTip");
			temp.innerHTML = "";
			button.disabled=false;
		}
	}
}

function CheckregisterSubmit()
{
	var email = document.getElementsByName('user.email')[0].value;
	if(email==""||email==null)
	{
		document.getElementById('userTip').innerHTML = "账号不能为空！";
		document.getElementsByName('user.email')[0].focus();
		return false;
	}
	var reg = new RegExp("[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+");
	if(!reg.test(email))
	{
		var temp=document.getElementById("userTip");
		temp.innerHTML = "邮箱必须符合标准!";
		document.getElementsByName('user.email')[0].focus();
		return false;
	}
	else
	{
		var temp=document.getElementById("userTip");
		temp.innerHTML = "";
		
		var password = document.getElementsByName('user.password')[0].value;
		if(!password)
		{
			var temp=document.getElementById("passwordTip");
			temp.innerHTML = "密码不能为空!";
			document.getElementsByName('user.password')[0].focus();
			return false;
		}
		else
		{
			var temp=document.getElementById("passwordTip");
			temp.innerHTML = "";
			
			var tepassword = document.getElementsByName('confirmPassword')[0].value;
			if(password!=tepassword)
			{
				var temp=document.getElementById("password_confirmTip");
				temp.innerHTML = "两次密码不同!";
				document.getElementsByName('confirmPassword')[0].focus();
				return false;
			}
			else
			{
				if(!tepassword)
				{
					var temp=document.getElementById("password_confirmTip");
					temp.innerHTML = "密码不能为空!";
					document.getElementsByName('confirmPassword')[0].focus();
					return false;
				}
				else
				{
					var temp=document.getElementById("password_confirmTip");
					temp.innerHTML = "";
					var email=document.getElementsByName("user.email")[0].value;
					var password=document.getElementsByName("user.password")[0].value;
					var nickname=document.getElementsByName("user.nickname")[0].value;
					$.ajax({
						type:"post",
						url:"registerAction",
						data:{
							"user.email":email,
							"user.password":password,
							"user.nickname":nickname
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
								window.location.href="/ArtworkWeb/jsp/frontside/user/login.jsp";
							}
						}			
					});
				}
			}
		}
	}
}