package com.macrohard.action;

import com.opensymphony.xwork2.ActionSupport;
import com.macrohard.entity.User;
import com.macrohard.service.*;

public class UserAction extends ActionSupport 
{
	private static final long serialVersionUID = 1L;
	private User user;
	private IUserService userService;
	


	public String login() throws Exception
	{
		if(userService.login(user))
			return "success";
		else
			return "fail";
	}
	
	public String register() throws Exception
	{
		if(userService.register(user))
			return "success";
		else
			return "fail";
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	
	
}
