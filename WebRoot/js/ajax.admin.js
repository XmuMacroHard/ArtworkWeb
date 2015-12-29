/**
 * 所有后台管理的ajax方法
 * @author asus1
 */

/**
 * 禁用用户操作
 * @author asus1
 */
function UserBanning(id)
{		
	$.ajax({
		type:"post",
		url:"UserBanning",
		data:{
			"user.id":id
		},
		dataType:"json",
		beforeSend:function(){
			confirm("您确认禁用该用户吗？");
		},
		success:function(result){
			var jsobj = eval("(" + result + ")");
			
			$("#"+jsobj.id).html("<span class='label label-danger'>已禁用</span>");
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
function UserRelieve(id)
{		
	$.ajax({
		type:"post",
		url:"UserRelieve",
		data:{
			"user.id":id
		},
		dataType:"json",
		beforeSend:function(){
			confirm("您确认启用该用户吗？");
		},
		success:function(result){
			var jsobj = eval("(" + result + ")");
			
			$("#"+jsobj.id).html("<span class='label label-success'>已启用</span>");
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
			
			$("#"+jsobj.id).html("<span class='label label-danger'>已驳回</span>");
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
			
			$("#"+jsobj.id).html("<span class='label label-success'>已通过</span>");
		},
		error:function(result){
			alert("error");
		}
	});
}

/**
 * 商品下架
 * @author asus1
 */
function ItemBanning(id)
{		
	$.ajax({
		type:"post",
		url:"ItemBanning",
		data:{
			"item.id":id
		},
		dataType:"json",
		beforeSend:function(){
			confirm("您确认下架该商品吗？");
		},
		success:function(result){
			var jsobj = eval("(" + result + ")");
			
			$("#"+jsobj.id).html("<span class='label label-danger'>已下架</span>");
		},
		error:function(result){
			alert("error");
		}
	});
}

/**
 * 商品上架
 * @author asus1
 * @param email
 */
function ItemRelieve(id)
{		
	$.ajax({
		type:"post",
		url:"ItemRelieve",
		data:{
			"item.id":id
		},
		dataType:"json",
		beforeSend:function(){
			confirm("您确认上架该商品吗？");
		},
		success:function(result){
			var jsobj = eval("(" + result + ")");
			
			$("#"+jsobj.id).html("<span class='label label-success'>上架</span>");
		},
		error:function(result){
			alert("error");
		}
	});
}

/**
 * 后台系统登录
 * @author asus1
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
			else if(d.result == "admin")
			{
				window.location.href="/ArtworkWeb/ShowAllUserList";
			}
			else if(d.result = "editor")
			{
				window.location.href="/ArtworkWeb/jsp/backstage/admin_submitAdvertise.jsp";
			}
			else
			{
				alert("hello world");
			}
		}			
	});
}

/**
 * 事件绑定
 * @author asus1
 */
$(document).ready(function(){
	$("#loginButton").bind("click",login);
});
