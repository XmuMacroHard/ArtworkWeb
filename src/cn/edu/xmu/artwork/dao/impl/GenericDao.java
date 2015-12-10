package cn.edu.xmu.artwork.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class GenericDao 
{
	@Autowired
	SessionFactory sessionFactory;
	
	Session session;
	Transaction transaction;
	
	protected Session getSession()
	{
		//session = sessionFactory.getCurrentSession();
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