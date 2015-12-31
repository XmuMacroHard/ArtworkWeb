
package cn.edu.xmu.artwork.websocket;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.websocket.Session;

import org.apache.catalina.filters.AddDefaultCharsetFilter;


public class UserPool 
{
	public static Map<String, Object> USER_POOL = new HashMap<String, Object>();
	public static Map<Integer, Set<Session>> AUCTION_POOL = new HashMap<Integer, Set<Session>>();

	public static void addSession(int auction_id, Session session)
	{
		Set<Session> sessionOfAuctions = AUCTION_POOL.get(auction_id);
		if(sessionOfAuctions != null)
		{
			sessionOfAuctions.add(session);
		}
		else
		{
			sessionOfAuctions = new HashSet<Session>();
			sessionOfAuctions.add(session);
			AUCTION_POOL.put(auction_id, sessionOfAuctions);
		}
	}
	
	public static void removeSession(int auction_id, Session session)
	{
		Set<Session> sessionOfAuctions = AUCTION_POOL.get(auction_id);
		if(sessionOfAuctions != null)
		{
			sessionOfAuctions.remove(session);
		}
	}
	
	public static Set<Session> getAuctionSessions(int auction_id)
	{
		return AUCTION_POOL.get(auction_id);
	}
	
	
	public static void add(Session session)
	{
		USER_POOL.put(session.getId(), session);
	}
	public static void remove(Session session)
	{
		Set<Integer> keys = AUCTION_POOL.keySet();
		for(Integer key: keys)
		{
			AUCTION_POOL.get(key).remove(session);
		}
		USER_POOL.remove(session.getId());
	}
	
	public static Session getSession(String id)
	{
		return (Session)USER_POOL.get(id);
	}
	
//	
//	public static Map<String, Object> getUserPool()
//	{
//		return USER_POOL;
//	}
//	
//	public static void main(String[] args)
//	{
//		
//	}
}