package cn.edu.xmu.artwork.dao;

import java.util.List;

import cn.edu.xmu.artwork.entity.AuctionOrder;
import cn.edu.xmu.artwork.entity.PurchaseOrder;

public interface IAuctionOrderDao {
	public void save(AuctionOrder auctionOrder);
	public AuctionOrder findById(long id);
	public List<AuctionOrder> getAuctionOrderByState(String identification, long id, String state);
}
