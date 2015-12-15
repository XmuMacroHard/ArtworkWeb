/**
 * 所有后台管理的ajax方法
 * @author asus1
 */

/**
 * 禁用用户操作
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
		success:function(result){
			var jsobj = eval("(" + result + ")");
			
			$("#"+jsobj.email).html("<span class='label label-danger'>已禁用</span>");
		},
		error:function(result){
			alert("error");
		}
	});
}

/**
 * 启用用户操作
 * @author asus1
 * @param email
 */
function UserRelieve(email)
{		
	$.ajax({
		type:"post",
		url:"UserRelieve",
		data:{
			"user.email":email
		},
		dataType:"json",
		beforeSend:function(){
			confirm("您确认启用该用户吗？");
		},
		success:function(result){
			var jsobj = eval("(" + result + ")");
			
			$("#"+jsobj.email).html("<span class='label label-success'>已启用</span>");
		},
		error:function(result){
			alert("error");
		}
	});
}