package cn.edu.xmu.artwork.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.xmu.artwork.dao.ICommodityDao;
import cn.edu.xmu.artwork.dao.IShoppingCartDao;
import cn.edu.xmu.artwork.dao.impl.ShoppingCartDao;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.ShoppingCart;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.ISaleService;

@Service
public class SaleService implements ISaleService 
{
	@Autowired
	ICommodityDao commodityDao;
	
	@Autowired
	IShoppingCartDao shoppingCartDao;
	
	public List<Commodity> getCommodityListByType(String commoType)
	{
		return commodityDao.getCommodityListByType(commoType);
	}
	
	public Commodity getCommodityById(long commodityId)
	{
		return commodityDao.getCommodityById(commodityId);
	}
	
	public void uploadCommodity(Commodity commodity, List<String> picPaths)
	{
		commodity.addPictures(picPaths);
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
