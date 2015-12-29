package cn.edu.xmu.artwork.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.constants.IClientConstants;
import cn.edu.xmu.artwork.dao.IPurchaseOrderDao;
import cn.edu.xmu.artwork.entity.CustomizationOrder;
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
	/**
	 * 根据artistid和订单状态获取所有订单
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PurchaseOrder> getAllOrderByArtist(long id, String state) 
	{
		List<PurchaseOrder> list = null;
		try {

			Query query =  getSession().getNamedQuery("PurchaseOrder.getFinishedOrderByArtist");
			query.setParameter("artist_id", id);
			query.setParameter("state", state);
			list = query.list();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  list;	
	}
	
	/**
	 * 根据用户(包括普通用户和艺术家用户)id和订单状态获取买卖订单
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<PurchaseOrder> getPurchaseOrderByState(String identification, long id, String state) 
	{
		List<PurchaseOrder> list = null;
		List<PurchaseOrder> orders = new ArrayList<PurchaseOrder>();
		try {
			Query query = null;
			if(identification.equals(IClientConstants.SESSION_VALUE_RANK_ARTIST))
			{
				query =  getSession().getNamedQuery("CustomizationOrder.getOrdersByStateAndArtist");
			}
			else if(identification.equals(IClientConstants.SESSION_VALUE_RANK_USER))
			{
				query = getSession().getNamedQuery("CustomizationOrder.getOrdersByStateAndUser");
			}
			
			query.setParameter("id", id);
			query.setParameter("state", state);
			list = query.list();
			
			for(PurchaseOrder order : list)
			{
				if(!(order instanceof CustomizationOrder))
				{
					orders.add(order);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  orders;	
	}
}
