package cn.edu.xmu.artwork.action;


import java.util.Calendar;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

import cn.edu.xmu.artwork.constants.IResultCode;
import cn.edu.xmu.artwork.entity.Auction;
import cn.edu.xmu.artwork.entity.Bid;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.IAuctionService;
import cn.edu.xmu.artwork.service.impl.AuctionService;
import cn.edu.xmu.artwork.utils.IJsonUtils;

@Scope("prototype")//支持多例  
@ParentPackage("json-default")  //表示继承的父包  
@Namespace(value="/") //表示当前Action所在命名空间
public class AuctionAction {
	private Bid bid;
	private Auction auction;
	private Commodity commodity;
	@Autowired
	private IAuctionService auctionService;
	
	//发起一个拍卖
	@Action(value="createAuctionAction",results={@Result(name="success", location="/jsp/frontside/order/order.jsp")})
	public String createAuction()
	{
//		auction = auctionService.getAuctionAuctionById(5);
//		auctionService.createAuctionOrder(auction);
//		commodity.setId((long) 4);
//		auction.setStartPrice((float) 150);
//		auction.setStartTime(new Date(2015, 12, 10));
//		auction.setEndTime(new Date(2015, 12, 15));
//		auction.setState("0");
//		auction.setLimitPerBid((float) 100);
		
		auctionService.createAuction(commodity, auction);
		return IResultCode.SUCCESS;
	}
	
	
	//显示当天所有拍卖
	@Action(value="showTodayAuctionAction",results={@Result(name="success", location="/jsp/frontside/auction/home_auction.jsp")})
	public String showTodayAuction()
	{
		System.out.println("show today auction.");
		
		List<Auction> auctionList = auctionService.getTodayAuctions();
		
		for(Auction auc : auctionList)
		{
			System.out.println(auc.getStartPrice());
		}
		
		setAttributeByRequest("auctionList", auctionList);
		return IResultCode.SUCCESS;
	}
	
	//显示拍卖详细信息
	@Action(value="showAuctionDetailAction",results={@Result(name="success", location="/jsp/frontside/auction/auction_detail.jsp")})
	public String showAuctionDetail()
	{
		System.out.println("in auction detail 1");
		
		Long id = auction.getId();
		
		System.out.println("in auction detail 2");
		
		Auction auc = auctionService.getAuctionAuctionById(id);
		
		System.out.println("in auction detail 3");
		
		setAttributeByRequest("auction", auc);
		
		System.out.println("in auction detail 4");
		
		return IResultCode.SUCCESS;
	}
	
	//在一次拍卖中叫价
	@Action(value="addBidAction",results={@Result(name="success", location="/jsp/frontside/order/order.jsp")})
	public String addBid()
	{
		auctionService.addBid(bid, auction);
		return IResultCode.SUCCESS;
	}
	
	private void setAttributeByRequest(String key, Object value)
	{
		ServletActionContext.getRequest().setAttribute(key, value);
	}

	public Bid getBid() {
		return bid;
	}

	public void setBid(Bid bid) {
		this.bid = bid;
	}

	public Auction getAuction() {
		return auction;
	}

	public void setAuction(Auction auction) {
		this.auction = auction;
	}

	public Commodity getCommodity() {
		return commodity;
	}

	public void setCommodity(Commodity commodity) {
		this.commodity = commodity;
	}
}
