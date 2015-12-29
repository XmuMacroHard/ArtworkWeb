package cn.edu.xmu.artwork.dao;

import java.util.Date;
import java.util.List;

import cn.edu.xmu.artwork.entity.Auction;

public interface IAuctionDao {
	public void save(Auction auction);
	public Auction findById(long id);
	public List<Auction> findByUserId(long id);
	public List<Auction> findByDate(Date date);
	public List<Auction> findByEndTime(Date date);
}
