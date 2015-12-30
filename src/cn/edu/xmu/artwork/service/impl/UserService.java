package cn.edu.xmu.artwork.service.impl;

import java.io.File;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.xmu.artwork.constants.IClientConstants;
import cn.edu.xmu.artwork.constants.IResultCode;
import cn.edu.xmu.artwork.constants.IStrings;
import cn.edu.xmu.artwork.dao.IAddressDao;
import cn.edu.xmu.artwork.dao.ICustomizationDao;
import cn.edu.xmu.artwork.constants.ITableConstants;
import cn.edu.xmu.artwork.dao.IUserDao;
import cn.edu.xmu.artwork.dao.impl.CommodityDao;
import cn.edu.xmu.artwork.dao.impl.ArtistDao;
import cn.edu.xmu.artwork.dao.impl.PaymentDao;
import cn.edu.xmu.artwork.dao.impl.PurchaseOrderDao;
import cn.edu.xmu.artwork.dao.impl.UserDao;
import cn.edu.xmu.artwork.entity.Admin;
import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Commodity;

import cn.edu.xmu.artwork.entity.CustomizationOrder;

import cn.edu.xmu.artwork.entity.Editor;

import cn.edu.xmu.artwork.entity.Information;
import cn.edu.xmu.artwork.entity.Payment;
import cn.edu.xmu.artwork.entity.PurchaseOrder;
import cn.edu.xmu.artwork.entity.ShippingAddress;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.IFileService;
import cn.edu.xmu.artwork.service.IUserService;
import cn.edu.xmu.artwork.utils.IMD5Util;
import cn.edu.xmu.artwork.utils.impl.JsonUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

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
	private PaymentDao paymentDao;
	
	@Autowired
	private ICustomizationDao customizationDao;
	
	@Autowired
	private ArtistDao artistDao;
	@Autowired
	private IMD5Util md5Util;
	@Autowired
	private IFileService fileservice;
	
	@Autowired
	private IAddressDao addressDao;
	
	@Autowired
	private JsonUtils jsonUtils;
	
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
	public String register(User user){
		MD5encypt(user);
		user.setBalance((float) 0);
		user.setIsBanned("0");
		
		JSONObject resultJson = new JSONObject();
		if(userDao.findByEmail(user.getEmail()))
		{
			userDao.insert(user);
			setSessionInBrower(IStrings.SESSION_USER, user);
			resultJson.put(IResultCode.RESULT, IResultCode.SUCCESS);
			resultJson.put(IResultCode.MESSAGE, IResultCode.REGISTER_SUCCESS);
		}
		else
		{
			resultJson.put(IResultCode.RESULT, IResultCode.ERROR);
			resultJson.put(IResultCode.MESSAGE, IResultCode.REGISTER_ERROR);
		}

		return resultJson.toString();
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
		else if(resultUser instanceof Admin)
		{
			setSessionInBrower(IStrings.SESSION_USER, resultUser);
			setSessionInBrower(IClientConstants.SESSION_KEY_RANK, IClientConstants.SESSION_VALUE_RANK_ADMIN);
			resultJson.put(IResultCode.RESULT, IResultCode.ADMIN);
			
			System.out.println("in admin");
		}
		else if(resultUser instanceof Editor)
		{
			setSessionInBrower(IStrings.SESSION_USER, resultUser);
			setSessionInBrower(IClientConstants.SESSION_KEY_RANK, IClientConstants.SESSION_VALUE_RANK_EDITOR);
			resultJson.put(IResultCode.RESULT, IResultCode.EDITOR);
			
			System.out.println("in editor");
		}
		else if(resultUser instanceof Artist)
		{
			setSessionInBrower(IStrings.SESSION_USER, resultUser);
			setSessionInBrower(IClientConstants.SESSION_KEY_RANK, IClientConstants.SESSION_VALUE_RANK_ARTIST);
			
			System.out.println("in artist");
			
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
	 * 用户修改密码
	 */
	@Override
	public String alterpassword(User user,String newpassword)
	{
		JSONObject resultJson = new JSONObject();
		User user2=(User)getSessionInBrower(IClientConstants.SESSION_USER);
		MD5encypt(user);
		if(user.getPassword().equals(user2.getPassword()))
		{
			user2.setPassword(newpassword);
			MD5encypt(user2);
			userDao.update(user2);
			resultJson.put(IResultCode.RESULT, IResultCode.SUCCESS);
			resultJson.put(IResultCode.MESSAGE, IResultCode.ALTER_PASSWORD_SUCCESS);
		}
		else
		{
			resultJson.put(IResultCode.RESULT, IResultCode.ERROR);
			resultJson.put(IResultCode.MESSAGE, IResultCode.ALTER_PASSWORD_ERROR);
		}
		return resultJson.toString();
	}
	
	/**
	 * 修改个人信息
	 */
	public String alterinfo(User user,Artist artist)
	{
		String rank=(String)getSessionInBrower(IClientConstants.SESSION_KEY_RANK);
		JSONObject resultJson = new JSONObject();
		if(rank.equals("user")){
			User user2=(User)getSessionInBrower(IClientConstants.SESSION_USER);
			user2.setPhone(user.getPhone());
			userDao.update(user2);
		}else{
			Artist artist2 = (Artist)getSessionInBrower(IClientConstants.SESSION_USER);
			artist2.setPhone(user.getPhone());
			artist2.setIntroduction(artist.getIntroduction());
			artistDao.update(artist2);
		}
		System.out.println("1");
		resultJson.put(IResultCode.RESULT, IResultCode.SUCCESS);
		resultJson.put(IResultCode.MESSAGE, IResultCode.ALTER_PASSWORD_SUCCESS);
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
	
	/**
	 * 获取推荐展示的艺术家，暂时按最新注册的艺术家
	 */
	@Override
	public List<Artist> getRecommendedArtists()
	{
		
		return artistDao.getRecommendedArtists(ITableConstants.RECOMMENDED_ARTIST_NUM);
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
	public JSONArray getArtistFinishedOrder(String state) 
	{
		
		User user = (User)getSessionInBrower(IClientConstants.SESSION_USER);
		System.out.println(user.getId());
		System.out.println(state);
		List<PurchaseOrder> orders = purchaseOrderDao.getAllOrderByArtist(user.getId(), state);	
		
		String[] excludes = {ITableConstants.PURCHASE_ORDER_COMMODITY, ITableConstants.PURCHASE_ORDER_PAYMENTS, ITableConstants.PURCHASE_ORDER_SHIPPING_ADDRESS, ITableConstants.PURCHASE_ORDER_ARTIST, ITableConstants.PURCHASE_ORDER_USER};
		System.out.println(jsonUtils.List2JsonArray(orders, excludes));
		
		return jsonUtils.List2JsonArray(orders, excludes);
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
		List<String> storePath = fileservice.uploadPicture(pic, picFileName);
		artist.setPortrait(storePath.get(0));
		artist.setFileurl(storePath.get(1));
		artist.setIsapprove(ITableConstants.USER_IS_APPROVED_PENDING);
		artistDao.submitArtist(artist);
	}
	
	@Override
	public List<Commodity> showMyCommodity()
	{
		//long id = getSessionInBrower("artwor_user");
		Artist artist= (Artist)getSessionInBrower(IClientConstants.SESSION_USER);
		List<Commodity> commodities = commodityDao.getAllByAuthorId(artist.getId());
		for(Commodity commodity : commodities)
		{
			initializeObject(commodity.getCommodityPices());
		}
		
		return commodities;
	}


	/**
	 * 选择收货地址
	 * @author asus1
	 */
	@Override
	public ShippingAddress SelectAddress(long id) {
		
		ShippingAddress address = new ShippingAddress();
		try {
			address = addressDao.findById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return address;
	}

	/**
	 * 查看个人所有地址列表
	 * @author asus1
	 */
	@Override
	public List<ShippingAddress> ShowAllAddressList() {
		
		User user = (User)getSessionInBrower(IClientConstants.SESSION_USER);
		long userId = user.getId();
		
		List<ShippingAddress> addressList = new ArrayList<ShippingAddress>();
		try {
			addressList = addressDao.findAllByUserId(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return addressList;
	}

	/**
	 * 新增地址
	 * @author asus1
	 */
	@Override
	public void AddNewAddress(ShippingAddress address) {
		try {
			User user = (User)getSessionInBrower(IClientConstants.SESSION_USER);
			address.setUser(user);
			addressDao.insert(address);
			
			List<ShippingAddress> addressList = ShowAllAddressList();
			setAttributeByRequest("addressList", addressList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * 删除地址
	 * @author asus1
	 */
	@Override
	public void DeleteAddress(long id) {
		try {
			addressDao.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void recharge(float balance)
	{
		User user = (User)getSessionInBrower(IClientConstants.SESSION_USER);
		user.setBalance(user.getBalance()+balance);
		userDao.update(user);
		setSessionInBrower(IStrings.SESSION_USER, user);
	}



	
}
