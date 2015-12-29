package cn.edu.xmu.artwork.dao.impl;

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

}
