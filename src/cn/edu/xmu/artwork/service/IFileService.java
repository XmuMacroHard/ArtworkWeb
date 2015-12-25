package cn.edu.xmu.artwork.service;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

public interface IFileService 
{
	List<String> uploadPicture(List<File> pic, List<String> picName);
	
	public InputStream getDownloadFile(String fileName) throws FileNotFoundException, UnsupportedEncodingException;
}
