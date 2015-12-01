package com.macrohard.service;

import com.macrohard.entity.User;

public interface IUserService {
	public void addUser(User user);
	public boolean register(User user);
	public boolean login(User user);
}
