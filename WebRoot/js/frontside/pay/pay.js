/**
 * 
 */

$(document).ready(function(){
	$("#address").children().each(function(){
		$(this).click(chooseAddress);
	});
	
});

function chooseAddress()
{
	$("#address").children().css("background"," #D4DEDF");
	$(this).css("background","rgb(199,242,231)");
	
	var addressid = $(this).attr("id");
	$("#addressid").val(addressid);
}
