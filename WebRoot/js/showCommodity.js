/**
 * 针对商品列表显示的ajax
 */

function showCommodityList()
{
	$.ajax({
		type:"post",
		url:"showCommodityList",
//		url:"showCommoditiesAction",
		data:{"commodity.type":"calligraphy"},
		dataType:"json",
		success:function(data){
			var commodities = eval("("+ data + ")");
			$('#showresult').html(commodities[0].id);
		}
		
	})
}

$(document).ready(function(){
	$('#submit').bind("click", showCommodityList);
});