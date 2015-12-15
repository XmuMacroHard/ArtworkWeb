package cn.edu.xmu.artwork.service;

import java.util.List;

import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.ShoppingCart;
import cn.edu.xmu.artwork.entity.User;


public interface ISaleService {
	List<Commodity> getCommodityListByType(String commoType);
	Commodity getCommodityById(long commodityId);
	void uploadCommodity(Commodity commodity, List<String> picPaths);
	void addToCart(Commodity commodity, User buyer);
	List<ShoppingCart> getShoppingCart(long userId);
}
