package com.macrohard.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class GenericDao 
{
	SessionFactory sessionFactory;
	Session session;
	Transaction transaction;
	
	protected Session getSession()
	{
		session = sessionFactory.openSession();
		return session;
	}
	
	protected void beginTransaction()
	{
		transaction = session.beginTransaction();
	}
	
	protected void commit()
	{
		transaction.commit();
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	protected void closeSession()
	{
		session.close();
	}
}
