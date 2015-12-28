/**
 * 
 */

$(document).ready(function(){
	onload();
	$("#submitOrderBtn").bind("click", submitOrder);
});

function submitOrder()
{
	window.location.href = "CustomizationSubmitAction";
}


function onload()
{
	var rm = $.urlParam('artistrm');
	var id = $.urlParam('artistid');

	$("#artistrm").attr("placeholder", rm);
	$("#artistid").attr("value", id);
}

$.urlParam = function(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results==null){
       return null;
    }
    else{
       return results[1] || 0;
    }
}