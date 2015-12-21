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