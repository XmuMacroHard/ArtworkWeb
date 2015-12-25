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

/**
 * 退回资讯操作
 * @author asus1
 */
function InfoRetreat(infoId)
{		
	$.ajax({
		type:"post",
		url:"InfoRetreat",
		data:{
			"information.id":infoId
		},
		dataType:"json",
		beforeSend:function(){
			confirm("您确认退回该资讯吗？");
		},
		success:function(result){
			var jsobj = eval("(" + result + ")");
			
			$("#"+jsobj.id).html("<span class='label label-danger'>已退回</span>");
		},
		error:function(result){
			alert("error");
		}
	});
}

/**
 * 通过资讯操作
 * @author asus1
 * @param email
 */
function InfoPass(infoId)
{		
	$.ajax({
		type:"post",
		url:"InfoPass",
		data:{
			"information.id":infoId
		},
		dataType:"json",
		beforeSend:function(){
			confirm("您确认通过该资讯吗？");
		},
		success:function(result){
			var jsobj = eval("(" + result + ")");
			
			$("#"+jsobj.id).html("<span class='label label-success'>已通过</span>");
		},
		error:function(result){
			alert("error");
		}
	});
}

/**
 * 驳回艺术家认证操作
 * @author asus1
 */
function ArtistBanning(id)
{		
	$.ajax({
		type:"post",
		url:"ArtistBanning",
		data:{
			"artist.id":id
		},
		dataType:"json",
		beforeSend:function(){
			confirm("您确认驳回该用户认证请求吗？");
		},
		success:function(result){
			var jsobj = eval("(" + result + ")");
			
			$("#"+jsobj.email).html("<span class='label label-danger'>已驳回</span>");
		},
		error:function(result){
			alert("error");
		}
	});
}

/**
 * 通过艺术家认证
 * @author asus1
 * @param email
 */
function ArtistRelieve(id)
{		
	$.ajax({
		type:"post",
		url:"ArtistRelieve",
		data:{
			"artist.id":id
		},
		dataType:"json",
		beforeSend:function(){
			confirm("您确认通过该用户认证请求吗？");
		},
		success:function(result){
			var jsobj = eval("(" + result + ")");
			
			$("#"+jsobj.email).html("<span class='label label-success'>已通过</span>");
		},
		error:function(result){
			alert("error");
		}
	});
}
