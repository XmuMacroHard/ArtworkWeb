package com.macrohard.service.impl;

import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.If;

import com.macrohard.dao.IUserDao;
import com.macrohard.dao.impl.UserDao;
import com.macrohard.entity.User;
import com.macrohard.service.IUserService;

public class UserService implements IUserService
{
	private UserDao userDao;
	
	public void addUser(User user)
	{
		
		System.out.println("in user service");
		userDao.insert(user);
	}

	public IUserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	@Override
	public boolean register(User user) {
		if(isExist(user))
			return false;
		else
		{
			userDao.insert(user);
			return true;
		}
	}

	@Override
	public boolean login(User user) {
		if(isExist(user))
			return true;
		else
			return false;
	}
	
	private boolean isExist(User user) {
		List<User> list = userDao.search(user);
		
		return !list.isEmpty();
	}
	
}
