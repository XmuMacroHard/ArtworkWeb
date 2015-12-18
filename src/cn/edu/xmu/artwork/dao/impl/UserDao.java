package cn.edu.xmu.artwork.dao.impl;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.util.List;

import org.hibernate.*;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.xmu.artwork.dao.IUserDao;
import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.User;

@Repository
public class UserDao extends GenericDao implements IUserDao 
{
	
	public void insert(User user) 
	{		
		System.out.println("in user dao" + user.getEmail() + user.getPassword());
		getSession().save(user);	
		System.out.println("success");
	} 
	
	//search user by the email and password
	public User search(User user)
	{
		System.out.println("search in dao："+ user.getEmail() + "  " + user.getPassword());
		Query query = getSession().getNamedQuery("getUserByEmailPassword");
		query.setParameter("email", user.getEmail());
		query.setParameter("password", user.getPassword());
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
		
		
		String hql=String.format("update User user set user.isBanned = %s where user.email = %s", state, userEmail);
		Query queryupdate= getSession().createQuery(hql);
		int ret=queryupdate.executeUpdate();
		
		System.out.println("in userDao + " + state);
	}
}
