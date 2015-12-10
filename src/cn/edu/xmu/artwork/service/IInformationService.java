package cn.edu.xmu.artwork.service;

import java.io.File;
import java.util.List;

import cn.edu.xmu.artwork.entity.Information;

public interface IInformationService 
{
	public void submit(Information information, File file, String filename);
	
	public List<Information> getAll();
	
	public Information findInfor(long id);

	public List<Information> showInforList(long id);


}
