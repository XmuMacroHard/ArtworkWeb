package com.macrohard.dao.impl;


import java.io.File;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;

import com.macrohard.constants.IStrings;
import com.macrohard.dao.IInformationDao;
import com.macrohard.entity.InforPics;
import com.macrohard.entity.Information;
import com.macrohard.entity.User;
import com.macrohard.utils.IFileUtils;
import com.macrohard.utils.IImageUtils;

public class InformationDao extends GenericDao implements IInformationDao {

	private IFileUtils fileUtils;
	private IImageUtils imgUtils;
	
	@Override
	public void save(Information information, File file, String filename) {
		
		long id = (long)ServletActionContext.getRequest().getSession().getAttribute("userid");		
		String storedPath = storeImg(file, filename);
		
		information.setEditorId(id);
		information.addPicture(storedPath);
		
		getSession().save(information);
		closeSession();
	}
	
	@Override
	public List getAll()
	{
		List list=null;
		try {
			Query query = getSession().createQuery("from Information");
			list = query.list();
			closeSession();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally{
			if(session.isOpen())
		        session.close();
		}
		return list;
	}
	/*
	 * @return return the path stored to the data base.
	 * */
	private String storeImg(File file, String filename)
	{
		String rootPath = ServletActionContext.getServletContext().getRealPath(IStrings.IMAGE_DIR);
		String realFileName = imgUtils.createImgName(filename);
		String toImgPath = rootPath + "/" + realFileName;
		fileUtils.copy(file, toImgPath);
		
		return "/" + IStrings.IMAGE_DIR + "/" + realFileName;
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

	
}
