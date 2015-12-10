package com.macrohard.action;

import org.hibernate.exception.ConstraintViolationException;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.macrohard.entity.User;
import com.macrohard.service.*;

public class UserAction extends ActionSupport 
{
	private static final long serialVersionUID = 1L;
	private User user;
	private IUserService userService;
	
	public String login() 
	{
		// s = {fail, success, admistratorSuccess}
		String s = userService.login(user);
		return s;
	}
	
	public String register()  
	{
		try {
			userService.register(user);
			return "success";
		} 
		catch (ConstraintViolationException e) {
			String faildetail = "鐢ㄦ埛宸插瓨鍦�";
		    ActionContext.getContext().put("faildetail", faildetail);
			return "fail";
		}
		catch (Exception e) {
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
