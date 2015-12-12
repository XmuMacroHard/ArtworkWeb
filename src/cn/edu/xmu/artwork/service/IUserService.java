package cn.edu.xmu.artwork.service;

import java.util.List;

import cn.edu.xmu.artwork.entity.Information;
import cn.edu.xmu.artwork.entity.User;

public interface IUserService {
	public void addUser(User user);
	public void register(User user) throws Exception;
	public String login(User user);
}
