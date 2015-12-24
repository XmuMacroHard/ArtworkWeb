package cn.edu.xmu.artwork.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.xmu.artwork.constants.IStrings;
import cn.edu.xmu.artwork.service.IFileService;
import cn.edu.xmu.artwork.utils.IFileUtils;
import cn.edu.xmu.artwork.utils.IImageUtils;

@Service
public class FileService implements IFileService 
{
	@Autowired
	IFileUtils fileUtil;
	
	@Autowired
	IImageUtils imgUtil;
	
	/*
	 * upload the pictures
	 * @return the paths of the pictures
	 * */
	public List<String> uploadPicture(List<File> pic, List<String> picName)
	{
		List<String> paths = new ArrayList<String>();
		for(int i = 0; i < pic.size(); i++)
		{
			String storedPath = storeImg(pic.get(i), picName.get(i));
			paths.add(storedPath);
		}
		return paths;
	}
	
	/*
	 * @return return the path stored to the data base.
	 * */
	private String storeImg(File file, String filename)
	{
		String rootPath = ServletActionContext.getServletContext().getRealPath(IStrings.IMAGE_DIR);
		String realFileName = imgUtil.createImgName(filename);
		String toImgPath = rootPath + "/" + realFileName;
		fileUtil.copy(file, toImgPath);
		
		return "/" + IStrings.IMAGE_DIR + "/" + realFileName;
	}
	
	/**
	 * 获取下载文件流
	 * @author asus1
	 */
	public InputStream getDownloadFile(String fileName) throws FileNotFoundException, UnsupportedEncodingException
	{
		System.out.println(fileName);
		
		ServletActionContext.getResponse().setHeader("Content-Disposition","attachment;fileName="
				+ java.net.URLEncoder.encode(fileName, "UTF-8"));
		InputStream inputStream = new FileInputStream("F:/"
				+ fileName);
		System.out.println(inputStream);
		return inputStream;
	}
}
