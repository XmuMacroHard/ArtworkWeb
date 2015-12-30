package cn.edu.xmu.artwork.dao;

import java.util.Date;
import java.util.List;

import cn.edu.xmu.artwork.entity.Auction;
import cn.edu.xmu.artwork.entity.AuctionDate;

public interface IAuctionDateDao {
	public void save(AuctionDate auctionDate);
	public AuctionDate findById(long id);
	public List<AuctionDate> getAuctionDatesByDate(Date date);
	public List<Auction> getAuctionsByDate(Date date);
}
