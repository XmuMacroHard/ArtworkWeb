/**
 * 
 */

function btn()
{		
	$.ajax({
		type:"post",
		url:"ajaxAction",
		data:{
			"user.email":$("#account_input").val(),
			"user.password":$("#password_input").val()
		},
		dataType:"json",
		success:function(data){
			var d = eval("("+ data + ")");
			alert(d);
		}
	});

}

$(document).ready(function()
		{			
			//bind the event to the button
			$("#submit_input").bind("click", btn);
			
		});