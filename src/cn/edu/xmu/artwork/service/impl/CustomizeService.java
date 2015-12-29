package cn.edu.xmu.artwork.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.websocket.Session;

import net.sf.json.JSONArray;

import org.apache.struts2.json.JSONUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.xmu.artwork.constants.IClientConstants;
import cn.edu.xmu.artwork.constants.IStrings;
import cn.edu.xmu.artwork.constants.ITableConstants;
import cn.edu.xmu.artwork.dao.IAddressDao;
import cn.edu.xmu.artwork.dao.IArtistDao;
import cn.edu.xmu.artwork.dao.ICommodityDao;
import cn.edu.xmu.artwork.dao.ICustomizationDao;
import cn.edu.xmu.artwork.dao.IUserDao;
import cn.edu.xmu.artwork.dao.impl.HTestDao;
import cn.edu.xmu.artwork.dao.impl.UserDao;
import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.CustomizationOrder;
import cn.edu.xmu.artwork.entity.Htest;
import cn.edu.xmu.artwork.entity.Payment;
import cn.edu.xmu.artwork.entity.PurchaseOrder;
import cn.edu.xmu.artwork.entity.ShippingAddress;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.ICustomizeService;
import cn.edu.xmu.artwork.utils.impl.JsonUtils;

@Transactional
@Service
public class CustomizeService extends BasicService implements ICustomizeService{
	@Autowired
	private ICustomizationDao customizationDao;
	@Autowired
	private IUserDao userDao;
	@Autowired
	private IArtistDao artistDao;
	@Autowired
	private ICommodityDao commodityDao;
	@Autowired
	private IAddressDao addressDao;
	
	@Autowired
	private JsonUtils jsonUtils;
	
	@Override

	public void addCustomization(long artist_id, ShippingAddress address ,Commodity commodity) 
	{
		long user_id = 1;
		
		User user = new User();
		user.setId(user_id);
		Artist artist = new Artist();
		artist.setId(artist_id);
		
		CustomizationOrder customizationOrder = new CustomizationOrder();
		
		commodity.setCategory("customization");//设置商品为定制品
		commodity.setPurchaseOrder(customizationOrder);
		commodity.setAuthorId(artist_id);
		
		customizationOrder.setTotalprice(commodity.getPrice());
		customizationOrder.setLeftprice(commodity.getPrice());
		customizationOrder.setUser(user);
		customizationOrder.setArtist(artist);
		customizationOrder.getCommodity().add(commodity);
		
		//customization.setOrderid(getordernum(user));	
		//这里需要修改！！！！！
		//！！！！
		//！！！！！
		customizationOrder.setOrderid("1234");
		customizationOrder.setState("0");
		customizationOrder.setDate(new Date());
		
		customizationDao.save(customizationOrder);
	}

	@Override
	public List<CustomizationOrder> showCustomizationsList(long id) {
	
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<CustomizationOrder> getCustomizationsByUser(long id) {
		return customizationDao.getCustomizationsByUser(id);
	}

	
	/**
	 * 发起一个定制
	 * @param artist
	 * @param user
	 * @param address
	 */
	public void placeCustomization(Artist artist)
	{		
		try {
			User user = (User)getSessionInBrower(IClientConstants.SESSION_USER);
			List<ShippingAddress> shippingAddresses = addressDao.findAllByUserId(user.getId());
			
						
			setAttributeByRequest("addressList", shippingAddresses);
			setAttributeByRequest("artist", artist);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	
	public String getordernum(User user)
	{
		SimpleDateFormat df = new SimpleDateFormat("yyMMddHHmmss");//设置日期格式
		String number=df.format(new Date())+String.format("%02d",user.getId()%100);
		Random random=new Random();
		number=number+String.format("%04d",random.nextInt(10000));
		return number;
	}
	
	@Override
	public boolean accetpCustomization(long id) {
		try {
			CustomizationOrder customization = customizationDao.findById(id);
			customization.setAcceptState(IStrings.Customization_State_Accept);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public boolean rejuectCustomization(long id) {
		try {
			CustomizationOrder customization = customizationDao.findById(id);
			customization.setAcceptState(IStrings.Customization_State_Reject);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean changeCustomizationArtworkToCommodity(long id) {
		try {
			Commodity commodity = commodityDao.getCommodityByOrderId(id).get(0);
			commodity.setCategory("common");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public void setPaymentOfCustomization(long id, List<Float> moneys, List<Date> dates) 
	{
		List<Payment> payments = new ArrayList<Payment>();
		for(int i = 0; i < moneys.size(); i++)
		{
			Payment payment = new Payment();
			payment.setMoney(moneys.get(i));
			payment.setDate(dates.get(i));
			payments.add(payment);
		}
		
		CustomizationOrder customizationOrder  = customizationDao.findById(id);	
		for(Payment payment: payments)
			{
				payment.setPurchaseOrder(customizationOrder);
				customizationOrder.getPayments().add(payment);
			}
		customizationOrder.setState(ITableConstants.PURCHASE_ORDER_STATUS_PAID);
	}
	
	/**
	 * 根据当前identification（艺术家或用户或管理员） 和 需要的订单状态获取订单
	 * @param identification
	 * @param state
	 * @return
	 */
	@Override
	public JSONArray getAllOrderByState(String identification,String state) 
	{
		User user = (User)getSessionInBrower(IClientConstants.SESSION_USER);
		System.out.println(user.getId());
		System.out.println(state);
		System.out.println(identification);
		List<CustomizationOrder> orders = customizationDao.getCusOrderByState(identification, user.getId(), state);	
				
		String[] excludes = {ITableConstants.PURCHASE_ORDER_COMMODITY, ITableConstants.PURCHASE_ORDER_PAYMENTS, ITableConstants.PURCHASE_ORDER_SHIPPING_ADDRESS, ITableConstants.PURCHASE_ORDER_ARTIST, ITableConstants.PURCHASE_ORDER_USER};
		System.out.println(jsonUtils.List2JsonArray(orders, excludes));
		
		return jsonUtils.List2JsonArray(orders, excludes);
	}
}
