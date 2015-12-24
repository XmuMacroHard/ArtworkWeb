package cn.edu.xmu.artwork.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.xmu.artwork.dao.ICustomizationDao;
import cn.edu.xmu.artwork.entity.Customization;
import cn.edu.xmu.artwork.service.ICustomizeService;

@Transactional
@Service
public class CustomizeService implements ICustomizeService{
	@Autowired
	private ICustomizationDao customizationDao;
	
	@Override
	public void addCustomization(Customization customization) {
		
		// TODO Auto-generated method stub
	}

	@Override
	public List<Customization> showCustomizationsList(long id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
