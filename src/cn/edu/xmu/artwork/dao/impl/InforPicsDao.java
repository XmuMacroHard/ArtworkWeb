package cn.edu.xmu.artwork.dao.impl;

import java.io.File;










import org.springframework.stereotype.Repository;

import cn.edu.xmu.artwork.dao.IInforPicsDao;
import cn.edu.xmu.artwork.dao.IInformationDao;
import cn.edu.xmu.artwork.entity.InforPics;
import cn.edu.xmu.artwork.utils.IFileUtils;
import cn.edu.xmu.artwork.utils.IImageUtils;
@Repository
public class InforPicsDao extends GenericDao implements IInforPicsDao
{
	
	private IFileUtils fileUtils;
	private IImageUtils imgUtils;
	
	public void save(InforPics inforPics)
	{
		getSession().save(inforPics);
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
