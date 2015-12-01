package com.macrohard.action;

import java.io.File;

import com.macrohard.entity.Information;
import com.macrohard.service.IInformationService;
import com.opensymphony.xwork2.ActionSupport;

public class InformationAction extends ActionSupport 
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public File pic;
	public String picContentType;
	public String picFileName;
	
	/*entities*/
	public Information information;
	
	/*services*/
	public IInformationService informationService;
	
	/*actions*/
	public String submitInfor()
	{
		System.out.println("content:" + information.getContent() + "\ntitle:" + information.getTitle() + "\nstarttime:" + information.getStartTime());	
		informationService.submit(getInformation(), pic, picFileName);
		
		return "success";
	}

	
	
	
	public void setPic(File pic) {
		this.pic = pic;
	}

	public void setPicContentType(String picContentType) {
		this.picContentType = picContentType;
	}

	public void setPicFileName(String picFileName) {
		this.picFileName = picFileName;
	}


	public void setInformation(Information information) {
		this.information = information;
	}
	
	public Information getInformation() {
		return information;
	}

	public IInformationService getInformationService() {
		return informationService;
	}

	public void setInformationService(IInformationService informationService) {
		this.informationService = informationService;
	}
	
	
	
}
