package cn.edu.xmu.artwork.dao;

import java.util.List;

import cn.edu.xmu.artwork.entity.Auction;

public interface IAuctionDao {
	public void save(Auction auction);
	public Auction findById(long id);
	public List<Auction> findByUserId(long id);
}
