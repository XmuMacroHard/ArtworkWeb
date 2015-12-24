package cn.edu.xmu.artwork.dao;

import java.io.File;
import java.util.List;


import java.util.List;

import cn.edu.xmu.artwork.entity.Information;

public interface IInformationDao 
{
	public void save(Information information);
	
	public List<Information> getAll();
	
	public Information findInfoById(long id);
	
	public List findAll();
	
	public List<Information> getTodayInfoByLocation(String location, int number, String default_status);

	public List<Information> getInfoByColum(String colum);

}
