package cn.edu.xmu.artwork.service;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.PurchaseOrder;
import cn.edu.xmu.artwork.entity.ShippingAddress;
import cn.edu.xmu.artwork.entity.ShoppingCart;
import cn.edu.xmu.artwork.entity.User;


public interface ISaleService {
	public JSONArray getCommodityListByType(String commoType);
	List<ShoppingCart> getShoppingCart();
	public Commodity getCommodityById(long commodityId);
	public void uploadCommodity(Commodity commodity, List<String> picPaths);
	public JSONObject addToCart(Commodity commodity, User buyer);
	public void SubmitsaleOrder(User user,List<Long> commodityid,ShippingAddress shippingAddress);
	public PurchaseOrder getPurchaseOrderByid(long id);
	public boolean payment(long id);
	public List<Commodity> getRecommendedCommodity();
	public void placeOrder(List<Long> commodityids);
}
