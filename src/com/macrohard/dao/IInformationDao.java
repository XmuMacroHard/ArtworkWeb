package com.macrohard.dao;

import java.io.File;
import java.util.List;


import java.util.List;

import com.macrohard.entity.Information;

public interface IInformationDao 
{
	public void save(Information information, File file, String filename);
	public List findAll();
	public List getAll();
}