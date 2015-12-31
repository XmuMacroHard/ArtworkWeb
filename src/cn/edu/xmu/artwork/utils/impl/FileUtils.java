package cn.edu.xmu.artwork.utils.impl;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;

import org.springframework.stereotype.Component;

import cn.edu.xmu.artwork.utils.IFileUtils;

@Component
public class FileUtils implements IFileUtils {

	private static final int BUFFER_SIZE = 16 * 1024;
	
	/**
	 * @param fromFile 源文件
	 * @param toFile 目的文件
	 */
	@Override
	public void copy(File fromFile, File toFile)
	{
		try {
			InputStream in = null;
			OutputStream out = null;
			try {
				
				in = new BufferedInputStream(new FileInputStream(fromFile),
						BUFFER_SIZE);
				out = new BufferedOutputStream(new FileOutputStream(toFile),
						BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE];
				while (in.read(buffer) > 0) {
					out.write(buffer);
				}
			} finally {
				if (null != in) {
					in.close();
				}
				if (null != out) {
					out.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * @param fromFile 源文件
	 * @param toImgPath 目的文件路径
	 */
	@Override
	public void copy(File fromFile, String toImgPath)
	{
		File toFile = new File(toImgPath);
		copy(fromFile, toFile);
	}

}
