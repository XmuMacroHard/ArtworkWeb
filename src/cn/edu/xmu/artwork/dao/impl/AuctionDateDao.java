package cn.edu.xmu.artwork.dao.impl;

import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.dao.IAuctionDateDao;
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

}
