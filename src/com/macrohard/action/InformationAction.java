package com.macrohard.action;

import com.macrohard.entity.Information;
import com.macrohard.service.IInformationService;
import com.opensymphony.xwork2.ActionSupport;

public class InformationAction extends ActionSupport 
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String test;
	
	/*entities*/
	public Information information;
	
	/*services*/
	public IInformationService informationService;
	
	/*actions*/
	public String submitInfor()
	{
		System.out.println(test + "\n");
		System.out.println("content" + information.getContent() + "title" + information.getTitle() + "starttime" + information.getStartTime());
		//informationService.submit(information);
		
		return "success";
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
