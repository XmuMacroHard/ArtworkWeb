package cn.edu.xmu.artwork.service;

import java.util.List;

import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.CustomizationOrder;
import cn.edu.xmu.artwork.entity.Htest;
import cn.edu.xmu.artwork.entity.Payment;
import cn.edu.xmu.artwork.entity.PurchaseOrder;
import cn.edu.xmu.artwork.entity.User;

public interface ICustomizeService {
	public void addCustomization(long user_id, long artist_id ,Commodity commodity);
	public List<CustomizationOrder> showCustomizationsList(long id);
	public List<CustomizationOrder> getCustomizationsByUser(long id);
	public List<CustomizationOrder> getCustomizationsByArtist(long id);
	public boolean accetpCustomization(long id);
	public boolean rejuectCustomization(long id);
	public boolean changeCustomizationArtworkToCommodity(long id);
	//设置订单的付款
	public void setPaymentOfCustomization(long id, List<Payment> payments);

}
