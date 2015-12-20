package cn.edu.xmu.artwork.service.impl;

import java.io.File;
import java.util.List;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.xmu.artwork.dao.IUserDao;
import cn.edu.xmu.artwork.dao.impl.ArtistDao;
import cn.edu.xmu.artwork.dao.impl.UserDao;
import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Information;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.IFileService;
import cn.edu.xmu.artwork.service.IUserService;
import cn.edu.xmu.artwork.utils.IMD5Util;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;

@Transactional
@Service
public class UserService implements IUserService
{
	@Autowired
	private UserDao userDao;
	@Autowired
	private ArtistDao artistDao;
	@Autowired
	private IMD5Util md5Util;
	@Autowired
	private IFileService fileservice;
	
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
		System.out.println("in serverice register");
		MD5encypt(user);
		userDao.insert(user);
		ActionContext.getContext().getSession().put("user", user);
	}

	@Override
	public User login(User user) {
		MD5encypt(user);
		User resultUser = userDao.search(user);
		return resultUser;
	}
	
	@Override
	public List<Artist> getArtistList()
	{
		return artistDao.getArtistList();
	}
	
	@Override
	public Artist getArtist(long id)
	{
		return artistDao.getArtist(id);
	}
	
	@Override
	public List<Artist> getArtistBySort(String identification)
	{
		return artistDao.getArtistBySort(identification);
	}
	
	@Override
	public List<Artist> getArtistByName(String name)
	{
		return artistDao.getArtistByName(name);
	}
	
	private void MD5encypt(User user)
	{
		user.setPassword(md5Util.MD5(user.getPassword()));
	}
	@Override
	public void submitArtist(Artist artist,List<File> pic,List<String> picFileName)
	{
		fileservice.uploadPicture(pic, picFileName);
		artist.setPortrait(picFileName.get(0));
		artist.setFileurl(picFileName.get(1));
		artistDao.submitArtist(artist);
	}
}
