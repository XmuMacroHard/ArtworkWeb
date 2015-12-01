package com.macrohard.dao.impl;


import java.io.File;

import org.apache.struts2.ServletActionContext;

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
