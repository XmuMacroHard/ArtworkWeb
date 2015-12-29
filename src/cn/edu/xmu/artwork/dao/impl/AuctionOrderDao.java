package cn.edu.xmu.artwork.dao.impl;

import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.dao.IAuctionOrderDao;
import cn.edu.xmu.artwork.entity.AuctionOrder;
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

}
