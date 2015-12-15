package cn.edu.xmu.artwork.service;

import java.io.File;
import java.util.List;

import cn.edu.xmu.artwork.entity.DatePos;
import cn.edu.xmu.artwork.entity.InforPics;
import cn.edu.xmu.artwork.entity.Information;

public interface IInformationService 
{
	public void submit(Information information,DatePos datePos,List<File> pic, List<String> picFileName);
	
	public List<Information> getAllInfo();
	
	public Information findInfoById(long id);

	public List<Information> showInforList(long id);
	public List<Information> getTodayInformations();
	
	public List<Information> getInfoByColum(String colum);

}
