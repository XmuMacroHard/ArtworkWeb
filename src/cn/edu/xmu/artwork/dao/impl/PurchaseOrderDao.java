package cn.edu.xmu.artwork.dao.impl;

import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.dao.IPurchaseOrderDao;
import cn.edu.xmu.artwork.entity.PurchaseOrder;

@Repository
public class PurchaseOrderDao extends GenericDao implements IPurchaseOrderDao {
	
	public void savePurchaseOrder(PurchaseOrder purchaseOrder)
	{
		getSession().save(purchaseOrder);
	}
	
	public PurchaseOrder getPurchaseOrderByid(long id)
	{
		try {
			PurchaseOrder instance = (PurchaseOrder) getSession().get(
					"cn.edu.xmu.artwork.entity.PurchaseOrder", id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public void update(PurchaseOrder purchaseOrder)
	{
		getSession().update(purchaseOrder);
	}
}
