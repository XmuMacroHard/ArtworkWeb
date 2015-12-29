package cn.edu.xmu.artwork.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.dao.IAuctionDao;
import cn.edu.xmu.artwork.entity.Auction;

@Repository
public class AuctionDao extends GenericDao implements IAuctionDao {

	@Override
	public void save(Auction auction) {
		getSession().save(auction);
	}

	@Override
	public Auction findById(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Auction> findByUserId(long id) {
		// TODO Auto-generated method stub
		return null;
	}

}
