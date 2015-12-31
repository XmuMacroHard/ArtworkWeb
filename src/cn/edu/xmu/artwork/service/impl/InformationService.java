package cn.edu.xmu.artwork.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;



import java.util.Set;

import javax.websocket.Session;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.xmu.artwork.constants.IClientConstants;
import cn.edu.xmu.artwork.constants.IResultCode;
import cn.edu.xmu.artwork.constants.IStrings;
import cn.edu.xmu.artwork.constants.ITableConstants;
import cn.edu.xmu.artwork.dao.IDatePosDao;
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
	public IDatePosDao datePosDao;
	
	@Autowired
	private IFileService fileService;
	
	@Autowired
	private IDateUtils dateUtils;
	
	/**
	 * 提交资讯
	 */
	@Override
	public void submit(Information information,DatePos datePos,List<File> pic, List<String> picFileName) {
		
		System.out.println(" pic num:  " + picFileName.size());
		List<String> imgPaths = fileService.uploadPicture(pic, picFileName);
		User user = (User)getSessionInBrower(IClientConstants.SESSION_USER);
		
		List<Date> dates = dateUtils.getDatesBetweenTwoDate(information.getStartTime(), information.getEndTime());				

		
		
		//List<Date> repeatableDates = datePosDao.getRepeatDate(datePos.getLocation(), dates);
		
		//System.out.println(repeatableDates.size());
		
		//if(repeatableDates.size() <= 0)
		//{
		
		information.setEditorId(user.getId());
		information.addPicture(imgPaths);
		information.setStatus(ITableConstants.INFO_STATUS_PENDING);
		
		InformationDao.save(information);
			
			for(Date date : dates) 
			{
				DatePos tempDatePos = new DatePos();
				tempDatePos.setColum(datePos.getColum());
				tempDatePos.setLocation(datePos.getLocation());
				tempDatePos.setPos(datePos.getPos());			
				tempDatePos.setDate(date);
				tempDatePos.setInformation(information);
				datePosDao.save(tempDatePos);
				//information.getDatePoses().add(tempDatePos);
				//information.addDatePos(tempDatePos);
			}
			//information.addDatePos(new DatePos());
			//information.getDatePoses().add(new DatePos(information, new Date(), datePos.getColum()));
/*			information.setEditorId(user.getId());
			information.addPicture(imgPaths);
			information.setStatus(ITableConstants.INFO_STATUS_PENDING);
			
			InformationDao.save(information);*/
			setAttributeByRequest(IResultCode.RESULT, IResultCode.SUCCESS);
		//}
		//else
		//{
		//	setAttributeByRequest(IResultCode.RESULT_DATA, repeatableDates);
		//	setAttributeByRequest(IResultCode.RESULT, IResultCode.ERROR);
		//}
			
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
		List<Information> todayInfos1 = InformationDao.getTodayInfoByLocation(ITableConstants.INFO_LOCATION_1, ITableConstants.INFO_LOCATION_1_NUM, ITableConstants.INFO_DEFAULT_INFO_STATUS);
		List<Information> todayInfos2 = InformationDao.getTodayInfoByLocation(ITableConstants.INFO_LOCATION_2, ITableConstants.INFO_LOCATION_2_NUM, ITableConstants.INFO_DEFAULT_INFO_STATUS);
		List<Information> todayAdv = InformationDao.getTodayInfoByLocation(ITableConstants.ADV_LOCATION_1, ITableConstants.INFO_ADV_LOCATION_1_NUM, ITableConstants.INFO_DEFAULT_ADV_STATUS);
		
		for(Information information : todayInfos1)
		{
			initializeObject(information.getInforPicses());
		}
		
		for(Information information : todayInfos2)
		{
			initializeObject(information.getInforPicses());
		}
		
		for(Information information : todayAdv)
		{
			initializeObject(information.getInforPicses());
		}
		
		todayInfos1.addAll(todayInfos2);
		todayInfos1.addAll(todayAdv);
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
	
	/**
	 * 根据采编id获取其编辑过的所有资讯
	 * @param user
	 */
	@Override
	public void getInfoListByEditorId()
	{
		User user = (User)getSessionInBrower(IClientConstants.SESSION_USER);
		List<Information> infos =  InformationDao.getInfoListByEditorId(user.getId());
		setAttributeByRequest("infoList", infos);
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
