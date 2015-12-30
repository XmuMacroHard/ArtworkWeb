<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <script src="http://cdn.sockjs.org/sockjs-0.3.min.js"></script>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!--<script type="text/javascript" src="js/jquery-1.7.2.js"></script>-->
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <title>webSocket测试</title>
    <script type="text/javascript">
        $(function(){
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
            websocket.onopen = function (evnt) {
                $("#tou").html("connection success!")
            };
            websocket.onmessage = function (evnt) {
                $("#msg").html($("#msg").html() + "<br/>" + evnt.data);
            };
            websocket.onerror = function (evnt) {
            };
            websocket.onclose = function (evnt) {
                 $("#tou").html("connection fail!") 
               
            }
            $('#send').bind('click', function() {
                send();
            });
            function send(){    
                  if (websocket != null) {
                    var message = document.getElementById('message').value;
                    var auction_id = document.getElementById('auction_id').value;
                    websocket.send(message +" " + auction_id);
                } else {
                    alert('Not connection');
                }  
            } 
        }
        );
    </script>

</head>
<body>

<div class="page-header" id="tou">
    websocket chat
</div>
<div class="well" id="msg">
</div>
<div class="col-lg">
    <div class="input-group">
        <input type="text" class="form-control" placeholder="send message." id="message">
        <input type="text" class="form-control" placeholder="auction_id" id="auction_id">
      <span class="input-group-btn">
        <button class="btn btn-default" type="button" id="send" >send</button>
      </span>
    </div><!-- /input-group -->
</div><!-- /.col-lg-6 -->
</div><!-- /.row -->
</body>

</html>