package com.macrohard.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.macrohard.dao.IUserDao;
import com.macrohard.entity.User;

public class UserDao implements IUserDao 
{
	SessionFactory sessionFactory;
	
	public void insert(User user)
	{
		System.out.println("in user dao" + user.getAccount() + user.getPassword());
		getSession().save(user);
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
