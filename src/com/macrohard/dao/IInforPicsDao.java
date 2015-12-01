package com.macrohard.dao;

import java.io.File;

import com.macrohard.entity.InforPics;

public interface IInforPicsDao 
{
	public void storePicures(File file, String filename);
	public void save(InforPics inforPics);
}
