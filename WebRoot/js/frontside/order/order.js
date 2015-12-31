/**
 * 
 */

$(document).ready(function(){
	$("#orderButton").bind("click", order);
});


function order()
{
	var id = $("#artistid_hidden_input").val();
	var user_id= $("#userid_hidden").val();
	if(user_id==""){
		alert("请先登录");
		window.location.href = "jsp/frontside/user/login.jsp";
	}
	else{
		window.location.href = "placeCustomization?artist.id=" + id;
	}
}