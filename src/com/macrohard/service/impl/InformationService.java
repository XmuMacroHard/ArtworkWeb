package com.macrohard.service.impl;

import java.io.File;
import java.util.List;

import com.macrohard.dao.IInforPicsDao;
import com.macrohard.dao.IInformationDao;
import com.macrohard.dao.impl.InforPicsDao;
import com.macrohard.entity.Information;
import com.macrohard.service.IInformationService;

public class InformationService implements IInformationService {

	
	public IInformationDao InformationDao;
	public IInforPicsDao inforPicsDao;
	
	
	@Override
	public void submit(Information information, File file, String filename) {
		
		InformationDao.save(information, file, filename);
		//inforPicsDao.storePicures(file, filename);
	}
	
	@Override
	public List<Information> getAll(){
		return InformationDao.getAll();
	}
	
	@Override
	public Information findInfor(long id){
		return InformationDao.findInfor(id);
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


		
	
}
