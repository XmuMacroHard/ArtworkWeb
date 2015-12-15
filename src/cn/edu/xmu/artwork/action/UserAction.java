package cn.edu.xmu.artwork.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.hibernate.exception.ConstraintViolationException;

import cn.edu.xmu.artwork.entity.Artist;
import cn.edu.xmu.artwork.entity.Information;
import cn.edu.xmu.artwork.entity.User;
import cn.edu.xmu.artwork.service.*;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport 
{
	private static final long serialVersionUID = 1L;
	private User user;
	private Artist artist;
	private IUserService userService;
	
	public String login()
	{
		// s = {fail, success, admistratorSuccess}
		String s = userService.login(user);
		return s;
	}
	
	public String register()  
	{
		try {
			userService.register(user);
			return "success";
		} 
		catch (ConstraintViolationException e) {
			String faildetail = "鐢ㄦ埛宸插瓨鍦�";
		    ActionContext.getContext().put("faildetail", faildetail);
			return "fail";
		}
		catch (Exception e) {
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
		userService.submitArtist(artist);
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
	
}
