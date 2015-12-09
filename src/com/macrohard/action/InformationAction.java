package com.macrohard.action;

import java.io.File;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import java.util.Map;

import com.macrohard.entity.Information;
import com.macrohard.service.IInformationService;
import com.opensymphony.xwork2.ActionContext;
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

	/*
	 * show the information list for the editor
	 * */
	public String showInforList()
	{
		long id = (long)ServletActionContext.getRequest().getSession().getAttribute("userid");	
		List<Information> list = informationService.showInforList(id);
		ServletActionContext.getRequest().setAttribute("informationList", list);
		return "success";
	}
	
	public String showInfor()
	{		
		List list = informationService.getAll();
		Map request = (Map) ActionContext.getContext().get("request");
		request.put("list", list);
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
