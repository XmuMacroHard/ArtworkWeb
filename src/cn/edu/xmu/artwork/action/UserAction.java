package cn.edu.xmu.artwork.action;

import java.io.File;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.IUserService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Scope("prototype")
@ParentPackage("struts-default")
@Namespace(value="/")
public class UserAction extends ActionSupport 
{
	private static final long serialVersionUID = 1L;
	public List<File> pic;
	public List<String> picContentType;
	public List<String> picFileName;
	
	@Autowired
	private User user;
	@Autowired
	private Artist artist;
	@Autowired
	private IUserService userService;
	
	@Action(
			value="loginAction", 
			results={
					@Result(name="success", location="/jsp/success.jsp"),
					@Result(name="fail", location="/jsp/fail.jsp")
					}
			)
	public String login()
	{
		User resultUser = userService.login(user);
		if(resultUser == null)
		{
			return "fail";
		}
		else
		{
			return SUCCESS;
		}
	}
	
	@Action(
			value="registerAction",
			results={
					@Result(name="success", location="/jsp/success.jsp"),
					@Result(name="fail", location="/jsp/fail.jsp")
					}		
			)
	public String register()  
	{
		try {
			userService.register(user);
			return "success";
		} 
		catch (ConstraintViolationException e) {
			String faildetail = "Already Exists User!";
			System.out.print("in register Already Exists User!");
		    ActionContext.getContext().put("faildetail", faildetail);
			return "fail";
		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.print("in register fail");
			return "fail";
		}
	}
	
	
	@Action(value="showArtist", results={@Result(name="success", location="/jsp/test/shengartistlist.jsp")})
	public String showArtist()
	{
		List<Artist> list = userService.getArtistList();
		ServletActionContext.getRequest().setAttribute("list", list);
		return SUCCESS;
	}
	
	@Action(value="findArtist", results={@Result(name="success", location="/jsp/test/shenggetArtist_test.jsp")})
	public String findArtist()
	{
		long id =user.getId();
		Artist artist=userService.getArtist(id);
		ServletActionContext.getRequest().setAttribute("artist", artist);
		return SUCCESS;
	}
	
	@Action(value="getArtistBySort", results={@Result(name="success", location="/jsp/test/shengartistlist.jsp")})
	public String getArtistBySort()
	{
		String identification=artist.getIdentification();
		List<Artist> list = userService.getArtistBySort("%"+identification+"%");
		ServletActionContext.getRequest().setAttribute("list", list);
		return SUCCESS;
	}
	
	@Action(value="getArtistByName", results={@Result(name="success", location="/jsp/test/shengartistlist.jsp")})
	public String getArtistByName()
	{
		String realName=artist.getRealName();
		List<Artist> list = userService.getArtistByName("%"+realName+"%");
		ServletActionContext.getRequest().setAttribute("list", list);
		return SUCCESS;
	}
	
	@Action(value="submitArtist", results={@Result(name="success", location="/jsp/test/shengtest.jsp")})
	public String submitArtist()
	{
		userService.submitArtist(getArtist(),pic,picFileName);//,data,dataFileName);
		return SUCCESS;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
	public Artist getArtist() {
		return artist;
	}

	public void setArtist(Artist artist) {
		this.artist = artist;
	}

	public IUserService getUserService() {
		return userService;
	}

	public void setUserService(IUserService userService) {
		this.userService = userService;
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
	
}
