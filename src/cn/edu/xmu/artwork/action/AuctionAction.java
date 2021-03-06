package cn.edu.xmu.artwork.action;


import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javassist.expr.NewArray;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

import com.opensymphony.xwork2.ActionSupport;

import cn.edu.xmu.artwork.constants.IClientConstants;

import cn.edu.xmu.artwork.constants.IResultCode;
import cn.edu.xmu.artwork.entity.Auction;
import cn.edu.xmu.artwork.entity.AuctionOrder;
import cn.edu.xmu.artwork.entity.Bid;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.PurchaseOrder;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.IAuctionService;
import cn.edu.xmu.artwork.service.impl.AuctionService;
import cn.edu.xmu.artwork.utils.IJsonUtils;

@Scope("prototype")  
@ParentPackage("custom-default")    
@Namespace(value="/") 
public class AuctionAction extends ActionSupport{
	private Bid bid;
	private Auction auction;
	private Commodity commodity;
	@Autowired
	private IAuctionService auctionService;
	
	private PurchaseOrder purchaseOrder;
	
	private JSONArray resultJsonArray;
	
	private String result;
	
	/**
	 * 发起一个拍卖
	 * @return
	 */
	@Action(value="createAuctionAction",results={@Result(name="success", location="/jsp/frontside/order/order.jsp")})
	public String createAuction()
	{
		
//		commodity.setId((long) 4);
//		auction.setStartPrice((float) 16.15);
//		auction.setStartTime(new Date(2015, 12, 10));
//		auction.setEndTime(new Date(2015, 12, 15));
//		auction.setState("0");
//		auction.setLimitPerBid((float) 100);

		auctionService.createAuction(commodity, auction);	
		System.out.println("in create Auction action");

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
		Long id = auction.getId();
		
		Auction auc = auctionService.getAuctionAuctionById(id);
		List<Bid> bids = auctionService.getBidsByAuction(auc);
		
		setAttributeByRequest("auction", auc);
		setAttributeByRequest("bids", bids);
		setAttributeByRequest("nowTime", new Date());
		
		return IResultCode.SUCCESS;
	}
	
	//在一次拍卖中叫价
	@Action(value="addBidAction",results={@Result(name="success", type="json", params={"root", "result"})})
	public String addBid()
	{
		System.out.println("in bid action");
		JSONObject jsobj = new JSONObject();
		
		auctionService.addBid(auction.getId(), bid.getPrice());
		
		jsobj.put("auctionId", auction.getId());

		setResult(jsobj.toString());
		return IResultCode.SUCCESS;
	}
	
	/**
	 * 根据前台需要，通过state来获取普通用户不同状态的买卖订单
	 * @return
	 */
	@Action(value="getUserAuctionOrderByState",results={@Result(name="success", type="json", params={"root", "resultJsonArray"})},
			interceptorRefs ={@InterceptorRef(value="checkLoginStack")})
	public String getUserAuctionOrderByState()
	{				
		System.out.println("in get user auction");
		resultJsonArray = auctionService.getAllOrderByState(IClientConstants.SESSION_VALUE_RANK_USER, purchaseOrder.getState());
		return SUCCESS;
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

	public PurchaseOrder getPurchaseOrder() {
		return purchaseOrder;
	}


	public void setPurchaseOrder(PurchaseOrder purchaseOrder) {
		this.purchaseOrder = purchaseOrder;
	}


	public JSONArray getResultJsonArray() {
		return resultJsonArray;
	}


	public void setResultJsonArray(JSONArray resultJsonArray) {
		this.resultJsonArray = resultJsonArray;
	}

	public String getResult() {
		return result;
	}


	public void setResult(String result) {
		this.result = result;
	}
}
