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
import net.sf.json.JSONObject;

@ServerEndpoint("/AuctionWebSocket")
public class AuctionWebSocketServer {
	public static final Set<Session> sessions = new HashSet<Session>();
	
	@OnOpen
	public void onOpen(Session session)
	{
		UserPool.add(session);
	}
	
	@OnMessage
	public void onMessage(String message, Session session) 
	{
		String[] me = message.split(" ");
		int auction_id = Integer.parseInt(me[1]);
		System.out.println("Received: " + message + " id: "+auction_id);
		UserPool.addSession(auction_id, session);
		Set<Session> sessions = UserPool.getAuctionSessions(auction_id);
		
		try {
			for (Session s : sessions) {
				s.getBasicRemote().sendText("I get " + message);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	  
	@OnClose
	public void onClose(Session session)
	{
		UserPool.remove(session);
	}
}