package cn.edu.xmu.artwork.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.edu.xmu.artwork.dao.IInforPicsDao;
import cn.edu.xmu.artwork.dao.IInformationDao;
import cn.edu.xmu.artwork.dao.IUserDao;
import cn.edu.xmu.artwork.entity.Information;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.IInformationService;
@Transactional
public class InformationService implements IInformationService {

	
	public IInformationDao InformationDao;
	public IInforPicsDao inforPicsDao;
	public IUserDao userDao;
	
	
	@Override
	public void submit(Information information, File file, String filename) {
		
		InformationDao.save(information, file, filename);
	}
	
	public List<Information> showInforList(long id)
	{
		User user = userDao.findById(id);
		List<Information> informationList = new ArrayList<Information>(user.getInformations());
		return informationList;
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

	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}


		
	
}
