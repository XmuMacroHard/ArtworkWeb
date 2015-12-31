package cn.edu.xmu.artwork.dao.impl;

import java.util.ArrayList;
import java.util.List;







import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.constants.IClientConstants;
import cn.edu.xmu.artwork.dao.ICustomizationDao;
import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.CustomizationOrder;
import cn.edu.xmu.artwork.entity.PurchaseOrder;
import cn.edu.xmu.artwork.entity.User;
                      
@Repository
public class CustomizationDao extends GenericDao implements ICustomizationDao{


	@Override
	public void save(CustomizationOrder customization) {
		try {
			getSession().save(customization);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// TODO Auto-generated method stub	
	}

	/**
	 * 根据用户id获取其所有的定制订单
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<CustomizationOrder> getCustomizationsByUser(long id) {
		List<CustomizationOrder> list = null;
		try {
			Query query =  getSession().getNamedQuery("Customization.getByUser");
			query.setParameter("user_id", id);
			System.out.println("getCustomization");
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 根据定制订单id获取定制订单
	 */
	@Override
	public CustomizationOrder findById(long id) {
		CustomizationOrder customization = null;
		try {
			Query query = getSession().getNamedQuery("CustomizationOrder.getById");
			query.setParameter("cus_id", id);
			customization = (CustomizationOrder) query.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return customization;
	}

	/**
	 * 根据用户(包括普通用户和艺术家用户)id和订单状态获取买卖订单
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<CustomizationOrder> getCusOrderByState(String identification, long id, String state) 
	{
		List<CustomizationOrder> list = null;
		try {
			Query query = null;
			if(identification.equals(IClientConstants.SESSION_VALUE_RANK_ARTIST))
			{
				query =  getSession().getNamedQuery("CustomizationOrder.getOrdersByStateAndArtist");
			}
			else if(identification.equals(IClientConstants.SESSION_VALUE_RANK_USER))
			{
				query = getSession().getNamedQuery("PurchaseOrder.getOrdersByStateAndUser");
			}
			
			query.setParameter("id", id);
			query.setParameter("state", state);
			list = query.list();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  list;	
	}

}
