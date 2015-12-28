package cn.edu.xmu.artwork.dao.impl;

import java.util.List;






import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.dao.ICustomizationDao;
import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.CustomizationOrder;
import cn.edu.xmu.artwork.entity.User;
                      
@Repository
public class CustomizationDao extends GenericDao implements ICustomizationDao{



	@Override
	public void save(CustomizationOrder customization) {
		getSession().save(customization);
		// TODO Auto-generated method stub	
	}


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


	@SuppressWarnings("unchecked")
	@Override
	public List<CustomizationOrder> getCustomizationsByArtist(long id) {
		List<CustomizationOrder> list = null;
		try {

			Query query =  getSession().getNamedQuery("Customization.getByArtist");
			query.setParameter("artist_id", id);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  list;	
	}


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


}
