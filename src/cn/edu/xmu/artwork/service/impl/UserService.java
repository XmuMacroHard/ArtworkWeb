package cn.edu.xmu.artwork.service.impl;

import java.io.File;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.xmu.artwork.constants.IClientConstants;
import cn.edu.xmu.artwork.constants.IResultCode;
import cn.edu.xmu.artwork.constants.IStrings;
import cn.edu.xmu.artwork.constants.ITableConstants;
import cn.edu.xmu.artwork.dao.IUserDao;
import cn.edu.xmu.artwork.dao.impl.CommodityDao;
import cn.edu.xmu.artwork.dao.impl.ArtistDao;
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
		else if(resultUser instanceof Artist)
		{
			setSessionInBrower(IStrings.SESSION_USER, resultUser);
			setSessionInBrower(IClientConstants.SESSION_KEY_RANK, IClientConstants.SESSION_VALUE_RANK_ARTIST);
			resultJson.put(IResultCode.RESULT, IResultCode.SUCCESS);
		}
		else if(resultUser instanceof User)
		{
			setSessionInBrower(IStrings.SESSION_USER, resultUser);
			setSessionInBrower(IClientConstants.SESSION_KEY_RANK, IClientConstants.SESSION_VALUE_RANK_USER);
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
		List<Artist> artists = artistDao.getArtistBySort(identification);			
		return artists;
	}
	/**
	 * 获得列表显示的部分用户的简略信息
	 * @param identification
	 * @return
	 */
	@Override
	public JSONArray getBriefArtistBySort(String identification)
	{
		List<Artist> artists = getArtistBySort(identification);
		
		JSONArray resultJsonArray = new JSONArray();
		for(Artist artist : artists)
		{
			JSONObject jo = new JSONObject();
			jo.put(ITableConstants.ARTIST_ID, artist.getId());
			jo.put(ITableConstants.ARTIST_PORTRAIT, artist.getPortrait());
			jo.put(ITableConstants.ARTIST_REAL_NAME, artist.getRealName());
			jo.put(ITableConstants.ARTIST_INTRODUCTION, artist.getIntroduction());
			resultJsonArray.add(jo);
		}
		
		return resultJsonArray;
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
		User user = (User)getSessionInBrower(IClientConstants.SESSION_USER);
		artist.setId(user.getId());
/*		System.out.println(user.getId());
		System.out.println(artist.getIdentification());*/
		List<String> storePath = fileservice.uploadPicture(pic, picFileName);
		artist.setPortrait(storePath.get(0));
		artist.setFileurl(storePath.get(1));
		artistDao.submitArtist(artist);
	}
	
	@Override
	public List<Commodity> showMyCommodity()
	{
		//long id = getSessionInBrower("artwor_user");
		List<Commodity> commodities = commodityDao.getAllByAuthorId((long)1);
		for(Commodity commodity : commodities)
		{
			initializeObject(commodity.getCommodityPices());
		}
		
		return commodities;
	}
	
}
