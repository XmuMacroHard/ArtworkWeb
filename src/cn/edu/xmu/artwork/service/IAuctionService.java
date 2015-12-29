package cn.edu.xmu.artwork.service;

import java.sql.Date;
import java.util.List;

import cn.edu.xmu.artwork.entity.Auction;
import cn.edu.xmu.artwork.entity.Bid;
import cn.edu.xmu.artwork.entity.Commodity;

public interface IAuctionService {
	public boolean addBid(Bid bid, Auction auction);
	
	public boolean createAuction(Auction auction);
	//每天计算一次 当天结束拍卖的拍卖订单
	public boolean createDailyAuctionOrder();
	
	public List<Bid> getByAuction(Auction auction);
	public List<Auction> getTodayAuctions();
	public Auction findById(long id);
}
