package cn.edu.xmu.artwork.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.dao.IShoppingCartDao;
import cn.edu.xmu.artwork.entity.ShoppingCart;

@Repository
public class ShoppingCartDao extends GenericDao implements IShoppingCartDao 
{

	public void save(ShoppingCart shoppingCart)
	{
		getSession().save(shoppingCart);
	}
	
	@SuppressWarnings("unchecked")
	public List<ShoppingCart> getAllByUserId(long userid)
	{
		Query query = getSession().getNamedQuery("ShoppingCart.getAllByUserId");
		List<ShoppingCart> shoppingCart = (List<ShoppingCart>)query.list();
		return shoppingCart;
	}
}
