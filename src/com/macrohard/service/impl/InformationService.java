package com.macrohard.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.macrohard.dao.IInforPicsDao;
import com.macrohard.dao.IInformationDao;
import com.macrohard.dao.IUserDao;
import com.macrohard.entity.Information;
import com.macrohard.entity.User;
import com.macrohard.service.IInformationService;

public class InformationService implements IInformationService {

	
	public IInformationDao InformationDao;
	public IInforPicsDao inforPicsDao;
	public IUserDao userDao;
	
	
	@Override
	public void submit(Information information, File file, String filename) {
		
		InformationDao.save(information, file, filename);
		//inforPicsDao.storePicures(file, filename);
	}
	
	public List<Information> showInforList(long id)
	{
		User user = userDao.findById(id);
		List<Information> informationList = new ArrayList<Information>(user.getInformations());
		return informationList;
	}

	public IInformationDao getInformationDao() {
		return InformationDao;
	}

	public void setInformationDao(IInformationDao informationDao) {
		InformationDao = informationDao;
	}


	public void setInforPicsDao(IInforPicsDao inforPicsDao) {
		this.inforPicsDao = inforPicsDao;
	}

	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}


		
	
}
