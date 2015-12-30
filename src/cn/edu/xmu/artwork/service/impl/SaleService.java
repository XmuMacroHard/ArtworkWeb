package cn.edu.xmu.artwork.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.persistence.Id;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.catalina.connector.Response;
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
import cn.edu.xmu.artwork.dao.IPaymentDao;
import cn.edu.xmu.artwork.dao.IPurchaseOrderDao;
import cn.edu.xmu.artwork.dao.IShoppingCartDao;
import cn.edu.xmu.artwork.dao.impl.ArtistDao;
import cn.edu.xmu.artwork.dao.impl.ShoppingCartDao;
import cn.edu.xmu.artwork.dao.impl.UserDao;
import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.Payment;
import cn.edu.xmu.artwork.entity.PurchaseOrder;
import cn.edu.xmu.artwork.entity.ShippingAddress;
import cn.edu.xmu.artwork.entity.ShoppingCart;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.ISaleService;
import cn.edu.xmu.artwork.utils.IJsonUtils;
import cn.edu.xmu.artwork.utils.IOrderUtils;
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
	IPaymentDao paymentDao;
	
	@Autowired
	IAddressDao addressDao;
	
	@Autowired
	IJsonUtils jsonUtils;
	@Autowired
	IOrderUtils orderUtils;
	
	@Autowired
	private UserDao userDao;
	@Autowired
	private ArtistDao artistDao;
	
	/**
	 * 按照商品类型获取所有商品
	 */
	@Override
	public JSONArray getCommodityListByType(String commoType)
	{
		List<Commodity> commodities = commodityDao.getCommodityListByType(commoType);
		System.out.println(commodities.size());
		
		for(Commodity commodity : commodities)
		{
			initializeObject(commodity.getCommodityPices());
		}
		String[] excludes = {"purchaseOrder"};
		return jsonUtils.List2JsonArray(commodities, excludes);
		
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
	
	public void deleteCommodityById(long id)
	{
		commodityDao.deleteCommodity(id);
	}
	
	public String altercommodity(long id,Commodity commodity)
	{
		JSONObject resultJson = new JSONObject();
		Commodity commodity2=commodityDao.getCommodityById(id);
		commodity2.setName(commodity.getName());
		commodity2.setType(commodity.getType());
		commodity2.setPrice(commodity.getPrice());
		commodity2.setIntroduction(commodity.getIntroduction());
		
		resultJson.put(IResultCode.RESULT, IResultCode.SUCCESS);
		resultJson.put(IResultCode.MESSAGE, IResultCode.ALTER_PASSWORD_SUCCESS);
		return resultJson.toString();
	}
	
	public void uploadCommodity(Commodity commodity, List<String> picPaths)
	{
		Artist artist= (Artist)getSessionInBrower(IClientConstants.SESSION_USER);
		commodity.addPictures(picPaths);
		commodity.setAuthorId(artist.getId());
		commodity.setIsBought(false);
		commodity.setCategory("sale");
		commodity.setStatus(ITableConstants.COMMODITY_IS_NOBAN);
		
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
	
	public void deleteFromCart(Commodity commodity)
	{
		User user = (User)getSessionInBrower(IStrings.SESSION_USER);
		shoppingCartDao.delete(commodity.getId(), user.getId());
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
	
	/**
	 * 用户提交订单
	 */
	public void SubmitsaleOrder(List<Long> commodityid,ShippingAddress shippingAddress)
	{
		User user = (User)getSessionInBrower(IStrings.SESSION_USER);
		List<Boolean> isadd = new ArrayList<Boolean>();//判断商品列表中的商品是否加入订单
		for(int i=0;i<commodityid.size();i++)
			isadd.add(false);
		
		float allprice=0;
		List<Long> purchaseOrderId=new ArrayList<Long>();
		for(int i=0;i<commodityid.size();i++)
		{
			while(i<commodityid.size()&&isadd.get(i))
				i++;
			if(i==commodityid.size())
				break;
			PurchaseOrder purchaseOrder=new PurchaseOrder();
			purchaseOrder.setUser(user);
			purchaseOrder.setOrderid(orderUtils.getordernum(user));
			purchaseOrder.setState("0");
			purchaseOrder.setDate(new Date());
			try {
				purchaseOrder.setAddress(orderUtils.changeaddress(addressDao.findById(shippingAddress.getId())));
			} catch (Exception e) {e.printStackTrace();}
			
			Commodity commodity=commodityDao.getCommodityById(commodityid.get(i));//查找第一个未添加进订单的商品信息
			purchaseOrder.getCommodity().add(commodity);
			commodity.setPurchaseOrder(purchaseOrder);
			float totalprice=commodity.getPrice();
			long artistid=commodity.getAuthorId();
			purchaseOrder.setArtist(artistDao.findById(artistid));
			isadd.set(i, true);
			for(int j=i+1;j<commodityid.size();j++)
			{
				long id=commodityid.get(j);
				Commodity commodity2=commodityDao.getCommodityById(id);
				if(commodity2.getAuthorId()==artistid)
				{
					purchaseOrder.getCommodity().add(commodity2);
					commodity2.setPurchaseOrder(purchaseOrder);
					totalprice+=commodity2.getPrice();
					isadd.set(j, true);
				}
			}
			purchaseOrder.setTotalprice(totalprice);
			purchaseOrder.setLeftprice(totalprice);
			allprice+=totalprice;
			
			Payment payment=new Payment();
			payment.setMoney(totalprice);
			payment.setState(0);
			long currentTime = System.currentTimeMillis() + 30 * 60 * 1000;
			Date date = new Date(currentTime);
			payment.setDate(date);
			payment.setPurchaseOrder(purchaseOrder);
			
			purchaseOrder.getPayments().add(payment);
			purchaseOrderDao.savePurchaseOrder(purchaseOrder);
			purchaseOrderId.add(purchaseOrder.getId());
		}
		
		for(int i=0;i<commodityid.size();i++)
		{
			shoppingCartDao.delete(commodityid.get(i), user.getId());
		}
		
		setAttributeByRequest("totalprice", allprice);
		setAttributeByRequest("purchaseOrderId", purchaseOrderId);

	}
	
	public PurchaseOrder getPurchaseOrderByid(long id)
	{
		PurchaseOrder order = purchaseOrderDao.findById(id);	
		
		return order;
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
	

	@Override
	public boolean payPurchaseOrder(long id) {
		try{
			PurchaseOrder purchaseOrder = purchaseOrderDao.findById(id);
			User user = purchaseOrder.getUser();
			List<Payment> payments = paymentDao.getUnPaidPaymentsByArtistId(purchaseOrder.getId());
			
			for(Payment p : payments)
			{
				System.out.println("id: " + p.getId() + " Date: " + p.getDate());
			}
			
			Payment payment = payments.get(0);
			user.setBalance(user.getBalance() - payment.getMoney());
			payment.setState(1);
			purchaseOrder.setLeftprice(purchaseOrder.getLeftprice() - payment.getMoney());
			
			//订单支付完成
			if(purchaseOrder.getLeftprice() == 0)
			{
				purchaseOrder.setState("1");
				List<Commodity> commodities = commodityDao.getCommodityByOrderId(purchaseOrder.getId());
				for(Commodity commodity:commodities)
					commodity.setIsBought(true);
			}
			user.setBalance(user.getBalance()*100/100);
			setSessionInBrower(IStrings.SESSION_USER, user);
			setAttributeByRequest("purchaseOrder.id", id);
			return true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
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
		List<PurchaseOrder> orders = purchaseOrderDao.getPurchaseOrderByState(identification, user.getId(), state);	
				
		String[] excludes = {ITableConstants.PURCHASE_ORDER_COMMODITY, ITableConstants.PURCHASE_ORDER_PAYMENTS, ITableConstants.PURCHASE_ORDER_SHIPPING_ADDRESS, ITableConstants.PURCHASE_ORDER_ARTIST, ITableConstants.PURCHASE_ORDER_USER};
		System.out.println(jsonUtils.List2JsonArray(orders, excludes));
		
		return jsonUtils.List2JsonArray(orders, excludes);
	}


	@Override
	public boolean payToArtistByPurchaseOrder(long id) {
		// TODO Auto-generated method stub
		return false;
	}
	
	@Override
	public void getDetailPurchaseOrder(PurchaseOrder purchaseOrder)
	{
		Long id = purchaseOrder.getId();
		purchaseOrder = purchaseOrderDao.findById(id);
		
		for(Commodity commodity : purchaseOrder.getCommodity())
		{
			initializeObject(commodity.getCommodityPices());
		}		
		
		initializeObject(purchaseOrder.getPayments());
		initializeObject(purchaseOrder.getArtist());
		initializeObject(purchaseOrder.getUser());
		
		setAttributeByRequest("purchaseOrder", purchaseOrder);
		String addresString[] = purchaseOrder.getAddress().split("<>");
		setAttributeByRequest("addressdetail", addresString[0]);
		if(addresString.length>1)
			setAttributeByRequest("addresspeople", addresString[1]);
		else 
			setAttributeByRequest("addresspeople", "");
		if(addresString.length>2)
			setAttributeByRequest("addressphone", addresString[2]);
		else 
			setAttributeByRequest("addressphone", "");
	}
	
	/**
	 * 用户确认收货
	 */
	@Override
	public void  confirmCommodity(PurchaseOrder purchaseOrder)
	{
		long id = purchaseOrder.getId();
		purchaseOrder = purchaseOrderDao.findById(id);
		purchaseOrder.setState(ITableConstants.PURCHASE_ORDER_STATUS_FINISH);
		
		//钱添加到艺术家账户
		Artist artist=purchaseOrder.getArtist();
		artist.setBalance(purchaseOrder.getTotalprice()+artist.getBalance());
	}
	
	/**
	 * 艺术家发货
	 * @param purchaseOrder
	 */
	@Override
	public void dispatch(PurchaseOrder purchaseOrder)
	{
		PurchaseOrder order = purchaseOrderDao.findById(purchaseOrder.getId());
		order.setState(ITableConstants.PURCHASE_ORDER_STATUS_MAKE_SURE);		
	}
}
