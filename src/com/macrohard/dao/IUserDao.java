package com.macrohard.dao;

import java.util.List;

import com.macrohard.entity.User;

public interface IUserDao {
	public void insert(User user);
	public User search(User user);
	public List findAll();
	public User findById(long id);
}
