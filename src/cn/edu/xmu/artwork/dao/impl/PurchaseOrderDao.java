package cn.edu.xmu.artwork.dao.impl;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.dao.IPurchaseOrderDao;
import cn.edu.xmu.artwork.entity.PurchaseOrder;

@Repository
public class PurchaseOrderDao extends GenericDao implements IPurchaseOrderDao {
	
	public void savePurchaseOrder(PurchaseOrder purchaseOrder)
	{
		getSession().save(purchaseOrder);
	}
	
	public void update(PurchaseOrder purchaseOrder)
	{
		getSession().update(purchaseOrder);
	}

	@Override
	public PurchaseOrder findById(long id) {
		PurchaseOrder result = null;
		try {
			Query query = getSession().getNamedQuery("PurchaseOrder.getById");
			query.setParameter("id", id);
			result = (PurchaseOrder) query.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return result;
	}
}
