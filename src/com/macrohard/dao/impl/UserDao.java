package com.macrohard.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.macrohard.dao.IUserDao;
import com.macrohard.entity.User;

public class UserDao extends GenericDao implements IUserDao 
{
	
	public void insert(User user)
	{
		System.out.println("in user dao" + user.getAccount() + user.getPassword());
		getSession().save(user);
		
		getSession().close();
	}
	
	public List findAll() {
		
		try {
			String queryString = "from User";
			Query queryObject = getSession().createQuery(queryString);			
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
		finally
		{
			if(getSession().isOpen())
				closeSession();
		}
	}
	
	public User findById(long id)
	{
		try {
			User instance = (User) getSession().get(
					"com.macrohard.entity.User", id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
}
