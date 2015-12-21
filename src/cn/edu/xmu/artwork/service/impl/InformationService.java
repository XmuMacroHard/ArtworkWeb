package cn.edu.xmu.artwork.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;



import java.util.Set;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.xmu.artwork.constants.IStrings;
import cn.edu.xmu.artwork.constants.ITableConstants;
import cn.edu.xmu.artwork.dao.IInforPicsDao;
import cn.edu.xmu.artwork.dao.IInformationDao;
import cn.edu.xmu.artwork.dao.IUserDao;
import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.DatePos;
import cn.edu.xmu.artwork.entity.Information;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.IFileService;
import cn.edu.xmu.artwork.service.IInformationService;
import cn.edu.xmu.artwork.utils.IDateUtils;

@Transactional

public class InformationService extends BasicService implements IInformationService {

	
	public IInformationDao InformationDao;
	public IInforPicsDao inforPicsDao;
	public IUserDao userDao;
	
	@Autowired
	private IFileService fileService;
	
	@Autowired
	private IDateUtils dateUtils;
	
	@Override
	public void submit(Information information,DatePos datePos,List<File> pic, List<String> picFileName) {
		
		List<String> imgPaths = fileService.uploadPicture(pic, picFileName);
		long id = (long)ServletActionContext.getRequest().getSession().getAttribute("userid");
		
		List<Date> dates = dateUtils.getDatesBetweenTwoDate(information.getStartTime(), information.getEndTime());
				
		
		for(Date date : dates) 
		{
			DatePos tempDatePos = new DatePos();
			tempDatePos.setColum(datePos.getColum());
			tempDatePos.setLocation(datePos.getLocation());
			tempDatePos.setPos(datePos.getPos());			
			tempDatePos.setDate(date);
			
			information.addDatePos(tempDatePos);
		}
		information.setEditorId(id);
		information.addPicture(imgPaths);
		
		InformationDao.save(information);
	}
	
	@Override
	public List<Information> showInforList(long id)
	{

		User user = userDao.findById(id);
		List<Information> informationList = new ArrayList<Information>(user.getInformations());
		
		return informationList;
	}

	/*get all informations*/
	@Override
	public List<Information> getAllInfo(){
		
		List<Information> informations = InformationDao.getAll(); 
		for(Information information : informations)
		{
			initializeObject(information.getInforPicses());
			initializeObject(information.getDatePoses());
		}
		
		return informations;
		
	}
	
	/*
	 * get all today informations 
	 * */
	@Override
	public List<Information> getTodayInformations()
	{
		List<Information> todayInfos1 = InformationDao.getTodayInfoByLocation(ITableConstants.INFO_LOCATION_1);
		List<Information> todayInfos2 = InformationDao.getTodayInfoByLocation(ITableConstants.INFO_LOCATION_2);
		
		
		for(Information information : todayInfos1)
		{
			initializeObject(information.getInforPicses());
		}
		
		for(Information information : todayInfos2)
		{
			initializeObject(information.getInforPicses());
		}
		
		todayInfos1.addAll(todayInfos2);
		return todayInfos1;
	}
	
	public List<Information> getInfoByColum(String colum)
	{
		List<Information> infos = InformationDao.getInfoByColum(colum);
		for(Information information : infos)
		{
			initializeObject(information.getInforPicses());
		}
		return infos;
	}
	
	/*
	 * find the information by id
	 * */
	@Override
	public Information findInfoById(long id){
		Information info = InformationDao.findInfoById(id);
		initializeObject(info.getInforPicses());
		return info;
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
