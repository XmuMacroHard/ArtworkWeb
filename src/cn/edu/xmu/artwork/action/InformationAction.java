package cn.edu.xmu.artwork.action;

import java.io.File;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import cn.edu.xmu.artwork.entity.DatePos;
import cn.edu.xmu.artwork.entity.Information;
import cn.edu.xmu.artwork.service.IInformationService;

import com.opensymphony.xwork2.ActionSupport;

@Scope("prototype")
@ParentPackage("json-default")
@Namespace("/")
public class InformationAction extends ActionSupport 
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public List<File> pic;
	public List<String> picContentType;
	public List<String> picFileName;
	
	/*entities*/
	public Information information;
	private DatePos datePos = new DatePos();
	private String colum;
	
	/*services*/
	public IInformationService informationService;
	
	@Action(value="submitInfo", results={@Result(name="success", location="/jsp/success.jsp")})
	public String submitInfo()
	{	
		informationService.submit(getInformation(),getDatePos(),pic, picFileName);
		
		return SUCCESS;
	}


	/*
	 * show the information list for the editor
	 * */
	public String showInforList()
	{
		long id = (long)ServletActionContext.getRequest().getSession().getAttribute("userid");	
		List<Information> list = informationService.showInforList(id);
		ServletActionContext.getRequest().setAttribute("informationList", list);
		return SUCCESS;
	}
	
	@Action(value="showInfoOnHomePage", results={@Result(name="success", location="/index.jsp")})
	public String showInfoOnHomePage()
	{		
		List<Information> list = informationService.getTodayInformations();		
		System.out.println(list.size());
		ServletActionContext.getRequest().setAttribute("informationList", list);
		return SUCCESS;
	}

	@Action(value="getDetailInfo", results={@Result(name="success", location="/jsp/frontside/information/info_detail.jsp")})
	public String getDetailInfo()
	{		
		long id =information.getId();
		Information infor=informationService.findInfoById(id);
		ServletActionContext.getRequest().setAttribute("Information", infor);
		return SUCCESS;
	}
	
	@Action(value="getInfoListByType", results={@Result(name="success", location="/jsp/frontside/information/informations.jsp")})
	public String getInfoListByType()
	{
		informationService.getInfoByColum(datePos.getColum());
		return SUCCESS;
	}
	
	public List<File> getPic() {
		return pic;
	}


	public void setPic(List<File> pic) {
		this.pic = pic;
	}


	public List<String> getPicContentType() {
		return picContentType;
	}


	public void setPicContentType(List<String> picContentType) {
		this.picContentType = picContentType;
	}


	public List<String> getPicFileName() {
		return picFileName;
	}


	public void setPicFileName(List<String> picFileName) {
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


	public DatePos getDatePos() {
		return datePos;
	}


	public void setDatePos(DatePos datePos) {
		this.datePos = datePos;
	}
	
	
	
}
