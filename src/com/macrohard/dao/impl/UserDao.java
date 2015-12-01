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
	
	public User search(User user)
	{
		String hql = String.format("From User as user where user.account = '%s' and user.password = '%s'",
				user.getAccount(), user.getPassword());
		Query query = getSession().createQuery(hql);
		return  (User)query.uniqueResult();
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
