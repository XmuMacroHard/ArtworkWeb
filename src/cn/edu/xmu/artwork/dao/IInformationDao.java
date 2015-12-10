package cn.edu.xmu.artwork.dao;

import java.io.File;
import java.util.List;


import java.util.List;

import cn.edu.xmu.artwork.entity.Information;

public interface IInformationDao 
{
	public void save(Information information, File file, String filename);
	
	public List<Information> getAll();
	
	public Information findInfor(long id);
	
	public List findAll();

}
