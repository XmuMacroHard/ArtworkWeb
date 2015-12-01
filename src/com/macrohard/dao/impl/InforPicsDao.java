package com.macrohard.dao.impl;

import java.io.File;

import org.apache.struts2.ServletActionContext;

import com.macrohard.constants.IStrings;
import com.macrohard.entity.InforPics;
import com.macrohard.utils.IFileUtils;
import com.macrohard.utils.IImageUtils;

public class InforPicsDao extends GenericDao
{
	
	private IFileUtils fileUtils;
	private IImageUtils imgUtils;
	
	public void storePicures(File file, String filename)
	{
		String storedPath = storeImg(file, filename);
		InforPics inforPics = new InforPics();
		//inforPics.setInformaionId(id);
		
	}
	
	public void save(InforPics inforPics)
	{
		getSession().save(inforPics);
		getSession().close();
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
