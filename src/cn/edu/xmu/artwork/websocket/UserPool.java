
package cn.edu.xmu.artwork.websocket;

import java.util.HashMap;
import java.util.Map;

import javax.websocket.Session;


public class UserPool 
{
	public static Map<String, Object> USER_POOL = new HashMap<String, Object>();
	
	public static void add(Session session)
	{
		USER_POOL.put(session.getId(), session);
	}
	
	public static void remove(Session session)
	{
		USER_POOL.remove(session.getId());
	}
	
	public static Session getSession(String id)
	{
		return (Session)USER_POOL.get(id);
	}
	
	public static Map<String, Object> getUserPool()
	{
		return USER_POOL;
	}
	
}