
/*
package cn.edu.xmu.artwork.websocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.aspectj.weaver.patterns.ThisOrTargetAnnotationPointcut;

@ServerEndpoint("/websocket")
public class ChatServer  
{
	
	  @OnMessage
	  public void onMessage(String message, Session session)
	    throws IOException, InterruptedException {
	   
	    System.out.println("Received: " + message);	   	    
	    for(Long key : UserPool.getUserPool().keySet())
	    {
	    	UserPool.getSession(key).getBasicRemote().sendText(message);
	    }	    
	  }
	   
	  @OnOpen
	  public void onOpen(Long id, Session session) {
	    System.out.println("Client connected");
	    UserPool.add(id, session);	    
	  }
	 
	  @OnClose
	  public void onClose(Long id, Session session) {
	    System.out.println("Connection closed");
	    UserPool.remove(id);
	  }
	  
}

*/
