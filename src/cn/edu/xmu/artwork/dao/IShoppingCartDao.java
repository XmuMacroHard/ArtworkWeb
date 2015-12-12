package cn.edu.xmu.artwork.dao;

import java.util.List;

import cn.edu.xmu.artwork.entity.ShoppingCart;

public interface IShoppingCartDao {
	void save(ShoppingCart shoppingCart);
	List<ShoppingCart> getAllByUserId(long userid);
}
