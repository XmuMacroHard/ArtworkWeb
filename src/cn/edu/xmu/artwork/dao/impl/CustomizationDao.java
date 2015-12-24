package cn.edu.xmu.artwork.dao.impl;

import java.util.List;






import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.dao.ICustomizationDao;
import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Customization;
import cn.edu.xmu.artwork.entity.User;
                      
@Repository
public class CustomizationDao extends GenericDao implements ICustomizationDao{



	@Override
	public void save(Customization customization) {
		getSession().save(customization);
		// TODO Auto-generated method stub	
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Customization> getCustomizationsByUser(long id) {
		List<Customization> list = null;
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
	public List<Customization> getCustomizationsByArtist(long id) {
		List<Customization> list = null;
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
	public Customization findInfoById(long id) {
		Customization customization = null;
		try {
			Query query = getSession().getNamedQuery("Customization.getById");
			query.setParameter("cus_id", id);
			customization = (Customization) query.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return customization;
	}


}
