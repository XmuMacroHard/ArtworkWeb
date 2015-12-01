package com.macrohard.dao;

import com.macrohard.entity.User;

public interface IUserDao {
	public void insert(User user);
	public User search(User user);
}
