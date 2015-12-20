package cn.edu.xmu.artwork.service.impl;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Hibernate;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;


import com.opensymphony.xwork2.ActionContext;

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
	
	/**
	 * 根据arg的值，获得session中的值
	 * @param arg
	 * @return
	 */	
	protected Object getSessionInBrower(String arg)
	{
		return ServletActionContext.getRequest().getSession().getAttribute(arg);
	}
	
	/**
	 * 存储键值对到session中
	 * @param key
	 * @param value
	 */
	protected void setSessionInBrower(String key, Object value)
	{
		ActionContext.getContext().getSession().put(key, value);
	}
	
	/**
	 * 删除存储在session中键值为key的对象
	 * @param key
	 */
	protected void removeSessionInBrower(String key)
	{
		ActionContext.getContext().getSession().remove(key);
	}
}
