package com.macrohard.service;

import java.io.File;
import java.util.List;

import com.macrohard.entity.Information;

public interface IInformationService 
{
	public void submit(Information information, File file, String filename);
	public List<Information> showInforList(long id);
	public List getAll();
}