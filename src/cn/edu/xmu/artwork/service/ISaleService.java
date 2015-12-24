package cn.edu.xmu.artwork.service;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.ShoppingCart;
import cn.edu.xmu.artwork.entity.User;


public interface ISaleService {
	//List<Commodity> getCommodityListByType(String commoType);
	public JSONArray getCommodityListByType(String commoType);
	Commodity getCommodityById(long commodityId);
	void uploadCommodity(Commodity commodity, List<String> picPaths);
	JSONObject addToCart(Commodity commodity, User buyer);
	List<ShoppingCart> getShoppingCart();
}
