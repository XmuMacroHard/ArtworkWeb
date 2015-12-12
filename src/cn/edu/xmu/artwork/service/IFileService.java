package cn.edu.xmu.artwork.service;

import java.io.File;
import java.util.List;

public interface IFileService 
{
	List<String> uploadPicture(List<File> pic, List<String> picName);
}
