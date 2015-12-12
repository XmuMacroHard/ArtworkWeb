package cn.edu.xmu.artwork.service.impl;

import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.If;

import cn.edu.xmu.artwork.dao.IUserDao;
import cn.edu.xmu.artwork.dao.impl.UserDao;
import cn.edu.xmu.artwork.entity.Information;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.IUserService;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;

public class UserService implements IUserService
{
	private UserDao userDao;
	
	public void addUser(User user)
	{
		System.out.println("in user service");
		userDao.insert(user);
	}
	

	public IUserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	@Override
	public void register(User user) throws Exception{
		userDao.insert(user);
		ActionContext.getContext().getSession().put("user", user);
	}

	@Override
	public String login(User user) {
		User resultUser = userDao.search(user);
		if(null == resultUser)
			return "fail";
		else
		{
			ActionContext.getContext().getSession().put("user", resultUser);

//			if(resultUser.getIdentity().equals("normal"))
				return "success";
//			else
//				return "admistratorSuccess";

		}
	}
	
	
}
