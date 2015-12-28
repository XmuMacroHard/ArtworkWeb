package cn.edu.xmu.artwork.websocket;


import javax.websocket.OnMessage;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/echo")
public class EchoServer {
	@OnMessage
	public String echo(String incomingMessage) {
		System.out.println(incomingMessage);
		return "I got this (" + incomingMessage + ")"
				+ " so I am sending it back !";
	}
}
