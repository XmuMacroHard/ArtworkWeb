package cn.edu.xmu.artwork.dao;

import java.util.List;

import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.User;

public interface IUserDao {
	public void insert(User user);
	public User search(User user);
	public List findAll();
	public User findById(long id);
	
	/**
	 * 更新用户状态
	 * @author asus1
	 * @param userEmail
	 * @param state
	 */
	public void updateUserState(String userEmail, String state);
}
