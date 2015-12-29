package cn.edu.xmu.artwork.dao;

import cn.edu.xmu.artwork.entity.Bid;

public interface IBidDao {
	public void save(Bid bid);
	public Bid findById(long id);
}
