package cn.edu.xmu.artwork.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.dao.IAuctionDateDao;
import cn.edu.xmu.artwork.entity.Auction;
import cn.edu.xmu.artwork.entity.AuctionDate;
@Repository
public class AuctionDateDao extends GenericDao implements IAuctionDateDao{

	@Override
	public void save(AuctionDate auctionDate) {
		getSession().save(auctionDate);
	}

	@Override
	public AuctionDate findById(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<AuctionDate> getAuctionDatesByDate(Date date) {
		List<AuctionDate> auctionDates = null;
		try {
			Query query = getSession().getNamedQuery("AuctionDate.getAucitionDateByDate");
			query.setDate("date", date);
			auctionDates = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return auctionDates;
	}

	@Override
	public List<Auction> getAuctionsByDate(Date date) {
		List<Auction> auctions = null;
		try {
			Query query = getSession().getNamedQuery("AuctionDate.getAucitionByDate");
			query.setParameter("date", date);
			auctions = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return auctions;
	}

}
