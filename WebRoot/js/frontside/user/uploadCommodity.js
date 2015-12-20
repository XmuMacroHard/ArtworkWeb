/**
 * 
 */

$(document).ready(function(){
	$("#uploadCommodity").click(uploadCommodity());
});


function uploadCommodity()
{
	alert("hello");
	$.ajaxFileUpload({
		url:'uploadCommodity',
		secureuri:false,
		fileElementId:'pictures',
		dateType:'json',
		success:function(data, status)
		{
			alert(data.message);
		}
	})
}
