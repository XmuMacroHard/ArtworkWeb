package cn.edu.xmu.artwork.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

import cn.edu.xmu.artwork.entity.CustomizationOrder;

public abstract class GenericDao 
{
	@Autowired
	SessionFactory sessionFactory;
	
	Session session;
	Transaction transaction;
	
	/**
	 * 获取session值
	 * @return
	 */
	protected Session getSession()
	{
		session = sessionFactory.getCurrentSession();

		return session;
	}
	
	/**
	 * 开启事务
	 */
	protected void beginTransaction()
	{
		transaction = session.beginTransaction();
	}
	
	/**
	 * 提交事务
	 */
	protected void commit()
	{
		transaction.commit();
	}
	/**
	 * 注入sessionFactory
	 * @param sessionFactory
	 */
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	/**
	 * 关闭session
	 */
	protected void closeSession()
	{
		session.close();
	}

}
