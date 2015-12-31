package cn.edu.xmu.artwork.websocket;


import java.io.IOException;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import cn.edu.xmu.artwork.entity.Auction;
import cn.edu.xmu.artwork.entity.Bid;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.IAuctionService;
import cn.edu.xmu.artwork.service.impl.AuctionService;
import net.sf.json.JSON;
import net.sf.json.JSONObject;


@ServerEndpoint("/AuctionWebSocket")
public class AuctionWebSocketServer {
	
	@Autowired
	private IAuctionService auctionService = new AuctionService();
	
	@OnOpen
	public void onOpen(Session session)
	{
		UserPool.add(session);
	}
	
	@OnMessage
	public void onMessage(String message, Session session) 
	{
		//System.out.println(message);
		
		JSONObject msg = JSONObject.fromObject(message);
		
		int auctionId = msg.getInt("auctionId");
		
		UserPool.addSession(auctionId, session);
		Set<Session> sessions = UserPool.getAuctionSessions(auctionId);
		
		//float p = Float.parseFloat( msg.getString("price"));
		//auctionService.addBid(auctionId, p);
		
		//User user = (User)ServletActionContext.getRequest().getSession().getAttribute("user");
		User user = new User();
		user.setId((long) 1);
		user.setNickname("haha");

		msg.put("username", user.getNickname());
		msg.put("date", new Date().toLocaleString());
		
		try {
			for (Session s : sessions) {
				//s.getBasicRemote().sendText(msg.getString("price"));
				s.getBasicRemote().sendText(msg.toString());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	  
	@OnClose
	public void onClose(Session session)
	{
		System.out.println("on close "+ session.getId());
		UserPool.remove(session);
	}
}
