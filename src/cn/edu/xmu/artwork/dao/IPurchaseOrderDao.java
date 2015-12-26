package cn.edu.xmu.artwork.dao;

import cn.edu.xmu.artwork.entity.PurchaseOrder;

public interface IPurchaseOrderDao {
	public void savePurchaseOrder(PurchaseOrder purchaseOrder);
	public PurchaseOrder findById(long id);
	public void update(PurchaseOrder purchaseOrder);
}
