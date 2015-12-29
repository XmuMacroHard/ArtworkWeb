package cn.edu.xmu.artwork.service;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.Payment;
import cn.edu.xmu.artwork.entity.PurchaseOrder;
import cn.edu.xmu.artwork.entity.ShippingAddress;
import cn.edu.xmu.artwork.entity.ShoppingCart;
import cn.edu.xmu.artwork.entity.User;


public interface ISaleService {
	//List<Commodity> getCommodityListByType(String commoType);
	//public JSONArray getCommodityListByType(String commoType,int page);
	public List<ShoppingCart> getShoppingCart();
	public JSONArray getCommodityListByType(String commoType);
	public Commodity getCommodityById(long commodityId);
	public void uploadCommodity(Commodity commodity, List<String> picPaths);
	public JSONObject addToCart(Commodity commodity, User buyer);
	public void deleteFromCart(Commodity commodity);
	public void SubmitsaleOrder(List<Long> commodityid,ShippingAddress shippingAddress);
	public PurchaseOrder getPurchaseOrderByid(long id);
	public List<Commodity> getRecommendedCommodity();
	public void placeOrder(List<Long> commodityids);
	//按订单付款
	public boolean payPurchaseOrder(long id);
	//按订单给款艺术家
	public boolean payToArtistByPurchaseOrder(long id);
	public JSONArray getAllOrderByState(String identification,String state);
	public void getDetailPurchaseOrder(PurchaseOrder purchaseOrder);
	public void dispatch(PurchaseOrder purchaseOrder);
}
