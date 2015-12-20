package cn.edu.xmu.artwork.service.impl;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.struts2.json.JSONUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	public void addToCart(Commodity commodity, User buyer)
	{
		ShoppingCart shoppingCart = new ShoppingCart(buyer, commodity);
		shoppingCartDao.save(shoppingCart);
	}
	
	public List<ShoppingCart> getShoppingCart(long userId)
	{
		return shoppingCartDao.getAllByUserId(userId);
	}
}
