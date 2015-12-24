package cn.edu.xmu.artwork.service.impl;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.struts2.json.JSONUtil;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.xmu.artwork.constants.IResultCode;
import cn.edu.xmu.artwork.constants.IStrings;
import cn.edu.xmu.artwork.dao.ICommodityDao;
import cn.edu.xmu.artwork.dao.IShoppingCartDao;
import cn.edu.xmu.artwork.dao.impl.ShoppingCartDao;
import cn.edu.xmu.artwork.entity.Commodity;
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
	IJsonUtils jsonUtils;
	
/*	public List<Commodity> getCommodityListByType(String commoType)
	{
		return commodityDao.getCommodityListByType(commoType);
	}*/
	
	/**
	 * 按照商品类型获取所有商品
	 */
	public JSONArray getCommodityListByType(String commoType)
	{
		List<Commodity> commodities = commodityDao.getCommodityListByType(commoType);

		for(Commodity commodity : commodities)
		{
			initializeObject(commodity.getCommodityPices());
		}		
		
		return jsonUtils.List2JsonArray(commodities);
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
}
