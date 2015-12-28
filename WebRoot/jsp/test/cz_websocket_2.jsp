<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cz_websocket_2.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="http://cdn.sockjs.org/sockjs-0.3.min.js"></script>
  </head>
  
  <body>
    <div>
    
    <input type="submit" value="open websocket" onclick="start()" />
    
    <div>name:<input id="receiver" type="text"/></div>
    <div id="message" style="height: 250px;width: 280px;border: 1px solid; overflow: auto;"></div>
    <input id="inputMsg" type="text" />
	<input type="submit" value="send" onclick="sendMsg()"/>
    
  	</div>
  <div id="messages"></div>
  
  
  <script type="text/javascript" src="js/jquery.min.js"></script> 
  <script type="text/javascript">
  
	var webSocket = null;
	if('WebSocket' in window){
              var webSocket = new WebSocket('ws://localhost:8080/ArtworkWeb/websocket');
      }
      else{
          alert('Not support websocket');
      }
 
    webSocket.onerror = function(event) {
      onError("error");
    };
 
    webSocket.onopen = function(event) {
      onOpen("onopen");
    };
 
    webSocket.onmessage = function(event) {
      onMessage("onmessage");
    };
 
    function onMessage(event) {
      document.getElementById('message').innerHTML
        += '<br />' + event.data;
    }
 
    function onOpen(event) {
      document.getElementById('messages').innerHTML
        = 'Connection established';
    }
 
    function onError(event) {
      //alert(event.data);
      alert("error");
    }
 
    function start() {
      webSocket.send('hello');
      return false;
    }
    
    function sendMsg()
    {
    	var sender = "cz";
    	var receiver = $("#receiver").val();
    	var content = $("#inputMsg").val();
    	webSocket.send(content);
    	
    }
  </script>
  </body>
</html>
