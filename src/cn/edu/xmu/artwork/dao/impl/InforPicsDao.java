package cn.edu.xmu.artwork.dao.impl;

import java.io.File;






import cn.edu.xmu.artwork.entity.InforPics;
import cn.edu.xmu.artwork.utils.IFileUtils;
import cn.edu.xmu.artwork.utils.IImageUtils;

public class InforPicsDao extends GenericDao
{
	
	private IFileUtils fileUtils;
	private IImageUtils imgUtils;
	
	public void save(InforPics inforPics)
	{
		getSession().save(inforPics);
		getSession().close();
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
