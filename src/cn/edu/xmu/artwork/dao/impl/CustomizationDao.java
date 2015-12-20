package cn.edu.xmu.artwork.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.dao.ICustomizationDao;
import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Customization;
import cn.edu.xmu.artwork.entity.User;
                      
@Repository
public class CustomizationDao extends GenericDao implements ICustomizationDao{

	@Override
	public List<Customization> getCustomizationsByUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Customization> getCustomizationsByArtist(Artist artist) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void save(Customization customization) {
		getSession().save(customization);
		// TODO Auto-generated method stub	
	}


}
