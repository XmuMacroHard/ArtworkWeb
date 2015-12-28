package cn.edu.xmu.artwork.dao;

import cn.edu.xmu.artwork.entity.AuctionOrder;

public interface IAuctionOrderDao {
	public void save(AuctionOrder auctionOrder);
	public AuctionOrder findById(long id);
}
