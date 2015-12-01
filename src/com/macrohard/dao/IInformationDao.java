package com.macrohard.dao;

import java.io.File;
import java.util.List;

import com.macrohard.entity.Information;

public interface IInformationDao 
{
	public void save(Information information, File file, String filename);
	
	public List<Information> getAll();
	
	public Information findInfor(long id);
}
