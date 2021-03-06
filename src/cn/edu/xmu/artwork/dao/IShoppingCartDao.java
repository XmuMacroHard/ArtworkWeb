package cn.edu.xmu.artwork.dao;

import java.util.List;

import cn.edu.xmu.artwork.entity.ShoppingCart;

public interface IShoppingCartDao {
	void save(ShoppingCart shoppingCart);
	List<ShoppingCart> getAllByUserId(long userid);
	public boolean isExisted(long userid, long commodityid);
	public void delete(long commodityid,long userid);
}
