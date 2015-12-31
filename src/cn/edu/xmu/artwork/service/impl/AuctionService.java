package cn.edu.xmu.artwork.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;

import org.apache.commons.collections.functors.ForClosure;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.xmu.artwork.constants.IClientConstants;
import cn.edu.xmu.artwork.constants.ITableConstants;
import cn.edu.xmu.artwork.dao.IAuctionDao;
import cn.edu.xmu.artwork.dao.IAuctionDateDao;
import cn.edu.xmu.artwork.dao.IAuctionOrderDao;
import cn.edu.xmu.artwork.dao.IBidDao;
import cn.edu.xmu.artwork.dao.ICommodityDao;
import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Auction;
import cn.edu.xmu.artwork.entity.AuctionDate;
import cn.edu.xmu.artwork.entity.AuctionOrder;
import cn.edu.xmu.artwork.entity.Bid;
import cn.edu.xmu.artwork.entity.Commodity;
import cn.edu.xmu.artwork.entity.PurchaseOrder;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.IAuctionService;
import cn.edu.xmu.artwork.utils.IDateUtils;
import cn.edu.xmu.artwork.utils.impl.JsonUtils;

@Service
@Transactional
public class AuctionService extends BasicService implements IAuctionService{

	@Autowired
	private IAuctionDao auctionDao;
	@Autowired
	private IBidDao  bidDao;
	@Autowired
	private IAuctionOrderDao auctionOrderDao;
	@Autowired
	private IAuctionDateDao  auctionDateDao;
	@Autowired
	private ICommodityDao commodityDao;

	@Autowired
	private IDateUtils dateUtils;
	
	@Autowired
	private JsonUtils jsonUtils;
	
	@Override
	public void addBid(Bid bid, Auction auction) {
		bid.setAuction(auction);
		bidDao.save(bid);
		// TODO Auto-generated method stub
	}

	@Override
	public void createAuction(Commodity commodity, Auction auction) {
		System.out.println("in create Auction service");
		Commodity c = commodityDao.getCommodityById(commodity.getId());
		System.out.println(c.getIntroduction());
		c.setCategory("auction");
		
		User user = new User();
		user.setId((long) 1);
		auction.setUser(user);
		
		auction.setCommodity(commodity);
		auction.setCurrentPrice(auction.getStartPrice());
		auctionDao.save(auction);
		
		List<Date> dates = dateUtils.getDatesBetweenTwoDate(auction.getStartTime(), auction.getEndTime());
		for(Date date: dates)
		{
			AuctionDate auctionDate = new AuctionDate();
			auctionDate.setDate(date);
			auctionDate.setAuction(auction);
			auctionDateDao.save(auctionDate);
		}
	}


	@Override
	public List<Bid> getBidsByAuction(Auction auction) {
		return bidDao.getBidsByAuctionId(auction.getId());
	}

	
	@Override
	public List<Auction> getTodayAuctions() {
		Calendar today = Calendar.getInstance();
		return getAuctionsByDate(today.getTime());
	}

	@Override
	public Auction getAuctionAuctionById(long id) {
		return auctionDao.findById(id);
	}

	@Override
	public void createAuctionOrder(Auction auction) {
		AuctionOrder auctionOrder = new AuctionOrder();
		System.out.println(auction.getId());
		Commodity commodity = commodityDao.getCommodityById(auction.getCommodity().getId());
		commodity.setPrice(auction.getCurrentPrice());
		commodity.setPurchaseOrder(auctionOrder);
		
		auctionOrder.setUser(auction.getUser());
		auctionOrder.setDate(new Date());
		auctionOrder.setTotalprice(auction.getCurrentPrice());
		auctionOrder.setLeftprice(auction.getCurrentPrice());
		auctionOrder.setOrderid("123");
		auctionOrder.setState("0");
		Artist artist = new Artist();
		artist.setId(commodity.getAuthorId());
		auctionOrder.setArtist(artist);
		auctionOrderDao.save(auctionOrder);
		// TODO Auto-generated method stubn
	}

	@Override
	public void createDailyAuctionOrder() {
		Calendar today = Calendar.getInstance();
		List<Auction> today_auctions = getAuctionsByDate(today.getTime());
		today = dateUtils.getNextDay(today);
		List<Auction> tomorrow_auctions = getAuctionsByDate(today.getTime());
		//用今天的拍卖列表 - 明天的拍卖列表  得到今天结束的拍卖列表
		for(Auction today_auction : today_auctions)
		{
			if(!tomorrow_auctions.contains(today_auction))
			{
				//拍卖的用户如果为空则为未完成的拍卖 需要对商品做处理
				if(today_auction.getUser() != null)
					createAuctionOrder(today_auction);
				else
				{
					long commodity_id = today_auction.getCommodity().getId();
					Commodity commodity = commodityDao.getCommodityById(commodity_id);
					commodity.setPurchaseOrder(null);
				}
			}
		}
	}

	private List<Auction> getAuctionsByDate(Date date)
	{
		List<AuctionDate> auctionDates = auctionDateDao.getAuctionDatesByDate(date);
		List<Auction> auctions = new ArrayList<Auction>();
		for(AuctionDate auctionDate: auctionDates)
		{
			auctions.add(auctionDate.getAuction());
			System.out.println(auctionDate.getDate() + " " + auctionDate.getAuction().getId());
		}
		return auctions;
	}
	
	/**
	 * 根据当前identification（艺术家或用户或管理员） 和 需要的订单状态获取订单
	 * @param identification
	 * @param state
	 * @return
	 */
	@Override
	public JSONArray getAllOrderByState(String identification,String state) 
	{
		User user = (User)getSessionInBrower(IClientConstants.SESSION_USER);
		System.out.println(user.getId());
		System.out.println(state);
		System.out.println(identification);
		List<AuctionOrder> orders = auctionOrderDao.getAuctionOrderByState(identification, user.getId(), state);	
				
		String[] excludes = {ITableConstants.PURCHASE_ORDER_COMMODITY, ITableConstants.PURCHASE_ORDER_PAYMENTS, ITableConstants.PURCHASE_ORDER_SHIPPING_ADDRESS, ITableConstants.PURCHASE_ORDER_ARTIST, ITableConstants.PURCHASE_ORDER_USER};
		System.out.println(jsonUtils.List2JsonArray(orders, excludes));
		
		return jsonUtils.List2JsonArray(orders, excludes);
	}
}
