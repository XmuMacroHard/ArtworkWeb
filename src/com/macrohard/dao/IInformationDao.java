package com.macrohard.dao;

import java.io.File;

import com.macrohard.entity.Information;

public interface IInformationDao 
{
	public void save(Information information, File file, String filename);
}
