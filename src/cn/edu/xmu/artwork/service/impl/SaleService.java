package cn.edu.xmu.artwork.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.struts2.json.JSONUtil;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.xmu.artwork.constants.IClientConstants;
import cn.edu.xmu.artwork.constants.IResultCode;
import cn.edu.xmu.artwork.constants.IStrings;
import cn.edu.xmu.artwork.constants.ITableConstants;
import cn.edu.xmu.artwork.dao.IAddressDao;
import cn.edu.xmu.artwork.dao.ICommodityDao;
import cn.edu.xmu.artwork.dao.IPurchaseOrderDao;
import cn.edu.xmu.artwork.dao.IShoppingCartDao;
import cn.edu.xmu.artwork.dao.impl.ShoppingCartDao;
import cn.edu.xmu.artwork.dao.impl.UserDao;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.PurchaseOrder;
import cn.edu.xmu.artwork.entity.ShippingAddress;
import cn.edu.xmu.artwork.entity.ShoppingCart;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.ISaleService;
import cn.edu.xmu.artwork.utils.IJsonUtils;
import cn.edu.xmu.artwork.utils.impl.JsonUtils;

@Service
@Transactional
public class SaleService extends BasicService implements ISaleService 
{
	@Autowired
	ICommodityDao commodityDao;
	
	@Autowired
	IShoppingCartDao shoppingCartDao;
	
	@Autowired
	IPurchaseOrderDao purchaseOrderDao;
	
	@Autowired
	IAddressDao addressDao;
	
	@Autowired
	IJsonUtils jsonUtils;
	
	@Autowired
	private UserDao userDao;
	
	/**
	 * 按照商品类型获取所有商品
	 */
	@Override
	public JSONArray getCommodityListByType(String commoType)
	{
		List<Commodity> commodities = commodityDao.getCommodityListByType(commoType);

		for(Commodity commodity : commodities)
		{
			initializeObject(commodity.getCommodityPices());
		}		
		
		return jsonUtils.List2JsonArray(commodities);
	}
	
	@Override
	public List<Commodity> getRecommendedCommodity()
	{
		List<Commodity> commodities = commodityDao.getRecommendedCommodities(ITableConstants.RECOMMENDED_COMMODITY_NUM);
		for(Commodity commodity : commodities)
		{
			initializeObject(commodity.getCommodityPices());
		}	
		return commodities;
	}
	
	public Commodity getCommodityById(long commodityId)
	{
		Commodity commodity = commodityDao.getCommodityById(commodityId);
		
		initializeObject(commodity.getCommodityPices());
		return commodity;
	}
	
	public void uploadCommodity(Commodity commodity, List<String> picPaths)
	{
		commodity.addPictures(picPaths);
		commodity.setAuthorId((long)1);
		commodity.setIsBought(false);
		commodityDao.saveCommodity(commodity);
	}
	
	public JSONObject addToCart(Commodity commodity, User buyer)
	{
		JSONObject resultJO = new JSONObject(); 
		ShoppingCart shoppingCart = new ShoppingCart(buyer, commodity);
		if(!shoppingCartDao.isExisted(buyer.getId(), commodity.getId()))
		{
			shoppingCartDao.save(shoppingCart);
			resultJO.put(IResultCode.RESULT, IResultCode.SUCCESS);
			resultJO.put(IResultCode.MESSAGE, IResultCode.SHOPPINGCART_SUCCESS_MESSAGE);
			return resultJO;
		}
		else
		{
			resultJO.put(IResultCode.RESULT, IResultCode.ERROR);
			resultJO.put(IResultCode.MESSAGE, IResultCode.SHOPPINGCART_ERROR_MESSAGE);
			return resultJO;			
		}
	}
	
	public List<ShoppingCart> getShoppingCart()
	{
		User user = (User)getSessionInBrower(IStrings.SESSION_USER);
		
		List<ShoppingCart> list = shoppingCartDao.getAllByUserId(user.getId()); 
		for(ShoppingCart shoppingCart : list)
		{
			initializeObject(shoppingCart.getCommodity());
			initializeObject(shoppingCart.getCommodity().getCommodityPices());
		}
		
		return list;
	}
	
	public void SubmitsaleOrder(User user,List<Long> commodityid,ShippingAddress shippingAddress)
	{
		PurchaseOrder purchaseOrder=new PurchaseOrder();
		purchaseOrder.setUser(user);
		purchaseOrder.setOrderid(getordernum(user));	
		purchaseOrder.setState("0");
		purchaseOrder.setType("sale");
		purchaseOrder.setDate(new Date());
		purchaseOrder.setShippingAddress(shippingAddress);
		
		float totalprice=0;
		for(Long id:commodityid)
		{
			Commodity commodity=commodityDao.getCommodityById(id);
			purchaseOrder.getCommodity().add(commodity);
			commodity.setPurchaseOrder_id(purchaseOrder);
			totalprice+=commodity.getPrice();
		}
		purchaseOrder.setTotalprice(totalprice);
		purchaseOrderDao.savePurchaseOrder(purchaseOrder);
	}
	
	public String getordernum(User user)
	{
		SimpleDateFormat df = new SimpleDateFormat("yyMMddHHmmss");//设置日期格式
		String number=df.format(new Date())+String.format("%02d",user.getId()%100);
		Random random=new Random();
		number=number+String.format("%04d",random.nextInt(10000));
		return number;
	}
	
	public PurchaseOrder getPurchaseOrderByid(long id)
	{
		return purchaseOrderDao.getPurchaseOrderByid(id);
	}
	
	public boolean payment(long id)
	{
		PurchaseOrder purchaseOrder=purchaseOrderDao.getPurchaseOrderByid(id);
		User user = userDao.findById(1L);
		if(user.getBalance()<purchaseOrder.getTotalprice())
			return false;
		else
		{
			user.setBalance(user.getBalance()-purchaseOrder.getTotalprice());
			userDao.update(user);
			
			purchaseOrder.setState("1");
			purchaseOrderDao.update(purchaseOrder);
			return true;
		}
	}

	/**
	 * 用户发起一个订单
	 * @param commodityids 所有订单商品的id
	 */
	public void placeOrder(List<Long> commodityids)
	{
		User user = (User)getSessionInBrower(IClientConstants.SESSION_USER);
		long userid = user.getId();
		
		try {
			
		List<ShippingAddress> shippingAddresses = addressDao.findAllByUserId(userid);
		List<Commodity> commodities = new ArrayList<Commodity>();
		
		for(Long id : commodityids)
		{
			Commodity commodity = commodityDao.getCommodityById(id);
			initializeObject(commodity.getCommodityPices());
			commodities.add(commodity);
		}
		
		setAttributeByRequest("addressList", shippingAddresses);
		setAttributeByRequest("commodityList", commodities);
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
}
