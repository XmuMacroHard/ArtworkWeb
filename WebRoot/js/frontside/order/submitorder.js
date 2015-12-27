/**
 * 
 */

$(document).ready(function(){
	onload();
});


function onload()
{
	var rm = $.urlParam('artistrm');
	var id = $.urlParam('artistid');
//	alert(rm);
//	alert("h");
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