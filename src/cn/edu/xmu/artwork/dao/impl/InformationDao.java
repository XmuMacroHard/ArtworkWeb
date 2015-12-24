package cn.edu.xmu.artwork.dao.impl;


import java.io.File;
import java.util.Calendar;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;

import cn.edu.xmu.artwork.constants.IStrings;
import cn.edu.xmu.artwork.constants.ITableConstants;
import cn.edu.xmu.artwork.dao.IInformationDao;
import cn.edu.xmu.artwork.entity.Information;
import cn.edu.xmu.artwork.utils.IFileUtils;
import cn.edu.xmu.artwork.utils.IImageUtils;

public class InformationDao extends GenericDao implements IInformationDao {

	private IFileUtils fileUtils;
	private IImageUtils imgUtils;
	
	@Override
	public void save(Information information) {
		try {			
			getSession().save(information);	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	
	public List findAll() {
		
		try {
			String queryString = "from Information";
			Query queryObject = getSession().createQuery(queryString);			
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	@Override
	public List<Information> getAll()
	{
		List<Information> list=null;
		try {
			Query query = getSession().createQuery("from Information");
			list = query.list();
			System.out.println("in infoDao: " + list.get(0).getTitle());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	/*get today informations*/
	@SuppressWarnings("unchecked")
	@Override
	public List<Information> getTodayInfoByLocation(String location)
	{
		Calendar today = Calendar.getInstance();
		Query query = getSession().getNamedQuery("Information.getInfoShownOnHomePage");
		query.setDate("today", today.getTime());
		query.setParameter("location", location);
		query.setMaxResults(ITableConstants.INFO_LOCATION_1_NUM);
		List<Information> informations = query.list();
		if(informations.size() < ITableConstants.INFO_LOCATION_1_NUM)
		{
			Query searchDefault = getSession().getNamedQuery("Information.getDefaultInfos");
			searchDefault.setParameter("default", ITableConstants.INFO_DEFAULT_STATUS);
			searchDefault.setMaxResults(ITableConstants.INFO_LOCATION_1_NUM - informations.size());
			List<Information> defaults = searchDefault.list();
			informations.addAll(defaults);
		}
		
		
		return informations;
	}
	
	@SuppressWarnings("unchecked")
	public List<Information> getInfoByColum(String colum)
	{
		Query query = getSession().getNamedQuery("Information.getInfoByColum").setParameter("colum", colum);
		return query.list();
	}
	
	@Override
	public Information findInfoById(long id)
	{
		Information Infor=null;
		try {
			Query query = getSession().getNamedQuery("Information.getInfoById").setParameter("infoId", id);
			Infor = (Information) query.uniqueResult();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return Infor;
	}

	
	
	public IFileUtils getFileUtils() {
		return fileUtils;
	}

	public void setFileUtils(IFileUtils fileUtils) {
		this.fileUtils = fileUtils;
	}

	public IImageUtils getImgUtils() {
		return imgUtils;
	}

	public void setImgUtils(IImageUtils imgUtils) {
		this.imgUtils = imgUtils;
	}


	/**
	 * 更新用户状态
	 * @author asus1
	 * @param 资讯id
	 * @param 资讯状态
	 */
	@Override
	public void updateInfoStatus(long id, String status) {
		
		String hql=String.format("update Information info set info.status = %s where info.id = %d", status, id);
		Query queryupdate= getSession().createQuery(hql);
		int ret=queryupdate.executeUpdate();
		
	}

	
	
	
}
