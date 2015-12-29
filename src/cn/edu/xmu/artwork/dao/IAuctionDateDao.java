package cn.edu.xmu.artwork.dao;

import cn.edu.xmu.artwork.entity.AuctionDate;

public interface IAuctionDateDao {
	public void save(AuctionDate auctionDate);
	public AuctionDate findById(long id);
}
