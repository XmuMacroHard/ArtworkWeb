package cn.edu.xmu.artwork.service.impl;

import java.io.File;
import java.util.List;

import net.sf.json.JSONObject;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.xmu.artwork.constants.IResultCode;
import cn.edu.xmu.artwork.constants.IStrings;
import cn.edu.xmu.artwork.dao.IUserDao;
import cn.edu.xmu.artwork.dao.impl.CommodityDao;
import cn.edu.xmu.artwork.dao.impl.ArtistDao;
import cn.edu.xmu.artwork.dao.impl.PurchaseOrderDao;
import cn.edu.xmu.artwork.dao.impl.UserDao;
import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Commodity;
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
public class UserService extends BasicService implements IUserService
{
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private CommodityDao commodityDao;
	
	@Autowired
	PurchaseOrderDao purchaseOrderDao;
	
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
		user.setBalance((float) 0);
		user.setIsBanned("0");
		userDao.insert(user);
		setSessionInBrower(IStrings.SESSION_USER, user);
	}

	@Override
	public String login(User user) {
		MD5encypt(user);
		User resultUser = userDao.search(user);		
		
		JSONObject resultJson = new JSONObject();
		if(resultUser == null)
		{
			resultJson.put(IResultCode.RESULT, IResultCode.ERROR);
			resultJson.put(IResultCode.MESSAGE, IResultCode.LOGIN_ERROR_MESSAGE);
		}
		else
		{
			setSessionInBrower(IStrings.SESSION_USER, resultUser);
			resultJson.put(IResultCode.RESULT, IResultCode.SUCCESS);
		}
		return resultJson.toString();
	}
	
	/**
	 * 用户登出
	 * 
	 */
	@Override
	public void logout()
	{
		removeSessionInBrower(IStrings.SESSION_USER);
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
	
	@Override
	public List<Commodity> showMyCommodity()
	{
		//long id = getSessionInBrower("artwor_user");
		List<Commodity> commodities = commodityDao.getAllByAuthorId((long)1);
		initializeObject(commodities);
		return commodities;
	}
	
	@Override
	public void recharge(float balance)
	{
		User user=userDao.findById(1L);
		user.setBalance(user.getBalance()-balance);
		userDao.update(user);
	}
}
