package cn.edu.xmu.artwork.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.constants.IClientConstants;
import cn.edu.xmu.artwork.dao.IAuctionOrderDao;
import cn.edu.xmu.artwork.entity.AuctionOrder;
import cn.edu.xmu.artwork.entity.CustomizationOrder;
import cn.edu.xmu.artwork.entity.PurchaseOrder;
@Repository
public class AuctionOrderDao extends GenericDao implements IAuctionOrderDao{

	@Override
	public void save(AuctionOrder auctionOrder) {
		getSession().save(auctionOrder);
	}

	@Override
	public AuctionOrder findById(long id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 根据用户(包括普通用户和艺术家用户)id和订单状态获取买卖订单
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<AuctionOrder> getAuctionOrderByState(String identification, long id, String state) 
	{
		List<AuctionOrder> list = null;
		try {
			Query query = null;
			if(identification.equals(IClientConstants.SESSION_VALUE_RANK_ARTIST))
			{
				query =  getSession().getNamedQuery("AuctionOrder.getOrdersByStateAndArtist");
			}
			else if(identification.equals(IClientConstants.SESSION_VALUE_RANK_USER))
			{
				query = getSession().getNamedQuery("AuctionOrder.getOrdersByStateAndUser");
			}
			
			query.setParameter("id", id);
			query.setParameter("state", state);
			list = query.list();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  list;	
	}

}
