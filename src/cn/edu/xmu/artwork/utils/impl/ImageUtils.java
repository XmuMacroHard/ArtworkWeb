package cn.edu.xmu.artwork.utils.impl;

import java.util.Date;

import org.springframework.stereotype.Component;

import cn.edu.xmu.artwork.utils.IImageUtils;

@Component
public class ImageUtils implements IImageUtils 
{
	/*
	 * @param srcImgName  it is the picture's name
	 * create a new name by date.
	 * */
	public String createImgName(String srcImgName)
	{
		return new Date().getTime() + getExtension(srcImgName);
	}
	
	public String createImgPath(String rootPath, String srcImgName)
	{
		String imgName = createImgName(srcImgName);
		return rootPath + "/" + imgName;
	}
	
	/*
	 * @param srcImgName it is the picture's name
	 * get the extension of the picture
	 * */
	private String getExtension(String srcImgName)
	{
		int pos = srcImgName.lastIndexOf(".");
		return srcImgName.substring(pos);
	}
}
