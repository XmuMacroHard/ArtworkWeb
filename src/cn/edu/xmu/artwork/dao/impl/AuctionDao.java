package cn.edu.xmu.artwork.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.dao.IAuctionDao;
import cn.edu.xmu.artwork.entity.Auction;

@Repository
public class AuctionDao extends GenericDao implements IAuctionDao {

	/**
	 * 保存拍卖信息
	 */
	@Override
	public void save(Auction auction) {
		getSession().save(auction);
	}
	/**
	 * 根据id获取拍卖
	 */
	@Override
	public Auction findById(long id) {
		Auction auction = null;
		try {
			Query query = getSession().getNamedQuery("Auction.findById");
			query.setParameter("id", id);
			auction = (Auction) query.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return auction;
	}
	
	/**
	 * 根据用户id获取拍卖列表
	 */
	@Override
	public List<Auction> findByUserId(long id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 根据日期获取拍卖列表
	 */
	@Override
	public List<Auction> findByDate(Date date) {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * 根据结束时间获取拍卖列表
	 */
	@Override
	public List<Auction> findByEndTime(Date date) {
		List<Auction> auctions = null;
		try {
			Query query = getSession().getNamedQuery("Auction.getByEndTime");
			query.setDate("endTime", date);
			auctions = query.list();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return auctions;
	}

}
