package cn.edu.xmu.artwork.dao;

import java.util.List;

import cn.edu.xmu.artwork.entity.ShippingAddress;

public interface IAddressDao {
	
	public void insert(ShippingAddress address) throws Exception;
	public void delete(long id) throws Exception;
	public void update(ShippingAddress address) throws Exception;
	public ShippingAddress findById(long id) throws Exception;
	public List<ShippingAddress> findAllByUserId(long userId) throws Exception;
	
}
