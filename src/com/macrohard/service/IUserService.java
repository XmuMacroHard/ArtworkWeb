package com.macrohard.service;

import java.util.List;

import com.macrohard.entity.Information;
import com.macrohard.entity.User;

public interface IUserService {
	public void addUser(User user);
	public void register(User user) throws Exception;
	public String login(User user);
}
