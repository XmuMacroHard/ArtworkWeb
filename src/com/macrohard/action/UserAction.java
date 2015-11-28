package com.macrohard.action;

import com.opensymphony.xwork2.ActionSupport;
import com.macrohard.entity.User;
import com.macrohard.service.*;

public class UserAction extends ActionSupport 
{
	private static final long serialVersionUID = 1L;
	private User user;
	private IUserService userService;
	
	@Override
	public String execute() throws Exception {
		if(user.getAccount().equals("a")&& user.getPassword().equals("b"))
		{		
			userService.addUser(user);
			System.out.println("in action \n");
			return "success";	
		}		
		else 
		{
			return "fail";
		}
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
