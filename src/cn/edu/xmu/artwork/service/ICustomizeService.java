package cn.edu.xmu.artwork.service;

import java.util.List;

import net.sf.json.JSONArray;
import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.CustomizationOrder;
import cn.edu.xmu.artwork.entity.Htest;
import cn.edu.xmu.artwork.entity.Payment;
import cn.edu.xmu.artwork.entity.PurchaseOrder;
import cn.edu.xmu.artwork.entity.ShippingAddress;
import cn.edu.xmu.artwork.entity.User;

public interface ICustomizeService {
	public void addCustomization(long artist_id,ShippingAddress address ,Commodity commodity);
	public List<CustomizationOrder> showCustomizationsList(long id);
	public List<CustomizationOrder> getCustomizationsByUser(long id);
	public boolean accetpCustomization(long id);
	public boolean rejuectCustomization(long id);
	public boolean changeCustomizationArtworkToCommodity(long id);
	//设置订单的付款
	public void setPaymentOfCustomization(long id, List<Payment> payments);
	public void placeCustomization(Artist artist);
	public JSONArray getAllOrderByState(String identification,String state);

}
