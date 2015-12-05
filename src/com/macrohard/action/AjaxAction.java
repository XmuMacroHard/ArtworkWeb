package com.macrohard.action;

import net.sf.json.JSONObject;

import com.macrohard.entity.User;
import com.opensymphony.xwork2.ActionSupport;

public class AjaxAction extends ActionSupport 
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private User user;
	private String result;
	
	@Override
	public String execute() throws Exception {
		
		JSONObject object = new JSONObject();
		System.out.println("in ajax action");
		if(user.getAccount().equals("a") && user.getPassword().equals("b"))
		{
			System.out.println("login success");
			object.put("result", "login success!");
			result = object.toString();
			return "success";
		}
		else {
			System.out.println("login fail");
			object.put("result", "login fail!");
			result = object.toString();
			return "false";
		}
		
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
	
}
