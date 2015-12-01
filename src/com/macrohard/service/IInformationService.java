package com.macrohard.service;

import java.io.File;

import com.macrohard.entity.Information;

public interface IInformationService 
{
	public void submit(Information information, File file, String filename);
}
