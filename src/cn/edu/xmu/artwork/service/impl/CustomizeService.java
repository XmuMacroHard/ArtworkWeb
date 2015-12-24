package cn.edu.xmu.artwork.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.xmu.artwork.dao.ICustomizationDao;
import cn.edu.xmu.artwork.entity.Customization;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.ICustomizeService;

@Transactional
@Service
public class CustomizeService implements ICustomizeService{
	@Autowired
	private ICustomizationDao customizationDao;
	
	@Override
	public void addCustomization(Customization customization) {
		customizationDao.save(customization);
	}

	@Override
	public List<Customization> showCustomizationsList(long id) {
	
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Customization> getCustomizationsByUser(long id) {
		return customizationDao.getCustomizationsByUser(id);
	}

	@Override
	public List<Customization> getCustomizationsByArtist(long id) {
		return customizationDao.getCustomizationsByArtist(id);
	}

	@Override
	public boolean accetpCustomization(long id) {
			Customization customization = customizationDao.findInfoById(id);
			if(null == customization)
				return false;
			else
			{
				customization.setState("accept");
				return true;	
			}
	}

}
