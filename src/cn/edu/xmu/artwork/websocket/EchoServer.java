package cn.edu.xmu.artwork.websocket;


import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import net.sf.json.JSON;

@ServerEndpoint("/echo")
public class EchoServer {
	public static final Set<Session> sessions = new HashSet<Session>();
	
	@OnOpen
	public void onOpenC(Session session)
	{
		sessions.add(session);
	}
	
	@OnMessage
	public void onMessageM(String message) 
	{
		  
		System.out.println("Received: " + message);
		try {
			for (Session s : sessions) {
				s.getBasicRemote().sendText("I get " + message);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	  
	@OnClose
	public String closeM()
	{
		
		return "123";
	}
}
