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
		Query query =  getSession().getNamedQuery("getCustomizationByUser");
		query.setParameter("user_id", id);
		return  query.list();	
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Customization> getCustomizationsByArtist(long id) {
		Query query =  getSession().getNamedQuery("getCustomizationByArtist");
		query.setParameter("artist_id", id);
		return  query.list();	
	}
}
