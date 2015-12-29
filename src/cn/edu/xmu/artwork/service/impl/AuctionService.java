package cn.edu.xmu.artwork.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.functors.ForClosure;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
import cn.edu.xmu.artwork.service.IAuctionService;
import cn.edu.xmu.artwork.utils.IDateUtils;

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
	
	@Override
	public void addBid(Bid bid, Auction auction) {
		bid.setAuction(auction);
		bidDao.save(bid);
		// TODO Auto-generated method stub
	}

	@Override
	public void createAuction(Commodity commodity, Auction auction) {
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
		createDailyAuctionOrder();
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
		for(Auction today_auction : today_auctions)
		{
			if(!tomorrow_auctions.contains(today_auction) && today_auction.getUser() != null)
			{
				createAuctionOrder(today_auction);
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
}
