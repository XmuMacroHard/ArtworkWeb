package cn.edu.xmu.artwork.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.util.List;

import org.hibernate.*;

import cn.edu.xmu.artwork.dao.IUserDao;
import cn.edu.xmu.artwork.entity.User;

public class UserDao extends GenericDao implements IUserDao 
{
	
	public void insert(User user)
	{
//		System.out.println("in user dao" + user.getAccount() + user.getPassword());

		getSession().save(user);
		getSession().close();
	} 
	
	public User search(User user)
	{
		String hql = String.format("From User as user where user.account = '%s' and user.password = '%s'",
				user.getEmail(), user.getPassword());
		Query query = getSession().createQuery(hql);
		return  (User)query.uniqueResult();
	}
	
	public Session getSession()
	{
		return sessionFactory.openSession();
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
