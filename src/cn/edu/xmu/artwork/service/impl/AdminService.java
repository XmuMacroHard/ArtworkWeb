package cn.edu.xmu.artwork.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.xmu.artwork.dao.IUserDao;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.IAdminService;

/**
 * 后台管理的服务层实现
 * @author asus1
 *
 */
@Service
@Transactional
public class AdminService implements IAdminService {
	
	@Autowired
	private IUserDao userDao;

	public IUserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}

	/**
	 * 显示所有用户列表
	 * @author asus1
	 * @return 用户列表
	 */
	@Override
	public List ShowAllUserList()
	{
		System.out.println("userlistService");
		List<User> userList = userDao.findAll();
		return userList;
	}
	
	/**
	 * 禁用用户
	 * @author asus1
	 * @param 用户email
	 * @return 结果
	 */
	@Override
	public String UserBanning(String userEmail) throws Exception {
		
		System.out.println("in banning service");
		userDao.updateUserState(userEmail, "1");
		
		return null;
	}
	
	
}
