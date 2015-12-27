package cn.edu.xmu.artwork.websocket;

import java.io.IOException;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/websocket")
public class ChatServer  
{
	//private static
	
	  @OnMessage
	  public void onMessage(String message, Session session)
	    throws IOException, InterruptedException {
	   
	    // Print the client message for testing purposes
	    System.out.println("Received: " + message);
	   
/*	    Set<Session> sessions = session.getOpenSessions();
	    // Send the first message to the client1
	    for(Session s : sessions)
	    {
	    	if(s.isOpen())
	    	{
	    		s.getBasicRemote().sendText(message);
	    	}
	    }*/
	    
	    
	    
	  }
	   
	  @OnOpen
	  public void onOpen() {
	    System.out.println("Client connected");
	  }
	 
	  @OnClose
	  public void onClose() {
	    System.out.println("Connection closed");
	  }
}
