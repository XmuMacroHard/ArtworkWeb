package cn.edu.xmu.artwork.service;

import java.sql.Date;
import java.util.List;

import net.sf.json.JSONArray;
import cn.edu.xmu.artwork.action.AuctionAction;
import cn.edu.xmu.artwork.entity.Auction;
import cn.edu.xmu.artwork.entity.Bid;
import cn.edu.xmu.artwork.entity.Commodity;

public interface IAuctionService {
	//叫价
	public void addBid(Bid bid, Auction auction);
	public void addBid(long auctionId, float price);
	//发起一个拍卖
	public void createAuction(Commodity commodity, Auction auction);
	//生成单个拍卖的订单
	public void createAuctionOrder(Auction auction);
	//通过计时器调用 计算每日结束拍卖的订单
	public void createDailyAuctionOrder();
	//得到一个拍卖的所有叫价
	public List<Bid> getBidsByAuction(Auction auction);
	//得到当天的所有拍卖
	public List<Auction> getTodayAuctions();
	//根据id拿拍卖
	public Auction getAuctionAuctionById(long id);
}
