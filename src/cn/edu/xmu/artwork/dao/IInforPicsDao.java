package cn.edu.xmu.artwork.dao;

import java.io.File;

import cn.edu.xmu.artwork.entity.InforPics;

public interface IInforPicsDao 
{
	public void storePicures(File file, String filename);
	public void save(InforPics inforPics);
}
