/**
 * 
 */

$(document).ready(function(){
	$("#orderButton").bind("click", order);
});


function order()
{
	var id = $("#artistid_hidden_input").val();
	var name = $("#artistrn_hidden_input").val();
	window.location.href = "jsp/frontside/order/order.jsp?artistid=" + id + "&artistrm=" + name;
}