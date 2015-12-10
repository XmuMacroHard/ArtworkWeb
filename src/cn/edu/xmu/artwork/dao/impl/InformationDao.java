package cn.edu.xmu.artwork.dao.impl;


import java.io.File;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;









import cn.edu.xmu.artwork.constants.IStrings;
import cn.edu.xmu.artwork.dao.IInformationDao;
import cn.edu.xmu.artwork.entity.Information;
import cn.edu.xmu.artwork.utils.IFileUtils;
import cn.edu.xmu.artwork.utils.IImageUtils;

public class InformationDao extends GenericDao implements IInformationDao {

	private IFileUtils fileUtils;
	private IImageUtils imgUtils;
	
	@Override
	public void save(Information information, File file, String filename) {
		try {
			
			long id = (long)ServletActionContext.getRequest().getSession().getAttribute("userid");		
			String storedPath = storeImg(file, filename);
			
			information.setEditorId(id);
			//User user = new User();
			//user.setId(id);
			//information.setUser(user);
			information.addPicture(storedPath);
		
			getSession().save(information);	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally
		{
			closeSession();	
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
		finally
		{
			if(getSession().isOpen())
				closeSession();
		}
	}
	
	@Override
	public List<Information> getAll()
	{
		List<Information> list=null;
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
	
	@Override
	public Information findInfor(long id)
	{
		Information Infor=null;
		try {
			Query query = getSession().createQuery("from Information where id="+id);
			Infor = (Information) query.uniqueResult();
			closeSession();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally{
			if(session.isOpen())
		        session.close();
		}
		return Infor;
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
