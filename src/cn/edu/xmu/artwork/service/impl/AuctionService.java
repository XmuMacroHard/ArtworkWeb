package cn.edu.xmu.artwork.service.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.xmu.artwork.dao.IAuctionDao;
import cn.edu.xmu.artwork.dao.IAuctionDateDao;
import cn.edu.xmu.artwork.dao.IAuctionOrderDao;
import cn.edu.xmu.artwork.dao.IBidDao;
import cn.edu.xmu.artwork.entity.Auction;
import cn.edu.xmu.artwork.entity.Bid;
import cn.edu.xmu.artwork.service.IAuctionService;

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
	
	@Override
	public boolean addBid(Bid bid, Auction auction) {
		
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean createAuction(Auction auction) {
		auctionDao.save(auction);
		return true;
	}

	@Override
	public boolean createDailyAuctionOrder() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Bid> getByAuction(Auction auction) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Auction> getTodayAuctions() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Auction findById(long id) {
		// TODO Auto-generated method stub
		return null;
	}


}
