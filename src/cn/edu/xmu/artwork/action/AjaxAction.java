package cn.edu.xmu.artwork.action;

import net.sf.json.JSONObject;
import cn.edu.xmu.artwork.entity.User;

import com.opensymphony.xwork2.ActionSupport;

public class AjaxAction extends ActionSupport 
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private User user;
	private String result;
	private byte[] fileup;
	
	@Override
	public String execute() throws Exception {
		
		JSONObject object = new JSONObject();
		System.out.println("in ajax action");

//		if(user.getEmail().equals("a") && user.getPassword().equals("b"))
//		{
//			System.out.println("login success");
//			object.put("result", "login success!");
//			result = object.toString();
//			return "success";
//		}
//		else {
//			System.out.println("login fail");
//			object.put("result", "login fail!");
//			result = object.toString();
//			return "false";
//		}
		object.put("url", "abc");
		result = object.toString();
		return "seccess";
		
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
	
}
