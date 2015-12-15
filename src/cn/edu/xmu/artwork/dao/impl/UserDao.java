package cn.edu.xmu.artwork.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.util.List;

import org.hibernate.*;
import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.dao.IUserDao;
import cn.edu.xmu.artwork.entity.User;

@Repository
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
	
	@SuppressWarnings("rawtypes")
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
	
	/**
	 * 更新用户状态
	 * @author asus1
	 * @param userEmail
	 * @param state
	 */
	public void updateUserState(String userEmail, String state)
	{
		System.out.println("in userDao");
		
		
		
		Transaction trans = getSession().beginTransaction();
		String hql=String.format("update User user set user.isBanned = %s where user.email = %s", state, userEmail);
		Query queryupdate=session.createQuery(hql);
		int ret=queryupdate.executeUpdate();
		trans.commit();
		closeSession();
		
		System.out.println("in userDao + " + state);
	}
}
