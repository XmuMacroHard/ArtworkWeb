package cn.edu.xmu.artwork.action;


import java.util.Date;
import java.util.List;

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

@Scope("prototype")//支持多例  
@ParentPackage("json-default")  //表示继承的父包  
@Namespace(value="/") //表示当前Action所在命名空间
public class AuctionAction {
	private Bid bid;
	private Auction auction;
	private Commodity commodity;
	@Autowired
	private IAuctionService auctionService;
	
	@Action(value="createAuctionAction",results={@Result(name="success", location="/jsp/frontside/order/order.jsp")})
	public String createAuction()
	{
		commodity.setId((long) 4);
		
		auction.setCurrentPrice((float) 150);
		auction.setStartPrice((float) 150);
		auction.setStartTime(new Date());
		auction.setEndTime(new Date());
		auction.setState("0");
		auction.setLimitPerBid((float) 100);
		//auction.setCommodity(commodity);
		
		User user = new User();
		user.setId((long) 1);
		auction.setUser(user);
		
		auctionService.createAuction(auction);
		return IResultCode.SUCCESS;
	}
	
	@Action(value="showTodayAuctionAction",results={@Result(name="success", location="/jsp/frontside/order/order.jsp")})
	public String showTodayAuction()
	{
		List<Auction> list = auctionService.getTodayAuctions();
		setAttributeByRequest("auctionList", list);
		return IResultCode.SUCCESS;
	}
	
	@Action(value="showAuctionDetailAction",results={@Result(name="success", location="/jsp/frontside/order/order.jsp")})
	public String showAuctionDetail()
	{
		long id = auction.getId();
		Auction auc = auctionService.findById(id);
		setAttributeByRequest("auction", auc);
		return IResultCode.SUCCESS;
	}
	
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
