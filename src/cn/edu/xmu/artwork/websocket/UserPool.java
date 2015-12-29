/*
package cn.edu.xmu.artwork.websocket;

import java.util.HashMap;
import java.util.Map;

import javax.websocket.Session;


public class UserPool 
{
	public static Map<Long, Object> USER_POOL = new HashMap<Long, Object>();
	
	public static void add(long id, Session session)
	{
		USER_POOL.put(id, session);
	}
	
	public static void remove(long id)
	{
		USER_POOL.remove(id);
	}
	
	public static Session getSession(Long sessionId)
	{
		return (Session)USER_POOL.get(sessionId);
	}
	
	public static Map<Long, Object> getUserPool()
	{
		return USER_POOL;
	}
	
	
}

*/