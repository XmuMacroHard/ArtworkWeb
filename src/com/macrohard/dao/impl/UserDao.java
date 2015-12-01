package com.macrohard.dao.impl;


import java.util.List;

import org.hibernate.*;

import com.macrohard.dao.IUserDao;
import com.macrohard.entity.User;

public class UserDao implements IUserDao 
{
	SessionFactory sessionFactory;
	
	public void insert(User user)
	{
		System.out.println("in user dao" + user.getAccount() + user.getPassword());
		getSession().save(user);
		
		getSession().close();
	}
	
	public List<User> search(User user)
	{
		Query query = getSession().createQuery("From User as user "
				+ "where user.account = '" + user.getAccount() +"'");
		
		return  query.list();
	}
	
	public Session getSession()
	{
		return sessionFactory.openSession();
	}
	

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
}
