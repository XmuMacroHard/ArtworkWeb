package cn.edu.xmu.artwork.dao;

import java.util.List;

import cn.edu.xmu.artwork.entity.Auction;
import cn.edu.xmu.artwork.entity.Bid;

public interface IBidDao {
	public void save(Bid bid);
	public Bid findById(long id);
	public List<Bid> getBidsByAuctionId(long id); 
}
