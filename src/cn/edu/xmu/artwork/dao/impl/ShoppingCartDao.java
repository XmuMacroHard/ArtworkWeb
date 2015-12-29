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
	
	public void delete(long commodityid,long userid)
	{
		Query query = getSession().getNamedQuery("ShoppingCart.deleteById")
			.setParameter("commodityid",commodityid)
			.setParameter("userid", userid);
		query.executeUpdate();
	}
	
	@SuppressWarnings("unchecked")
	public List<ShoppingCart> getAllByUserId(long userid)
	{
		Query query = getSession().getNamedQuery("ShoppingCart.getAllByUserId").setParameter("userid", userid);
		List<ShoppingCart> shoppingCart = (List<ShoppingCart>)query.list();
		return shoppingCart;
	}
	/**
	 * 判断某人的购物车里是否已经有了某件商品
	 * @param userid
	 * @param commodityid
	 * @return
	 */
	public boolean isExisted(long userid, long commodityid)
	{
		Query query = getSession().getNamedQuery("ShoppingCart.getByUseridCommodityid").setParameter("userid", userid).setParameter("commodityid", commodityid);
		ShoppingCart shoppingCart = (ShoppingCart)query.uniqueResult();
		if (shoppingCart != null) {
			return true;
		}
		else
		{
			return false;
		}
	}
}
