/**
 * 所有后台管理的ajax方法
 * @author asus1
 */

function UserBanning(email)
{		
	$.ajax({
		type:"post",
		url:"UserBanning",
		data:{
			"user.email":email
		},
		dataType:"json",
		beforeSend:function(){
			confirm("您确认禁用该用户吗？");
		},
		success:function(data){
			alert("success");
		}
	});
}