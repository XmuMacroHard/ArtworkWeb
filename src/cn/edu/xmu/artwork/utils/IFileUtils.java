package cn.edu.xmu.artwork.utils;

import java.io.File;

public interface IFileUtils 
{
	public void copy(File fromFile, File toFile);
	public void copy(File fromFile, String toImgPath);
}
