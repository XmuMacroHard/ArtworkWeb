package cn.edu.xmu.artwork.dao;

import java.util.List;

import cn.edu.xmu.artwork.entity.User;

public interface IUserDao {
	public void insert(User user);
	public User search(User user);
	public List findAll();
	public User findById(long id);
}