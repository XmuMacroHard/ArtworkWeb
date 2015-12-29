package cn.edu.xmu.artwork.dao;

import java.util.List;

import cn.edu.xmu.artwork.entity.PurchaseOrder;

public interface IPurchaseOrderDao {
	public void savePurchaseOrder(PurchaseOrder purchaseOrder);
	public PurchaseOrder findById(long id);
	public void update(PurchaseOrder purchaseOrder);
	public List<PurchaseOrder> getPurchaseOrderByState(String identification, long id, String state);
	public List<PurchaseOrder> getAllOrderByArtist(long id, String state);
}
