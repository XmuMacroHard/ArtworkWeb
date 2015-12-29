package cn.edu.xmu.artwork.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.dao.IBidDao;
import cn.edu.xmu.artwork.entity.Bid;
@Repository
public class BidDao extends GenericDao implements IBidDao{

	@Override
	public void save(Bid bid) {
		getSession().save(bid);
	}

	@Override
	public Bid findById(long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Bid> getBidsByAuctionId(long id) {
		List<Bid> bids = null;
		try {
			Query query = getSession().getNamedQuery("Bid.getBidsByAuctionId");
			query.setParameter("id", id);
			bids = query.list();
		} catch (Exception e) {
		}
		return bids;
	}

}
