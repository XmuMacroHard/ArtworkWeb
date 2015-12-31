/**
 * 
 */

$(document).ready(function(){
	onload("getArtistCusOrderByState", "4",1);
});


function onload(action, state,nowpage)
{
	getCustomizationOrderByType(action, state,nowpage)
}


//action 请求 
//type 这里没有订单类型，因为不同种类订单的action不同
//state 订单状态
function getCustomizationOrderByType(action, state,nowpage)
{
	if(state == "0")
	{
		$("#orderTypeTitle").text("待付款");
	}
	else if(state == "1")
	{
		$("#orderTypeTitle").text("待发货");
	}
	else if(state == "2")
	{
		$("#orderTypeTitle").text("待收获");
	}
	else if(state == "3")
	{
		$("#orderTypeTitle").text("已完成");
	}
	else if(state == "4")
	{
		$("#orderTypeTitle").text("待接受");
	}
	
	$.ajax({
		type:"post",
		url:action,
		data:{"purchaseOrder.state": state},
		dataType:"json",
		success:function(data)
		{		
			
			if(data.result != null && data.result == "notLogin")
			{
				window.location.href="jsp/frontside/user/login.jsp"
			}
			else
			{
			var list = "";
			var $orderList = $("#orderList"); 
			$orderList.empty();
			
			var pages="";
			var pagesize=6;
			var totalcount=data.length;
			var totalpage=Math.ceil(totalcount/pagesize);
			var $pageList = $("#page_list");
			
			$pageList.empty();
			if(nowpage!=1){
				pages+="<li><a href=\"javascript:onload(\'"+action+"\',\'"+state+"\',1);\">&lt;&lt;</a></li>";
				pages+="<li><a href=\"javascript:onload(\'"+action+"\',\'"+state+"\',"+(nowpage-1)+
				");\">&lt;</a></li>";
			}
			for(var i=nowpage-2;i<=nowpage+2;i++){
				if(i==nowpage){
					pages+="<li class=\"active\"><a href=\"javascript:onload(\'"+action+"\',\'"+state+"\',"+i+
						");\">"+i+"</a></li>";
					}
				else{
					if(i>0&&i<=totalpage){
						pages+="<li><a href=\"javascript:onload(\'" +action+"\',\'"+state+"\',"+i+
						");\">"+i+"</a></li>";
					}
				}
			}
			if(nowpage!=totalpage&&totalpage!=0){
				pages+="<li><a href=\"javascript:onload(\'" +action+"\',\'"+state+"\',"+(nowpage+1)+
				");\">&gt;</a></li>";
				pages+="<li><a href=\"javascript:onload(\'" +action+"\',\'"+state+"\',"+totalpage+
				");\">&gt;&gt;</a></li>"
			}
			$pageList.append(pages);
			
			$orderList.empty();
			var start=pagesize*(nowpage-1);
			for(var i=start;i<=start+pagesize-1&&i<=totalcount-1;i++)
			{
				var item=data[i];
				list += "<div id='address' class='row'>" +    
				"<div id=''  class='col-md-1  orderwrap'>" +
      		"<div>订单号:" + item.orderid + "</div><hr/>" +
      			"<div>" +
      				"<button onclick='detail("+ item.id +")'  class='button btn-empty' title='Clear Cart' value='empty_cart' name='update_cart_action' type='submit'><span><span>详情</span></span></button>" +        				
      			"</div>" +
      		"</div>" +    
      		"</div> ";
			}
			
			$orderList.append(list);
			}	
		}
	});
}


function detail(id)
{
	window.location.href="getDetailPuchaseOrderToArtist?purchaseOrder.id=" + id;
}