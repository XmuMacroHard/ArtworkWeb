/**
 * 拍卖中的ajax操作
 * @author asus1
 */

/**
 * 页面初始化,加载websocket,事件绑定
 * @author asus1
 */
$(document).ready(function(){
	var websocket;
    if ('WebSocket' in window) {
        alert("WebSocket");
        websocket = new WebSocket("ws://localhost:8080/ArtworkWeb/AuctionWebSocket");
    } else if ('MozWebSocket' in window) {
        alert("MozWebSocket");
        websocket = new MozWebSocket("ws://echo");
    } else {
        alert("SockJS");
        websocket = new SockJS("http://localhost:8080/ArtworkWeb/sockjs/echo");
    }
    websocket.onopen = function (evnt) {};
    
    websocket.onmessage = function (evnt) {
    	alert("callback");
        $("#product-price-48").html(￥+""+evnt.data);
    };
    websocket.onerror = function (evnt) {};
    
    websocket.onclose = function (evnt) {};
    
    function Bid(){
    	alert("bid");
    	
    	if (websocket != null) {
        var price = $("#qty").val();
        var auctionId = document.getElementById('auctionId').value;
        
        var jsobj = {
        	"price":price,
        	"auctionId":auctionId 
        }
        
        websocket.send(JSON.stringify(jsobj));
       
    	}
    	else {
        alert('Not connection');
    	}  
    }
	
	//事件绑定
	$("#bid_btn").bind("click",function(){
		Bid();
	});
});