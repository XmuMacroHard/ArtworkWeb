package cn.edu.xmu.artwork.service.impl;

import org.hibernate.Hibernate;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class BasicService {
	@Autowired
	private SessionFactory sessionFactory;
	
	void initializeObject(Object obj)
	{
		Hibernate.initialize(obj);
	}
	
	public void OpenSession()
	{
		sessionFactory.openSession();
	}
	
	public void closeSession()
	{
		sessionFactory.getCurrentSession().close();
	}
}
