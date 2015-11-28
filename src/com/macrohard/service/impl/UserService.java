package com.macrohard.service.impl;

import com.macrohard.dao.IUserDao;
import com.macrohard.entity.User;
import com.macrohard.service.IUserService;

public class UserService implements IUserService
{
	private IUserDao userDao;
	
	public void addUser(User user)
	{
		
		System.out.println("in user service");
		userDao.insert(user);
	}

	public IUserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}
	
	
}
