package com.macrohard.service.impl;

import com.macrohard.dao.IInformationDao;
import com.macrohard.entity.Information;
import com.macrohard.service.IInformationService;

public class InformationService implements IInformationService {

	
	public IInformationDao InformationDao;
	
	@Override
	public void submit(Information information) {
		
		InformationDao.save(information);

	}

	public IInformationDao getInformationDao() {
		return InformationDao;
	}

	public void setInformationDao(IInformationDao informationDao) {
		InformationDao = informationDao;
	}

		
	
}
